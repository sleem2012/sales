import '../../../packages/modules/models/company/company_response.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
part 'get_company_state.freezed.dart';

@freezed
class GetCompanyState with _$GetCompanyState {
  const factory GetCompanyState.initial() = GetCompanyStateInitial;
  const factory GetCompanyState.loading() = GetCompanyStateLoading;
  const factory GetCompanyState.success({required CompanyResponse model}) = GetCompanyStateSuccess;
  const factory GetCompanyState.error({required String error}) = GetCompanyStateError;
}
// flutter pub run build_runner watch --delete-conflicting-outputs