import '../../../data/models/sales_delegate/sales_delegate_model.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
part 'sales_delegate_state.freezed.dart';

@freezed
class GetSalesDelegateState with _$GetSalesDelegateState {
  const factory GetSalesDelegateState.loading() = SalesDelegateStateLoading;
  const factory GetSalesDelegateState.success({required GetSalesDelegateModel model}) = SalesDelegateStateSuccess;
  const factory GetSalesDelegateState.error({required String error}) = SalesDelegateStateError;
}
// flutter pub run build_runner watch --delete-conflicting-outputs