import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../packages/shared/error/failures.dart';
import '../../../shared/localization/trans.dart';
import '../../data/payment/vendor_commission.dart';
import '../../data/payment_repo.dart';
import 'get_vendor_commission_state.dart';

class GetVendorCommissionBloc extends Cubit<GetVendorCommissionState> {
  GetVendorCommissionBloc() : super(const GetVendorCommissionState.loading());

  static GetVendorCommissionBloc of(BuildContext context) => BlocProvider.of<GetVendorCommissionBloc>(context);

  CommissionModel? commissionModel;

  get({String? date}) async {
    try {
      emit(const GetVendorCommissionState.loading());
      final result = await PayemntRepoImpl.i.getCommissions(date: date ?? selectedDate.toString().split(' ').first);
      result.fold(
        (l) {
          debugPrint('================= GetVendorCommission Bloc : ${KFailure.toError(l)}');
          emit(GetVendorCommissionState.error(error: KFailure.toError(l)));
        },
        (r) {
          commissionModel = r;
          emit(const GetVendorCommissionState.success());
        },
      );
    } catch (e) {
      debugPrint('================= GetVendorCommission Bloc (Catch): ${e.toString()} ');
      emit(GetVendorCommissionState.error(error: Tr.get.something_went_wrong));
      rethrow;
    }
  }

  String get currency {
    if ((commissionModel?.data ?? []).isNotEmpty) {
      return commissionModel?.data?.first.currency ?? 'USD';
    } else if (commissionModel?.general?.pending != null) {
      return commissionModel?.general?.pending?.amount?.split(' ').last ?? "USD";
    } else if (commissionModel?.general?.completed != null) {
      return commissionModel?.general?.completed?.amount?.split(' ').last ?? "USD";
    } else {
      return "USD";
    }
  }

  DateTime selectedDate = DateTime.now().subtract(const Duration(days: 7));
  DateTime lastDate = DateTime.now().subtract(const Duration(days: 1));
  pickDate(BuildContext context) async {
    final date = await showDatePicker(
      context: context,
      initialDate: selectedDate,
      firstDate: DateTime(1900),
      lastDate: lastDate,
    );
    if (date != null && date != selectedDate) {
      selectedDate = date;
      debugPrint('================= ${selectedDate.toString().split(' ').first}');
      get(date: selectedDate.toString().split(' ').first);
    }
  }

  /// get _update {
  ///   emit(const GetVendorCommissionState.loading());
  ///   emit(const GetVendorCommissionState.success());
  /// }
}
