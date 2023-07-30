import 'package:freezed_annotation/freezed_annotation.dart';
part 'update_locked_company_state.freezed.dart';

@freezed
class UpdateLockedCompanyState with _$UpdateLockedCompanyState {
  const factory UpdateLockedCompanyState.initial() = UpdateLockedCompanyStateInitial;
  const factory UpdateLockedCompanyState.loading() = UpdateLockedCompanyStateLoading;
  const factory UpdateLockedCompanyState.success() = UpdateLockedCompanyStateSuccess;
  const factory UpdateLockedCompanyState.error({required String error}) = UpdateLockedCompanyStateError;
}
// flutter pub run build_runner watch --delete-conflicting-outputs