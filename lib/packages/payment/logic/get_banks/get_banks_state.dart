import '../../../payment/data/payment/banks_model.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
part 'get_banks_state.freezed.dart';

@freezed
class GetBanksState with _$GetBanksState {
  const factory GetBanksState.loading() = GetBanksStateLoading;
  const factory GetBanksState.success(BanksModel model) = GetBanksStateSuccess;
  const factory GetBanksState.error({required String error}) = GetBanksStateError;
}
// flutter pub run build_runner watch --delete-conflicting-outputs