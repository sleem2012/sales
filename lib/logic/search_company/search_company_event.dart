import 'package:freezed_annotation/freezed_annotation.dart';
part 'search_company_event.freezed.dart';

@freezed
class SearchEvent with _$SearchEvent {
  const factory SearchEvent.search({required String qry, required int srvId}) = SearchEventSearch;
  const factory SearchEvent.api({required String qry, required int srvId}) = SearchEventApi;
}

@freezed
class SearchState with _$SearchState {
  const factory SearchState.initial() = SearchStateInitial;
  const factory SearchState.loading() = SearchStateLoading;
  const factory SearchState.success() = SearchStateSuccess;
  const factory SearchState.error({required String error}) = SearchStateError;
}
// flutter pub run build_runner watch --delete-conflicting-outputs