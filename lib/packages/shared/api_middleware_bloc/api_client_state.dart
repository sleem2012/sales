// ignore_for_file: public_member_api_docs, sort_constructors_first

import 'package:freezed_annotation/freezed_annotation.dart';

import '../error/failures.dart';
part 'api_client_state.freezed.dart';

@freezed
class ApiClientState with _$ApiClientState {
  const factory ApiClientState.initial() = ApiClientStateInitial;
  const factory ApiClientState.error({required KFailure failure}) = ApiClientStateError;
}
// flutter pub run build_runner watch --delete-conflicting-outputs