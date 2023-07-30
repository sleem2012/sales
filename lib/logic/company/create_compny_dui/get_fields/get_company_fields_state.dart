import 'package:freezed_annotation/freezed_annotation.dart';
import '../../../../packages/dynamic_ui/model/dynamic_ui_model.dart';
import '../../../../packages/shared/error/failures.dart';
part 'get_company_fields_state.freezed.dart';

@freezed
class GetCompanyFieldsState with _$GetCompanyFieldsState {
  const factory GetCompanyFieldsState.loading() = GetCompanyFieldsStateLoading;
  const factory GetCompanyFieldsState.success(List<DUIFieldModel> fields) = GetCompanyFieldsStateSuccess;
  const factory GetCompanyFieldsState.error({required KFailure error}) = GetCompanyFieldsStateError;
}
// flutter pub run build_runner watch --delete-conflicting-outputs