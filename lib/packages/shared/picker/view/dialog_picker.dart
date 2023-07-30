import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:pinput/pinput.dart';

import '../../../../packages/shared/error/failures.dart';
import '../../../extensions.dart';
import '../../../modules/logic/location/location/location_bloc.dart';
import '../../../modules/logic/location/location/location_state.dart';
import '../../../modules/models/location/cities_model.dart';
import '../../../modules/models/location/countries_model.dart';
import '../../../widgets/city_picker_widget.dart';
import '../../../widgets/custom_button.dart';
import '../../../widgets/save_or_cancel_button.dart';
import '../../../widgets/text_field.dart';
import '../../localization/trans.dart';
import '../../theme/helper.dart';
import '../../theme/theme_data.dart';
import '../data/country_search_model/address_result.dart';
import '../logic/location_cubit/location_cubit.dart';
import '../logic/location_cubit/location_state.dart';

// ignore: must_be_immutable
class AddLocationDetails extends StatefulWidget {
  AddLocationDetails({Key? key, this.initialData, required this.onSave}) : super(key: key);
  AddressResult? initialData;
  final Function(AddressResult? result) onSave;

  @override
  State<AddLocationDetails> createState() => _AddLocationDetailsState();
}

class _AddLocationDetailsState extends State<AddLocationDetails> {
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  final TextEditingController detailedAddressController = TextEditingController();
  final TextEditingController stateController = TextEditingController();
  final TextEditingController streetController = TextEditingController();
  final TextEditingController buildingController = TextEditingController();
  final TextEditingController intercomController = TextEditingController();
  final TextEditingController floorController = TextEditingController();
  final TextEditingController zipcodeController = TextEditingController();
  final TextEditingController countryController = TextEditingController();
  String? cityId;
  String? countryId;
  CountriesDatum? selectedCountry;
  CitiesDatum? selectedCity;
  AddressResult? initialData;

  selectAddress() async {
    GetLocationCubit.of(context).initLocation().then((value) async {
      value.fold(
        (l) => KHelper.showSnackBar(KFailure.toError(l)),
        (r) async {
          {
            try {
              initialData = await KHelper.showMaps(context);
              setValues(initialData);
            } catch (e) {
              KHelper.showSnackBar(Tr.get.address_is_null);
            }
          }
        },
      );
    });
  }

  setValues(AddressResult? result) async {
    if (result != null) {
      debugPrint('========= %%% ${result.countryId.toString()}');
      setState(() {});
      detailedAddressController.text = result.address;
      zipcodeController.setText(result.zipcode);
      streetController.setText(result.street ?? '');
      stateController.setText(result.state ?? '');
      countryController.setText(result.country ?? '');
      intercomController.setText(result.intercome ?? widget.initialData?.intercome ?? '');
      buildingController.setText(result.building ?? widget.initialData?.building ?? '');
      floorController.setText(result.floor ?? widget.initialData?.floor ?? '');
      cityId = result.cityId.toString();
      countryId = result.countryId?.toString();
      if (countryId != null) {
        if (context.mounted) {
          selectedCountry = (LocationBloc.of(context).countriesModel?.data ?? []).firstWhereOrNull(
            (element) => element.id == int.tryParse(countryId ?? '-1'),
          );
          await LocationBloc.of(context).getCities(selectedCountry?.id.toString() ?? '-1');
        }
      }
    }
  }

  @override
  void dispose() {
    stateController.dispose();
    streetController.dispose();
    buildingController.dispose();
    intercomController.dispose();
    floorController.dispose();
    zipcodeController.dispose();
    countryController.dispose();
    super.dispose();
  }

  @override
  void initState() {
    initialData = widget.initialData;
    setValues(initialData);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Material(
        color: Colors.transparent,
        child: Container(
          margin: MediaQuery.of(context).viewInsets,
          padding: const EdgeInsets.symmetric(horizontal: KHelper.hPadding).copyWith(bottom: 20),
          decoration: KHelper.of(context).filled,
          child: Form(
            key: _formKey,
            child: SingleChildScrollView(
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  Text(Tr.get.add_location),
                  const SizedBox(height: 10),
                  BlocBuilder<GetLocationCubit, GetLocationState>(
                    builder: (context, state) {
                      return state is GetLocationLoading ? const Center(child: CircularProgressIndicator()) : KButton(title: Tr.get.open_map, onPressed: selectAddress);
                    },
                  ),
                  10.h,
                  KTextFormField(
                    enabled: false,
                    controller: detailedAddressController,
                    hintText: Tr.get.address,
                    validator: (value) {
                      if (value!.isEmpty) {
                        return Tr.get.address_validation;
                      }
                      return null;
                    },
                  ),
                  10.h,
                  BlocListener<LocationBloc, LocationState>(
                    listener: (context, state) {
                      state.whenOrNull(
                        success: () {
                          if (LocationBloc.of(context).citiesModel != null) {
                            selectedCity = (LocationBloc.of(context).citiesModel?.data ?? []).firstWhereOrNull((element) => element.id.toString() == cityId);
                          }
                        },
                      );
                    },
                    child: BlocBuilder<LocationBloc, LocationState>(
                      builder: (context, state) {
                        return Theme(
                          data: KThemeData.of(context).themeData,
                          child: CityPickerWidget(
                            initialCity: selectedCity,
                            initialCountry: selectedCountry,
                            onCityChanged: (value) {},
                            onCountryChanged: (value) {
                              debugPrint(value?.id.toString());
                              selectedCountry = value;
                              selectedCity = null;

                              if (value != null) {
                                LocationBloc.of(context).getCities("${value.id}");
                              }
                            },
                          ),
                        );
                      },
                    ),
                  ),
                  10.h,
                  KTextFormField(
                    controller: streetController,
                    hintText: Tr.get.street,
                    validator: (value) {
                      if (value!.isEmpty) {
                        return Tr.get.street_validation;
                      }
                      return null;
                    },
                  ),
                  10.h,
                  KTextFormField(
                    controller: zipcodeController,
                    hintText: Tr.get.zipcode,
                    validator: (value) {
                      if (value!.isEmpty) {
                        return Tr.get.zipcode_validation;
                      }
                      return null;
                    },
                  ),
                  10.h,
                  KTextFormField(
                    controller: buildingController,
                    hintText: Tr.get.building,
                    validator: (value) {
                      if (value!.isEmpty) {
                        return Tr.get.building_validation;
                      }
                      return null;
                    },
                  ),
                  10.h,
                  KTextFormField(
                    controller: intercomController,
                    hintText: Tr.get.intercom,
                    validator: (value) {
                      if (value!.isEmpty) {
                        return Tr.get.intercom_validation;
                      }
                      return null;
                    },
                  ),
                  10.h,
                  KTextFormField(
                    controller: floorController,
                    hintText: Tr.get.floor,
                    validator: (value) {
                      if (value!.isEmpty) {
                        return Tr.get.floor_validation;
                      }
                      return null;
                    },
                  ),
                  10.h,
                  SaveOrCancelButton(
                    onPressed: () {
                      if (!_formKey.currentState!.validate()) {
                        return;
                      } else {
                        initialData = initialData?.copyWith(floor: floorController.text, intercome: intercomController.text, building: buildingController.text);
                        debugPrint(initialData?.cityId.toString());
                        debugPrint(initialData?.countryId.toString());
                        widget.onSave.call(initialData);
                      }
                    },
                  ),
                  const SizedBox(height: 30),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
