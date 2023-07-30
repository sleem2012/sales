import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../../data/models/sales_delegate/create_vendor.dart';
import '../../../data/models/sales_delegate/vendor_states/vendor_states.dart';
import '../../../data/repository/sales_delegate/sales_delegate_repo.dart';
import 'add_vendor_state.dart';
import '../../../packages/shared/localization/trans.dart';
import '../../../packages/shared/theme/helper.dart';

import '../../../../packages/shared/error/failures.dart';

class AddVendorBloc extends Cubit<AddVendorState> {
  AddVendorBloc({required this.salesDelegateRepoImp}) : super(const AddVendorState.initial());

  static AddVendorBloc of(BuildContext context) {
    return BlocProvider.of<AddVendorBloc>(context);
  }

  final SalesDelegateRepoImp salesDelegateRepoImp;
  CreateVendorModel createVendorModel = CreateVendorModel();
  KVendorState? vendorState;
  TextEditingController emailCtrl = TextEditingController();
  TextEditingController commercialIDCtrl = TextEditingController();
  TextEditingController entityIdCtrl = TextEditingController();
  TextEditingController compCtrl = TextEditingController();
  TextEditingController ownerCtrl = TextEditingController();
  TextEditingController phoneCtrl = TextEditingController();
  String? reminder;
  bool? stateIsNull;
  int? cityId;
  TextEditingController detailedAddressController = TextEditingController();
  String cCode = '';

  addVendor({required String? company_type}) async {
    if (vendorState == null) {
      stateIsNull = true;
      _update;
      return;
    }
    try {
      sets();
      createVendorModel = createVendorModel.copyWith(
        email: emailCtrl.text,
        company_type: company_type,
        owner: ownerCtrl.text,
        company: compCtrl.text,
        phone: '$cCode${phoneCtrl.text}',
        city_id: cityId,
      );
      if (reminder != null && vendorState?.slug == KVendorState.waiting) {
        createVendorModel = createVendorModel.copyWith(remainder: reminder);
      }
      if (commercialIDCtrl.text.isNotEmpty) {
        createVendorModel = createVendorModel.copyWith(commercialId: commercialIDCtrl.text, entityId: entityIdCtrl.text);
      }

      emit(const AddVendorState.loading());
      final result = await salesDelegateRepoImp.create(createVendorModel);
      result.fold(
        (l) {
          debugPrint('================= add Vendor KFailure $l   ');
          emit(AddVendorState.error(error: KFailure.toError(l)));
        },
        (r) {
          debugPrint('================= add Vendor success   ');
          emit(const AddVendorState.success());
        },
      );
    } catch (e) {
      debugPrint('================= add Vendor Bloc ( Catch ) $e');
      emit(AddVendorState.error(error: Tr.get.something_went_wrong));
    }
  }

  updateVendor(int id) async {
    if (vendorState == null) {
      stateIsNull = true;
      _update;
      return;
    }
    try {
      sets();
      createVendorModel = createVendorModel.copyWith(email: emailCtrl.text);
      if (reminder != null && vendorState?.slug == KVendorState.waiting) {
        createVendorModel = createVendorModel.copyWith(remainder: reminder);
      }
      if (commercialIDCtrl.text.isNotEmpty) {
        createVendorModel = createVendorModel.copyWith(commercialId: commercialIDCtrl.text, entityId: entityIdCtrl.text);
      }
      emit(const AddVendorState.loading());
      final result = await salesDelegateRepoImp.update(createVendorModel);
      result.fold(
        (l) {
          debugPrint('================= add Vendor KFailure $l   ');
          emit(AddVendorState.error(error: KFailure.toError(l)));
        },
        (r) {
          debugPrint('================= add Vendor success   ');
          emit(const AddVendorState.success());
        },
      );
    } catch (e) {
      debugPrint('================= add Vendor Bloc ( Catch ) $e');
      emit(AddVendorState.error(error: Tr.get.something_went_wrong));
    }
  }

  setVendorstate(KVendorState? val) {
    vendorState = val;
    stateIsNull = false;
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

  get _update {
    emit(const AddVendorState.loading());
    emit(const AddVendorState.initial());
  }

  Future<void> setReminder(String? val) async {
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

  selectAddress(BuildContext context) async {
    try {
      final result = await KHelper.showMaps(context);
      if (result != null) {
        // debugPrint(result.cityId.toString());
        cityId = result.cityId;
        // createVendorModel = CreateVendorModel.copyWith(city_id: result.cityId);
        detailedAddressController.text = result.address;
        _update;
      }
    } catch (e) {
      KHelper.showSnackBar(Tr.get.address_is_null);
    }
  }
}
