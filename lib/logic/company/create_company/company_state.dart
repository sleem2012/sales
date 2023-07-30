import 'package:freezed_annotation/freezed_annotation.dart';
part 'company_state.freezed.dart';

@freezed
class CompanyState with _$CompanyState {
  const factory CompanyState.initial() = CompanyStateInitial;
  const factory CompanyState.loading() = CompanyStateLoading;
  const factory CompanyState.success() = CompanyStateSuccess;
  const factory CompanyState.error({required String error}) = CompanyStateError;
}
// flutter pub run build_runner watch --delete-conflicting-outputs