import 'package:freezed_annotation/freezed_annotation.dart';

import '../../../models/category/category_model.dart';

part 'add_category_state.freezed.dart';

@freezed
class AddCategoryState with _$AddCategoryState {
  const factory AddCategoryState.initial() = AddCategoryStateInitial;
  const factory AddCategoryState.loading() = AddCategoryStateLoading;
  const factory AddCategoryState.success({required CategoryData model}) = AddCategoryStateSuccess;
  const factory AddCategoryState.error({required String error}) = AddCategoryStateError;
}
// flutter pub run build_runner watch --delete-conflicting-outputs
