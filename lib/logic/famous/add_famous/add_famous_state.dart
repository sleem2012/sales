import '../../../data/models/famous/famous_types.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
part 'add_famous_state.freezed.dart';

@freezed
class AddFamousState with _$AddFamousState {
  const factory AddFamousState.initial() = AddFamousStateInitial;
  const factory AddFamousState.loading() = AddFamousStateLoading;
  const factory AddFamousState.success() = AddFamousStateSuccess;
  const factory AddFamousState.selectedType({required FamousTypesData famousTypesData}) = AddFamousStateSelectedType;
  const factory AddFamousState.error({required String error}) = AddFamousStateError;
}
// flutter pub run build_runner watch --delete-conflicting-outputs