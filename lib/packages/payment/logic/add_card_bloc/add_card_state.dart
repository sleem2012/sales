import '../../data/payment/add_payment.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'add_card_state.freezed.dart';

@freezed
class AddCardState with _$AddCardState {
  const factory AddCardState.initial() = AddCardStateInitial;
  const factory AddCardState.loading() = AddCardStateLoading;
  const factory AddCardState.success({required AddPaymentModel model}) = AddCardStateSuccess;
  const factory AddCardState.error({required String error}) = AddCardStateError;
}
// flutter pub run build_runner watch --delete-conflicting-outputs