import 'package:freezed_annotation/freezed_annotation.dart';
part 'add_payment_state.freezed.dart';

@freezed
class AddPaymentState with _$AddPaymentState {
  const factory AddPaymentState.initial() = AddPaymentStateInitial;
  const factory AddPaymentState.loading() = AddPaymentStateLoading;
  const factory AddPaymentState.success() = AddPaymentStateSuccess;
  const factory AddPaymentState.error({required String error}) = AddPaymentStateError;
}
// flutter pub run build_runner watch --delete-conflicting-outputs