import '../../../../packages/shared/error/failures.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'internal_employee_state.freezed.dart';

@freezed
class InternalEmployeeState with _$InternalEmployeeState {
  const factory InternalEmployeeState.initial() = InternalEmployeeStateInitial;

  const factory InternalEmployeeState.loading() = InternalEmployeeStateLoading;

  const factory InternalEmployeeState.success() = InternalEmployeeStateSuccess;

  const factory InternalEmployeeState.error({required KFailure error}) = InternalEmployeeStateError;
}
// flutter pub run build_runner watch --delete-conflicting-outputs
