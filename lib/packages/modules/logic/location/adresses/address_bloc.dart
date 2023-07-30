import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../../../extensions.dart';

import '../../../../shared/localization/trans.dart';
import '../../../models/location/adress_model.dart';
import '../../../repo/global/global_repo.dart';
import '../../../../shared/error/failures.dart';
import 'address_state.dart';

class AddressBloc extends Cubit<AddressState> {
  AddressBloc() : super(const AddressState.initial());

  static AddressBloc of(BuildContext context) {
    return BlocProvider.of<AddressBloc>(context);
  }

  AddressModel? addressModel;
  AddressData? selectedAddress;

  initAddress(String? id) {
    if (id != null) {
      selectedAddress = addressModel?.addressData?.firstWhereOrNull((e) => e.id.toString() == id);

      debugPrint('nnnnnnn${selectedAddress?.detailedAddress}');
    } else {
      return;
    }
  }

  Future getAddress(String? id) async {
    emit(const AddressState.loading());
    try {
      final result = await GlobalRepoImpl.i.getAddresses();
      result.fold(
        (l) {
          debugPrint('================= get Address (Bloc)  :$l ');

          emit(AddressState.error(error: KFailure.toError(l)));
        },
        (r) {
          addressModel = r;
          initAddress(id);
          emit(AddressState.success(model: r));
        },
      );
    } catch (e) {
      debugPrint('================= get Address (Bloc)  :$e ');
      emit(AddressState.error(error: Tr.get.something_went_wrong));
    }
  }
}
