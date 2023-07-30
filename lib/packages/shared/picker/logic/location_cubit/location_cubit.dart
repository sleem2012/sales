import 'dart:async';

import 'package:dartz/dartz.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:geolocator/geolocator.dart';

import '../../../error/failures.dart';
import '../../../localization/trans.dart';
import '../../loacation/location_serv.dart';
import 'location_state.dart';

class GetLocationCubit extends Cubit<GetLocationState> {
  GetLocationCubit() : super(const GetLocationState.initial());
  static GetLocationCubit of(context) => BlocProvider.of<GetLocationCubit>(context);

  Position? currentPosition;

  Future<Either<KFailure, Position>> initLocation() async {
    try {
      emit(const GetLocationState.loading());
      final position = await KLocationService.call();
      position.fold(
        (l) {
          emit(GetLocationState.error(error: KFailure.toError(l)));
          debugPrint('================= ${KFailure.toError(l)} : ');
        },
        (r) async {
          currentPosition = r;
          emit(GetLocationState.success(pos: currentPosition!));
        },
      );
      return position;
    } catch (e) {
      emit(GetLocationState.error(error: Tr.get.something_went_wrong));
      debugPrint('=================  initLocation : $e ');
      rethrow;
    }
  }
}
