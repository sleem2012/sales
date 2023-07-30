import '../../../data/models/famous/famous_types.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
part 'famous_types_state.freezed.dart';

@freezed
class FamousTypesState with _$FamousTypesState {
  const factory FamousTypesState.initial() = FamousTypesStateInitial;
  const factory FamousTypesState.loading() = FamousTypesStateLoading;
  const factory FamousTypesState.success({required FamousTypes model}) = FamousTypesStateSuccess;
  const factory FamousTypesState.error({required String error}) = FamousTypesStateError;
}
// flutter pub run build_runner watch --delete-conflicting-outputs