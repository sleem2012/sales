import 'package:bloc/bloc.dart';
import 'package:flutter/cupertino.dart';

import '../../../cache/locale_storage.dart';
import '../../../shared/error/failures.dart';
import '../../../shared/localization/trans.dart';
import '../../models/company/company_model.dart';
import '../../repo/company/company_repo.dart';
import 'get_company_state.dart';

class GetCompanyCubit extends Cubit<GetCompanyState> {
  GetCompanyCubit() : super(const GetCompanyState.initial());

  List<CompanyModel>? companies;

  getCompany() async {
    emit(const GetCompanyState.loading());
    try {
      final result = await CompanyRepoImpl.i.getCompany();
      result.fold(
        (l) {
          emit(GetCompanyState.error(error: KFailure.toError(l)));
          debugPrint('================= company (Bloc) : $l  ');
        },
        (r) {
          debugPrint('================= company success');
          companies = r;
          KStorage.i.setCompany(r.firstOrNull ?? CompanyModel());
          emit(GetCompanyState.success(model: r.firstOrNull ?? CompanyModel()));
        },
      );
    } catch (e) {
      debugPrint('================= company (Bloc) (catch) : $e  ');
      emit(GetCompanyState.error(error: Tr.get.something_went_wrong));
    }
  }
}
