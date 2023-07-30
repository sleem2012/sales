import 'dart:async';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:geolocator/geolocator.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

import '../shared/error/failures.dart';
import '../shared/picker/loacation/location_serv.dart';
import 'picker_states.dart';

class LocationPickerBloc extends Cubit<LocationPickerState> {
  LocationPickerBloc() : super(const LocationPickerState.loading());

  static LocationPickerBloc of(BuildContext context) {
    return BlocProvider.of<LocationPickerBloc>(context);
  }

  final Completer<GoogleMapController> mapCompleter = Completer();

  Marker? myMarker;
  CameraPosition? myLocation;
  Position? currentPosition;

  Future get init async {
    debugPrint('========init=========   ');
    emit(const LocationPickerState.loading());
    final position = await KLocationService.call();
    position.fold(
      (l) {
        emit(LocationPickerState.error(error: KFailure.toError(l)));
        debugPrint('================= ${KFailure.toError(l)} : ');
      },
      (r) async {
        currentPosition = r;
        myLocation = CameraPosition(target: LatLng(r.latitude, r.longitude), zoom: 10);
        markNewLocation(LatLng(r.latitude, r.longitude));
      },
    );
  }

  markNewLocation(LatLng latLong) {
    myMarker = Marker(
      markerId: const MarkerId('selectedLocation'),
      position: LatLng(latLong.latitude, latLong.longitude),
    );
    emit(LocationPickerState.mark(marker: myMarker!));
    debugPrint("*** lat: ${latLong.latitude} , long: ${latLong.longitude}  ***");
  }
}
