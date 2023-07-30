import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../cache/locale_storage.dart';
import '../../../shared/error/failures.dart';
import '../../../shared/localization/trans.dart';
import '../../models/category/category_model.dart';
import '../../repo/company/company_repo.dart';
import 'category_state.dart';

class CategoryBloc extends Cubit<CategoryState> {
  CategoryBloc() : super(const CategoryState.initial());

  static CategoryBloc of(BuildContext context) {
    return BlocProvider.of<CategoryBloc>(context);
  }

  CategoryModel? categoryModel;

  List<CategoryData> get canAddFrom {
    final userCategory = KStorage.i.getUserInfo?.data?.categories ?? [];

    return (categoryModel?.categoryData ?? <CategoryData>[])..removeWhere((element) => userCategory.map((e) => e.id).toList().contains(element.id));
  }

  Future getCategories({String? packageId}) async {
    emit(const CategoryState.loading());
    try {
      final result = await CompanyRepoImpl.i.get_category(isProduct: 0, packageId: packageId);
      result.fold(
        (l) {
          emit(CategoryState.error(error: KFailure.toError(l)));
          debugPrint('================= categories (Bloc) : $l  ');
        },
        (r) {
          categoryModel = r;
          emit(CategoryState.success(model: r));
          debugPrint('================= ${r.toJson()} : ');
        },
      );
    } catch (e) {
      debugPrint('================= categories (Bloc) (catch) : $e  ');
      emit(CategoryState.error(error: Tr.get.something_went_wrong));
    }
  }
}
