import 'package:freezed_annotation/freezed_annotation.dart';

import '../../../../packages/dynamic_ui/model/dynamic_ui_model.dart';
import '../../../../packages/shared/error/failures.dart';
part 'get_fields_state.freezed.dart';

@freezed
class InternalEmpFieldsState with _$InternalEmpFieldsState {
  const factory InternalEmpFieldsState.loading() = InternalEmpFieldsStateLoading;
  const factory InternalEmpFieldsState.success(List<DUIFieldModel> fields) = InternalEmpFieldsStateSuccess;
  const factory InternalEmpFieldsState.error({required KFailure error}) = InternalEmpFieldsStateError;
}
// flutter pub run build_runner watch --delete-conflicting-outputs