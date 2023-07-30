import '../../../../packages/shared/error/failures.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
part 'add_famous_attrs_state.freezed.dart';

@freezed
class AddFamousAttrsState with _$AddFamousAttrsState {
  const factory AddFamousAttrsState.initial() = AddFamousAttrsStateInitial;
  const factory AddFamousAttrsState.loading() = AddFamousAttrsStateLoading;
  const factory AddFamousAttrsState.success() = AddFamousAttrsStateSuccess;
  const factory AddFamousAttrsState.error({required KFailure error}) = AddFamousAttrsStateError;
}
// flutter pub run build_runner watch --delete-conflicting-outputs