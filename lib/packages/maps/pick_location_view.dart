import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get/get.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

import '../widgets/custom_button.dart';
import '../../views/widgets/error/error_widget.dart';
import '../../views/widgets/loading/loading_overlay.dart';
import '../shared/localization/trans.dart';
import '../shared/theme/text_theme.dart';
import 'pick_location_bloc.dart';
import 'picker_states.dart';

class LocationPicker extends StatelessWidget {
  const LocationPicker({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => LocationPickerBloc()..init,
      child: BlocBuilder<LocationPickerBloc, LocationPickerState>(
        builder: (context, state) {
          return state.map(
            mark: (mark) => SingleChildScrollView(
              child: Column(
                children: [
                  SizedBox(
                    height: 50,
                    child: Center(
                      child: Text(
                        Tr.get.select_address,
                        style: KTextStyle.of(context).title,
                      ),
                    ),
                  ),
                  SizedBox(
                    height: Get.height - 200,
                    width: Get.width,
                    child: GoogleMap(
                      mapType: MapType.normal,
                      onTap: (LatLng latLng) {
                        LocationPickerBloc.of(context).markNewLocation(latLng);
                      },
                      zoomControlsEnabled: true,
                      initialCameraPosition: LocationPickerBloc.of(context).myLocation!,
                      myLocationEnabled: true,
                      markers: {mark.marker},
                      onMapCreated: (GoogleMapController controller) {
                        if (!LocationPickerBloc.of(context).mapCompleter.isCompleted) {
                          LocationPickerBloc.of(context).mapCompleter.complete(controller);
                        }
                      },
                    ),
                  ),
                  KButton(
                    title: Tr.get.save,
                    onPressed: () => Get.back(),
                  ),
                ],
              ),
            ),
            loading: (_) => const KLoadingOverlay(isLoading: true),
            error: (error) => KErrorWidget(
              error: error.error,
              onTryAgain: () => LocationPickerBloc.of(context).init,
            ),
          );
        },
      ),
    );
  }
}
