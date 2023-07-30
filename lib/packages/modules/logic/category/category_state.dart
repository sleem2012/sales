import 'package:freezed_annotation/freezed_annotation.dart';

import '../../models/category/category_model.dart';

part 'category_state.freezed.dart';

@freezed
class CategoryState with _$CategoryState {
  const factory CategoryState.initial() = CategoryStateInitial;
  const factory CategoryState.loading() = CategoryStateLoading;
  const factory CategoryState.success({required CategoryModel model}) = CategoryStateSuccess;
  const factory CategoryState.error({required String error}) = CategoryStateError;
}
// flutter pub run build_runner watch --delete-conflicting-outputs
