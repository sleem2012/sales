import 'package:freezed_annotation/freezed_annotation.dart';
part 'add_employee_state.freezed.dart';

@freezed
class AddEmployeeState with _$AddEmployeeState {
  const factory AddEmployeeState.initial() = AddEmployeeStateInitial;
  const factory AddEmployeeState.loading() = AddEmployeeStateLoading;
  const factory AddEmployeeState.success() = AddEmployeeStateSuccess;
  const factory AddEmployeeState.PickImageSuccess() = AddEmployeeStatePickImageSuccess;
  const factory AddEmployeeState.PickImageLoading() = AddEmployeeStatePickImageLoading;
  const factory AddEmployeeState.PickImageError() = AddEmployeeStatePickImageError;
  const factory AddEmployeeState.error({required String error}) = AddEmployeeStateError;
}
// flutter pub run build_runner watch --delete-conflicting-outputs