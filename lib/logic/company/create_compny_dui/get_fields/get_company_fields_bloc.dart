import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../../../data/repository/company/company_repo.dart';
import '../../../../packages/shared/error/failures.dart';
import 'get_company_fields_state.dart';

class GetCompanyFieldsBloc extends Cubit<GetCompanyFieldsState> {
  GetCompanyFieldsBloc({required this.companyRepoImpl}) : super(const GetCompanyFieldsState.loading());
  static GetCompanyFieldsBloc of(BuildContext context) => BlocProvider.of<GetCompanyFieldsBloc>(context);
  final CompanyRepoImpl companyRepoImpl;

  get() async {
    try {
      emit(const GetCompanyFieldsState.loading());
      final result = await companyRepoImpl.get_company_fields();
      result.fold(
        (l) {
          debugPrint('================= GetCompanyFields Bloc : ${KFailure.toError(l)}');
          emit(GetCompanyFieldsState.error(error: l));
        },
        (r) {
          debugPrint('================= GetCompanyFields Bloc : ${r.toString()}  ');
          emit(GetCompanyFieldsState.success(r));
        },
      );
    } catch (e) {
      debugPrint('================= GetCompanyFields Bloc (Catch): ${e.toString()} ');
      emit(GetCompanyFieldsState.error(error: KFailure.error(e.toString())));
    }
  }
}
