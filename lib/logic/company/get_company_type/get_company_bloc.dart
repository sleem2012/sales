import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../../packages/modules/models/company/company_model.dart';
import '../../../data/repository/company/company_repo.dart';
import 'get_company_state.dart';
import '../../../packages/shared/localization/trans.dart';

import '../../../../packages/shared/error/failures.dart';

class GetCompanyBloc extends Cubit<GetCompanyState> {
  GetCompanyBloc({required this.companyRepoImpl}) : super(const GetCompanyState.initial());

  static GetCompanyBloc of(BuildContext context) {
    return BlocProvider.of<GetCompanyBloc>(context);
  }

  final CompanyRepoImpl companyRepoImpl;

  // CompanyType? selectedCompany;
  List<CompanyModel>? companyModel;
  // int? packageId;

  Future getCompany({
    int? lock,
    int? user_id,
  }) async {
    emit(const GetCompanyState.loading());
    try {
      final result = await companyRepoImpl.getCompany(
        lock: lock,
        user_id: user_id,
      );
      result.fold(
        (l) {
          emit(GetCompanyState.error(error: KFailure.toError(l)));
          debugPrint('================= Company (Bloc) : $l  ');
        },
        (r) {
          companyModel = r.data;
          emit(GetCompanyState.success(model: r));
          // debugPrint('================= ${r.toJson()} : ');
        },
      );
    } catch (e) {
      debugPrint('================= Company (Bloc) (catch) : $e  ');
      emit(GetCompanyState.error(error: Tr.get.something_went_wrong));
      rethrow;
    }
  }

  // CompanyPackageModel? companyPackageModel;

  // Future getCompanyPackage(String? countryId) async {
  //   emit(const GetCompanyTypeState.loading());
  //   try {
  //     final result = await companyRepoImpl.getCompanyPackage(countryId);
  //     result.fold(
  //       (l) {
  //         debugPrint('================= get CompanyPackage (Bloc)  :$l ');
  //
  //         emit(GetCompanyTypeState.error(error: KFailure.toError(l)));
  //       },
  //       (r) {
  //         companyPackageModel = r;
  //         packageId = r.data!.first.id!;
  //         debugPrint(packageId.toString());
  //         emit(const GetCompanyTypeState.success());
  //       },
  //     );
  //   } catch (e) {
  //     debugPrint('================= get CompanyPackage (Bloc)  :$e ');
  //     emit(GetCompanyTypeState.error(error: Tr.get.something_went_wrong));
  //   }
  // }
  //
  // Future<void> selectCompanyType(CompanyType? company) async {
  //   selectedCompany = company;
  //   debugPrint(selectedCompany!.id.toString());
  //   _update;
  // }
}
