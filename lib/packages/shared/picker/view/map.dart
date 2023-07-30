import 'dart:async';
import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:http/http.dart' as http;
// import 'package:location/location.dart' as lc;
import 'package:uuid/uuid.dart';

import '../../../../di.dart';
import '../../../../logic/nav_enforcer/nav_enforcer_bloc.dart';
import '../../../../packages/extensions.dart';
import '../../theme/colors.dart';
import '../../theme/logger.dart';
import '../data/country_search_model/address_result.dart';
import '../data/country_search_model/detailed_address_model.dart';
import '../logic/country_search_cubit/country_search_cubit.dart';
import '../logic/country_search_cubit/country_search_state.dart';
import '../logic/location_cubit/location_cubit.dart';
import '../logic/location_cubit/location_state.dart';

class MapScreen extends StatefulWidget {
  final Widget pinWidget;
  final String apiKey;
  final LatLng initialLocation;
  final String appBarTitle;
  final String searchHint;
  final String addressTitle;
  final String confirmButtonText;
  final String language;
  final String country;
  final String addressPlaceHolder;
  final Color confirmButtonColor;
  final Color pinColor;
  final Color confirmButtonTextColor;

  const MapScreen({
    Key? key,
    required this.apiKey,
    required this.appBarTitle,
    required this.searchHint,
    required this.addressTitle,
    required this.confirmButtonText,
    required this.language,
    this.country = "",
    required this.confirmButtonColor,
    required this.pinColor,
    required this.confirmButtonTextColor,
    required this.addressPlaceHolder,
    required this.pinWidget,
    required this.initialLocation,
  }) : super(key: key);

  @override
  State<MapScreen> createState() => MapScreenState();
}

class MapScreenState extends State<MapScreen> {
  Completer<GoogleMapController> mapsCompleter = Completer();
  bool loading = false;
  String _state = "";
  LatLng? _latLng;
  String? _shortName = "";

  GMDetailedAddressModel? model;

  // Position? locationData;

  AddressResult? addressResult = AddressResult(latLng: const LatLng(0, 0), address: '', zipcode: '');

  AddressComponents? filterByKey(String key) {
    GMAddressResults? result = (model?.results ?? []).firstWhereOrNull((element) {
      return (element.addressComponents ?? []).where((ac) => ac.types?.contains(key) ?? false).isNotEmpty;
    });
    return result?.addressComponents?.firstWhereOrNull((element) => (element.types ?? []).where((e) => e == key).isNotEmpty);
  }

  Future<void> getAddress(LatLng? location) async {
    try {
      final endpoint = 'https://maps.googleapis.com/maps/api/geocode/json?latlng=${location?.latitude},${location?.longitude}'
          '&region=eg&country=egypt&key=${widget.apiKey}&language=en';
      debugPrint('=====================>$endpoint<========================');
      final response = jsonDecode((await http.get(Uri.parse(endpoint))).body);
      model = GMDetailedAddressModel.fromJson(response);
      setState(() {
        addressResult = addressResult?.copyWith(
          latLng: _latLng!,
          address: (response['results'] as List).firstOrNull?['formatted_address'],
          zipcode: filterByKey("postal_code")?.longName ?? '',
          street: filterByKey("route")?.longName,
        );
        _state = filterByKey('administrative_area_level_2')?.longName ?? '';
        final c = filterByKey("country");
        printMap(c?.toJson());
        _shortName = c?.shortName;
        debugPrint('================= short name  :$_shortName ');
      });
    } catch (e) {
      debugPrint('================ getAddress =>>$e  ');
      rethrow;
    }

    if (mounted) {
      setState(() => loading = false);
    }
  }

  @override
  void initState() {
    super.initState();
    _latLng = widget.initialLocation;
    final position = GetLocationCubit.of(context).currentPosition;
    getAddress(LatLng(position?.latitude ?? _latLng?.latitude ?? 0.0, position?.longitude ?? _latLng?.latitude ?? 0.0)).then(
      (value) {
        setState(() {});
        debugPrint('&&&&&&&${addressResult?.address}');
        if (_state != '' && _shortName != '') {
          CountrySearchCubit.of(context).search('locations', _shortName ?? '', _state);
        }
      },
    );
  }

