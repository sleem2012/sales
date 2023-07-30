import 'package:freezed_annotation/freezed_annotation.dart';
part 'country_search_state.freezed.dart';

@freezed
class CountrySearchState with _$CountrySearchState{
  const factory CountrySearchState.initial()=CountrySearchStateInitial;
  const factory CountrySearchState.loading()=CountrySearchStateLoading;
  const factory CountrySearchState.success()=CountrySearchStateSuccess;
  const factory CountrySearchState.error({required String error})=CountrySearchStateError;
}
// flutter pub run build_runner watch --delete-conflict