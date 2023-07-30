import 'package:flutter/foundation.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../cache/locale_storage.dart';
import '../../../../shared/error/failures.dart';
import '../../../../shared/localization/trans.dart';
import '../../../models/category/category_model.dart';
import '../../../repo/company/company_repo.dart';
import 'add_category_state.dart';

class AddCategoryCubit extends Cubit<AddCategoryState> {
  AddCategoryCubit() : super(const AddCategoryState.initial());

  static AddCategoryCubit of(context) => BlocProvider.of(context);

  CategoryData? categoryDate;

  List<CategoryData> catIds = [];

  Future<void> setIdsList() async {
    List<int> ids = [];
    for (CategoryData e in catIds) {
      ids.add(e.id ?? -1);
    }

    await addCategory(companyId: (KStorage.i.getUserInfo?.data?.userCompany?.id ?? -1).toString(), ids: ids);
  }

  Future addCategory({required String companyId, required List<int> ids}) async {
    emit(const AddCategoryState.loading());
    try {
      final result = await CompanyRepoImpl.i.addCategory(companyId: companyId, catIds: ids);
      result.fold(
        (l) {
          emit(AddCategoryState.error(error: KFailure.toError(l)));
          debugPrint('================= categories (Bloc) : $l  ');
        },
        (r) {
          categoryDate = r;
          emit(AddCategoryState.success(model: r));
          debugPrint('================= ${r.toJson()} : ');
        },
      );
    } catch (e) {
      debugPrint('================= categories (Bloc) (catch) : $e  ');
      emit(AddCategoryState.error(error: Tr.get.something_went_wrong));
    }
  }
}
