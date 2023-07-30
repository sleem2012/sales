import '../../../../packages/shared/error/failures.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
part 'create_company_dui_bloc_state.freezed.dart';

@freezed
class CreateCompanyDuiBlocState with _$CreateCompanyDuiBlocState {
  const factory CreateCompanyDuiBlocState.initial() = CreateCompanyDuiBlocStateInitial;
  const factory CreateCompanyDuiBlocState.loading() = CreateCompanyDuiBlocStateLoading;
  const factory CreateCompanyDuiBlocState.success() = CreateCompanyDuiBlocStateSuccess;
  const factory CreateCompanyDuiBlocState.error({required KFailure error}) = CreateCompanyDuiBlocStateError;
}
// flutter pub run build_runner watch --delete-conflicting-outputs