  CameraPosition cameraPosition() {
    final CameraPosition myCurrentLocationCameraPosition = CameraPosition(
      target: LatLng(
        GetLocationCubit.of(context).currentPosition?.latitude ?? 0,
        GetLocationCubit.of(context).currentPosition?.longitude ?? 0,
      ),
      zoom: 16,
    );
    return myCurrentLocationCameraPosition;
  }

  @override
  Widget build(BuildContext context) {
    debugPrint('===========sssss====== ${GetLocationCubit.of(context).currentPosition} : ');
    return WillPopScope(
      onWillPop: () async {
        GetLocationCubit.of(context).currentPosition = null;
        return true;
      },
      child: Scaffold(
        body: SafeArea(
          child: BlocBuilder<GetLocationCubit, GetLocationState>(
            builder: (context, state) {
              final initialLocation = GetLocationCubit.of(context);
              return Stack(
                children: [
                  GetLocationCubit.of(context).currentPosition == null
                      ? const Center(child: CircularProgressIndicator())
                      : Builder(
                          builder: (context) {
                            return GoogleMap(
                              // minMaxZoomPreference: const MinMaxZoomPreference(0, 16),
                              mapType: MapType.hybrid,
                              initialCameraPosition: cameraPosition(),
                              myLocationButtonEnabled: false,
                              rotateGesturesEnabled: true,
                              scrollGesturesEnabled: true,
                              tiltGesturesEnabled: true,
                              zoomGesturesEnabled: true,
                              onCameraMoveStarted: () {
                                setState(() {
                                  loading = true;
                                });
                              },
                              onCameraMove: (p) {
                                _latLng = LatLng(p.target.latitude, p.target.longitude);
                              },
                              onCameraIdle: () async {
                                getAddress(_latLng).then((value) {
                                  if (_state != '' && _shortName != '') {
                                    CountrySearchCubit.of(context).search('locations', _shortName ?? '', _state);
                                  }
                                });
                              },
                              onMapCreated: (GoogleMapController controller) async {
                                if (!mapsCompleter.isCompleted) {
                                  mapsCompleter.complete(controller);
                                  // controller.moveCamera(
                                  //   CameraUpdate.newLatLngBounds(egyptBounds.contains(point), 0),
                                  // );
                                }
                              },
                            );
                          },
                        ),
                  Positioned(
                    bottom: 0,
                    child: Container(
                      color: Colors.transparent,
                      width: MediaQuery.of(context).size.width,
                      child: Card(
                        margin: const EdgeInsets.all(0),
                        shape: const RoundedRectangleBorder(
                          borderRadius: BorderRadius.only(topLeft: Radius.circular(20), topRight: Radius.circular(20)),
                        ),
                        child: Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 18.0),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              const SizedBox(height: 6),
                              Align(
                                alignment: Alignment.center,
                                child: Container(
                                  height: 4,
                                  width: 40,
                                  decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(10),
                                    color: Colors.grey.withOpacity(0.6),
                                  ),
                                ),
                              ),
                              const SizedBox(height: 18),
                              // Text(
                              //   widget.addressTitle,
                              //   style: const TextStyle(color: Colors.grey),
                              // ),
                              const SizedBox(height: 8),

                              Text(
                                addressResult?.address == "" ? widget.addressPlaceHolder : addressResult?.address ?? '',
                              ),
                              const SizedBox(height: 8),
                              if (!loading)
                                BlocBuilder<CountrySearchCubit, CountrySearchState>(
                                  builder: (context, state) {
                                    final search = CountrySearchCubit.of(context);
                                    return GestureDetector(
                                      onTap: () {
                                        addressResult = addressResult?.copyWith(
                                          state: search.countrySearchModel?.city?.name?.value,
                                          country: search.countrySearchModel?.country?.name?.value,
                                          cityId: search.countrySearchModel?.city?.id,
                                          countryId: search.countrySearchModel?.country?.id,
                                        );
                                        Nav.back(result: addressResult);
                                        GetLocationCubit.of(context).currentPosition = null;
                                      },
                                      child: state.maybeWhen(
                                        orElse: () => SizedBox(
                                          height: 50,
                                          child: Card(
                                            color: KColors.of(context).accentColor,
                                            shape: const RoundedRectangleBorder(borderRadius: BorderRadius.all(Radius.circular(6))),
                                            child: Center(
                                              child: Text(
                                                widget.confirmButtonText,
                                                style: const TextStyle(color: Colors.white, fontWeight: FontWeight.w700),
                                              ),
                                            ),
                                          ),
                                        ),
                                        loading: () => const Center(child: CircularProgressIndicator()),
                                      ),
                                    );
                                  },
                                ),
                              const SizedBox(height: 30),
                            ],
                          ),
                        ),
                      ),
                    ),
                  ),
                  Positioned(
                    top: 0,
                    left: 10,
                    right: 10,
                    child: GestureDetector(
                      onTap: () async {
                        // searchPlace();
                        var result = await Nav.to(
                          SearchPage(
                            language: widget.language,
                            apiKey: widget.apiKey,
                            searchPlaceHolder: widget.searchHint,
                          ),
                        );
                        if (result != null) {
                          final location = await getPlace(result);
                          CameraPosition cPosition = CameraPosition(
                            zoom: 16.0,
                            target: LatLng(double.parse(location['lat'].toString()), double.parse(location['lng'].toString())),
                          );
                          final GoogleMapController controller = await mapsCompleter.future;
                          controller.animateCamera(CameraUpdate.newCameraPosition(cPosition)).then((value) {});
                        }
                      },
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Card(
                            color: Colors.white,
                            child: IconButton(
                              onPressed: () async {
                                // final locationData =
                                //     await LocationHelper.determinePosition();
                                final GoogleMapController controller = await mapsCompleter.future;
                                // log(locationData.latitude.toString());
                                CameraPosition cPosition = CameraPosition(
                                  zoom: 16.0,
                                  target: LatLng(initialLocation.currentPosition?.latitude ?? 0, initialLocation.currentPosition?.longitude ?? 0),
                                );
                                controller.animateCamera(CameraUpdate.newCameraPosition(cPosition)).then((value) {});
                              },
                              icon: const Icon(
                                Icons.my_location,
                                color: Color(0xffFFCA27),
                              ),
                              iconSize: 20,
                            ),
                          ),
                          Container(
                            width: MediaQuery.of(context).size.width - 90,
                            height: 80,
                            padding: const EdgeInsets.symmetric(horizontal: 18, vertical: 10),
                            child: Card(
                              shape: const RoundedRectangleBorder(borderRadius: BorderRadius.all(Radius.circular(6))),
                              child: Padding(
                                padding: const EdgeInsets.symmetric(vertical: 8.0, horizontal: 18),
                                child: Row(
                                  children: [
                                    const Icon(
                                      Icons.search,
                                      size: 22,
                                    ),
                                    const SizedBox(
                                      width: 10,
                                    ),
                                    Text(
                                      widget.searchHint,
                                      style: const TextStyle(color: Colors.grey, fontSize: 15),
                                    ),
                                  ],
                                ),
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                  Center(child: widget.pinWidget)
                ],
              );
            },
          ),
        ),
      ),
    );
  }

