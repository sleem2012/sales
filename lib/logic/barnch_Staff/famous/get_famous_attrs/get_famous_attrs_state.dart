import '../../../../packages/shared/error/failures.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

import '../../../../packages/dynamic_ui/model/dynamic_ui_model.dart';
part 'get_famous_attrs_state.freezed.dart';

@freezed
class GetFamousAttrsState with _$GetFamousAttrsState {
  const factory GetFamousAttrsState.loading() = GetFamousAttrsStateLoading;
  const factory GetFamousAttrsState.success(List<DUIFieldModel> fields) = GetFamousAttrsStateSuccess;
  const factory GetFamousAttrsState.error({required KFailure error}) = GetFamousAttrsStateError;
}
// flutter pub run build_runner watch --delete-conflicting-outputs