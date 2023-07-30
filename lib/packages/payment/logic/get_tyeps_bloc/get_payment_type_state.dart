import '../../data/payment/payment_type_model.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
part 'get_payment_type_state.freezed.dart';

@freezed
class GetPaymentTypeState with _$GetPaymentTypeState {
  const factory GetPaymentTypeState.initial() = GetPaymentStateInitial;
  const factory GetPaymentTypeState.loading() = GetPaymentStateLoading;
  const factory GetPaymentTypeState.success({required PaymentTypesModel paymentTypesModel}) = GetPaymentStateSuccess;
  const factory GetPaymentTypeState.error({required String error}) = GetPaymentStateError;
}
// flutter pub run build_runner watch --delete-conflicting-outputs