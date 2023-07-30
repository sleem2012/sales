import 'package:freezed_annotation/freezed_annotation.dart';

import '../../models/company/company_model.dart';

part 'get_company_state.freezed.dart';

@freezed
class GetCompanyState with _$GetCompanyState {
  const factory GetCompanyState.initial() = GetCompanyStateInitial;

  const factory GetCompanyState.loading() = GetCompanyStateLoading;

  const factory GetCompanyState.success({required CompanyModel model}) = GetCompanyStateSuccess;

  const factory GetCompanyState.error({required String error}) = GetCompanyStateError;
}