  getPlace(placeId) async {
    String baseURL = 'https://maps.googleapis.com/maps/api/place/details/json';
    String request = '$baseURL?place_id=$placeId&key=${widget.apiKey}&language=${widget.language}&region=eg';
    var response = await http.get(Uri.parse(request));

    if (response.statusCode == 200) {
      var res = json.decode(response.body);
      return res['result']['geometry']['location'];
    } else {
      throw Exception('Failed to load predictions');
    }
  }
}

class SearchPage extends StatefulWidget {
  final String language;
  final String apiKey;
  final String searchPlaceHolder;

  const SearchPage({Key? key, required this.language, required this.apiKey, required this.searchPlaceHolder}) : super(key: key);

  @override
  State<SearchPage> createState() => _SearchPageState();
}

class _SearchPageState extends State<SearchPage> {
  final mapsCompleter = TextEditingController();
  var uuid = const Uuid();
  String? _sessionToken;
  List<dynamic> _placeList = [];

  @override
  void initState() {
    super.initState();
    mapsCompleter.addListener(() {
      _onChanged();
    });
  }

  void _onChanged() {
    if (_sessionToken == null) {
      setState(() {
        _sessionToken = uuid.v4();
      });
    }
    getSuggestion(mapsCompleter.text);
  }

  void getSuggestion(String input) async {
    try {
      String baseURL = 'https://maps.googleapis.com/maps/api/place/autocomplete/json';
      String request = '$baseURL?input=$input&key=${widget.apiKey}&sessiontoken=$_sessionToken&language=ar&region=eg';
      var response = await http.get(Uri.parse(request));
      if (response.statusCode == 200) {
        setState(() {
          _placeList = json.decode(response.body)['predictions'];
        });
      } else {
        throw Exception('Failed to load predictions');
      }
    } catch (e) {
      debugPrint('================= $e  ');
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          const SizedBox(
            height: 40,
          ),
          Container(
            width: MediaQuery.of(context).size.width,
            padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 10),
            child: Wrap(
              children: [
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 10.0, vertical: 10),
                  child: Row(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      GestureDetector(
                        onTap: () {
                          Nav.back();
                        },
                        child: const Icon(Icons.arrow_back, size: 18),
                      ),
                      const SizedBox(width: 10),
                      Expanded(
                        child: TextField(
                          controller: mapsCompleter,
                          decoration: InputDecoration(
                            border: InputBorder.none,
                            hintText: widget.searchPlaceHolder,
                            hintStyle: const TextStyle(color: Colors.grey),
                            contentPadding: const EdgeInsets.all(8),
                          ),
                        ),
                      )
                    ],
                  ),
                ),
              ],
            ),
          ),
          ListView.builder(
            shrinkWrap: true,
            itemCount: _placeList.length,
            itemBuilder: (ctx, i) {
              return GestureDetector(
                onTap: () {
                  Nav.back(result: _placeList[i]["place_id"]);
                },
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      children: [
                        const SizedBox(
                          width: 10,
                        ),
                        const Icon(
                          Icons.location_pin,
                          size: 18,
                          color: Colors.grey,
                        ),
                        const SizedBox(
                          width: 10,
                        ),
                        Padding(
                          padding: const EdgeInsets.symmetric(vertical: 8.0),
                          child: SizedBox(
                            width: MediaQuery.of(context).size.width - 60,
                            child: Text(
                              _placeList[i]["description"],
                              overflow: TextOverflow.ellipsis,
                            ),
                          ),
                        ),
                      ],
                    ),
                    const Divider()
                  ],
                ),
              );
            },
          )
        ],
      ),
    );
  }
}

Future<AddressResult> showGoogleMapLocationPicker({
  required BuildContext context,
  required Widget pinWidget,
  required String apiKey,
  required String appBarTitle,
  required String searchHint,
  required String addressTitle,
  required LatLng initialLocation,
  required String confirmButtonText,
  required String language,
  required String country,
  required String addressPlaceHolder,
  required Color confirmButtonColor,
  required Color pinColor,
  required Color confirmButtonTextColor,
}) async {
  final pickedLocation = await Nav.to(
    BlocProvider(
      create: (context) => Di.countrySearchCubit,
      child: MapScreen(
        apiKey: apiKey,
        pinWidget: pinWidget,
        appBarTitle: appBarTitle,
        searchHint: searchHint,
        addressTitle: addressTitle,
        confirmButtonText: confirmButtonText,
        language: language,
        confirmButtonColor: confirmButtonColor,
        pinColor: pinColor,
        confirmButtonTextColor: confirmButtonTextColor,
        addressPlaceHolder: addressPlaceHolder,
        initialLocation: initialLocation,
      ),
    ),
  );
  return pickedLocation;
}
