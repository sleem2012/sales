import '../../data/models/commission/commission_model.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'commission_state.freezed.dart';

@freezed
class CommissionState with _$CommissionState {
  const factory CommissionState.initial() = CommissionStateInitial;
  const factory CommissionState.loading() = CommissionStateLoading;
  const factory CommissionState.success({required CommissionModel commissionModel}) = CommissionStateSuccess;
  const factory CommissionState.error({required String error}) = CommissionStateError;
}
// flutter pub run build_runner watch --delete-conflicting-outputs