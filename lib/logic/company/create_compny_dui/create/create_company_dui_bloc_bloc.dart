import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../data/repository/company/company_repo.dart';
import '../../../../packages/shared/error/failures.dart';
import 'create_company_dui_bloc_state.dart';

class CreateCompanyDuiBlocBloc extends Cubit<CreateCompanyDuiBlocState> {
  CreateCompanyDuiBlocBloc({required this.companyRepoImpl}) : super(const CreateCompanyDuiBlocState.initial());

  static CreateCompanyDuiBlocBloc of(BuildContext context) => BlocProvider.of<CreateCompanyDuiBlocBloc>(context);

  final CompanyRepoImpl companyRepoImpl;

  create(Map<String, dynamic> values) async {
    try {
      final sorted = values.entries.toList()..sort((a, b) => (int.tryParse(a.key) ?? 0).compareTo((int.tryParse(b.key) ?? 0)));
      Map<String, dynamic> delivery_attrs = {};

      for (var element in sorted) {
        ///PAyment key 18
        var x = {"answer_collections[${element.key}]": element.value};
        delivery_attrs.addAll(x);
      }

      emit(const CreateCompanyDuiBlocState.loading());
      final result = await companyRepoImpl.create_dui_company(values: delivery_attrs);
      result.fold(
        (l) {
          debugPrint('================= CreateCompanyDuiBloc Bloc : ${KFailure.toError(l)}');
          emit(CreateCompanyDuiBlocState.error(error: l));
        },
        (r) {
          debugPrint('================= CreateCompanyDuiBloc Bloc : ${r.toString()}  ');
          emit(const CreateCompanyDuiBlocState.success());
        },
      );
    } catch (e) {
      debugPrint('================= CreateCompanyDuiBloc Bloc (Catch): ${e.toString()} ');
      emit(const CreateCompanyDuiBlocState.error(error: KFailure.someThingWrongPleaseTryAgain()));
    }
  }
}
