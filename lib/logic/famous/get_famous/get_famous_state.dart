import 'package:freezed_annotation/freezed_annotation.dart';
part 'get_famous_state.freezed.dart';

@freezed
class GetFamousState with _$GetFamousState {
  const factory GetFamousState.initial() = GetFamousStateInitial;
  const factory GetFamousState.loading() = GetFamousStateLoading;
  const factory GetFamousState.success() = GetFamousStateSuccess;
  const factory GetFamousState.error({required String error}) = GetFamousStateError;
}
// flutter pub run build_runner watch --delete-conflicting-outputs