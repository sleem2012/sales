import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../../data/models/sales_delegate/create_vendor.dart';
import '../../../data/models/sales_delegate/vendor_states/vendor_states.dart';
import '../../../data/repository/sales_delegate/sales_delegate_repo.dart';
import 'update_vendor_state.dart';
import '../../../packages/shared/localization/trans.dart';

import '../../../../packages/shared/error/failures.dart';

class UpdateVendorBloc extends Cubit<UpdateVendorState> {
  UpdateVendorBloc({required this.salesDelegateRepoImp}) : super(const UpdateVendorState.initial());

  static UpdateVendorBloc of(BuildContext context) {
    return BlocProvider.of<UpdateVendorBloc>(context);
  }

  final SalesDelegateRepoImp salesDelegateRepoImp;
  CreateVendorModel createVendorModel = CreateVendorModel();
  KVendorState? vendorState;
  String? reminder;
  bool? stateIsNull;

  updateVendor(int id) async {
    if (vendorState == null) {
      stateIsNull = true;
      _update;
      return;
    }
    try {
      sets();
      if (reminder != null && vendorState?.slug == KVendorState.waiting) {
        createVendorModel = createVendorModel.copyWith(remainder: reminder);
      }
      createVendorModel = createVendorModel.copyWith(id: id);

      emit(const UpdateVendorState.loading());
      final result = await salesDelegateRepoImp.update(createVendorModel);
      result.fold(
        (l) {
          debugPrint('================= update Vendor KFailure $l   ');
          emit(UpdateVendorState.error(error: KFailure.toError(l)));
        },
        (r) {
          debugPrint('================= update Vendor success   ');
          emit(const UpdateVendorState.success());
        },
      );
    } catch (e) {
      debugPrint('================= update Vendor Bloc ( Catch ) $e');
      emit(UpdateVendorState.error(error: Tr.get.something_went_wrong));
    }
  }

  deleteVendor({required int id}) async {
    try {
      emit(const UpdateVendorState.loading());
      final result = await salesDelegateRepoImp.delete(id: id);
      result.fold(
        (l) {
          debugPrint('================= delete Vendor KFailure $l   ');
          emit(UpdateVendorState.error(error: KFailure.toError(l)));
        },
        (r) {
          debugPrint('================= delete Vendor success   ');
          emit(const UpdateVendorState.success());
        },
      );
    } catch (e) {
      debugPrint('================= delete Vendor Bloc ( Catch ) $e');
      emit(UpdateVendorState.error(error: Tr.get.something_went_wrong));
    }
  }

  setVendorstate(KVendorState? val) {
    vendorState = val;
    stateIsNull = false;
    _update;
  }

  setCancelled(String? val) {
    createVendorModel = CreateVendorModel(
      state: vendorState?.slug,
      cancelledReason: val,
    );
    _update;
  }

  setPending() {
    createVendorModel = CreateVendorModel(
      state: vendorState?.slug,
    );
    debugPrint('================= setPending : ${createVendorModel.toJson()}');

    _update;
  }

  setWaitting(String? val) {
    createVendorModel = CreateVendorModel(
      waitingReason: val,
      state: vendorState?.slug,
    );
    _update;
  }

  setRejected(String? val) {
    createVendorModel = CreateVendorModel(
      rejectedReason: val,
      state: vendorState?.slug,
    );
    _update;
  }

  get _update {
    emit(const UpdateVendorState.loading());
    emit(const UpdateVendorState.initial());
  }

  Future<void> setRemider(String? val) async {
    reminder = val;
    _update;
  }

  sets() {
    switch (vendorState?.slug) {
      case KVendorState.pending:
        return setPending();
      default:
        null;
    }
  }
}
