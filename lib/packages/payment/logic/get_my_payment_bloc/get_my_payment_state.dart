import '../../data/payment/my_payment_model.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
part 'get_my_payment_state.freezed.dart';

@freezed
class MyPaymentsState with _$MyPaymentsState {
  const factory MyPaymentsState.loading() = MyPaymentsStateLoading;
  const factory MyPaymentsState.success({required MyPaymentsModel myPaymentsModel}) = MyPaymentsStateSuccess;
  const factory MyPaymentsState.error({required String error}) = MyPaymentsStateError;
}
// flutter pub run build_runner watch --delete-conflicting-outputs