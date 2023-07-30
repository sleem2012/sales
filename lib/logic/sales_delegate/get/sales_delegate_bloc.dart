import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../../data/models/sales_delegate/sales_delegate_model.dart';
import '../../../data/repository/sales_delegate/sales_delegate_repo.dart';
import '../../../packages/shared/localization/trans.dart';

import '../../../../packages/shared/error/failures.dart';
import 'sales_delegate_state.dart';

class GetSalesDelegateBloc extends Cubit<GetSalesDelegateState> {
  GetSalesDelegateBloc({required this.salesDelegateRepoImp}) : super(const GetSalesDelegateState.loading());

  static GetSalesDelegateBloc of(BuildContext context) {
    return BlocProvider.of<GetSalesDelegateBloc>(context);
  }

  final SalesDelegateRepoImp salesDelegateRepoImp;
  GetSalesDelegateModel? salesDelegateModel;

  getVendors() async {
    try {
      emit(const GetSalesDelegateState.loading());

      final result = await salesDelegateRepoImp.get_sales_delegate();
      result.fold(
        (l) {
          emit(GetSalesDelegateState.error(error: KFailure.toError(l)));
        },
        (r) {
          salesDelegateModel = r;
          debugPrint('================= ${r.toJson()} : ');
          emit(GetSalesDelegateState.success(model: r));
        },
      );
    } catch (e) {
      debugPrint('================= Get Vendors Bloc ( Catch ) $e');
      emit(GetSalesDelegateState.error(error: Tr.get.something_went_wrong));
    }
  }
}
