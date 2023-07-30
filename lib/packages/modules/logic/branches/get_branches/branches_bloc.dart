import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../cache/locale_storage.dart';
import '../../../../shared/error/failures.dart';
import '../../../../shared/localization/trans.dart';
import '../../../../shared/picker/data/country_search_model/address_result.dart';
import '../../../models/branches/add_branch.dart';
import '../../../models/branches/branch_model.dart';
import '../../../models/user_info/user_model.dart';
import '../../../repo/branches/branches_rep.dart';
import 'branches_state.dart';

class BranchesBloc extends Cubit<BranchesState> {
  BranchesBloc() : super(const BranchesState.initial());

  static BranchesBloc of(BuildContext context) {
    return BlocProvider.of<BranchesBloc>(context);
  }

  BranchModel? branchesModel;
  AddBranchModel? addbranchesModel = AddBranchModel();

  Future getBranches() async {
    emit(const BranchesState.loading());
    try {
      final result = await BranchesRepoImpl.i.getBranches();
      result.fold(
        (l) {
          emit(BranchesState.error(error: KFailure.toError(l)));
          debugPrint('================= Branches (Bloc) : $l  ');
        },
        (r) {
          final my_branch = KStorage.i.getUserInfo?.data?.companyBranch;
          branchesModel = r.copyWith(
            branchData: r.branchData?.where((element) => (element.id == my_branch?.id) || my_branch == null).toList(),
          );
          emit(BranchesState.success(model: branchesModel!));
        },
      );
    } catch (e) {
      debugPrint('================= Branches (Bloc) (catch) : $e  ');
      emit(BranchesState.error(error: Tr.get.something_went_wrong));
    }
  }

  UserModel? userModel = KStorage.i.getUserInfo;

  String? cityId = '';

  Future addBranches() async {
    try {
      addbranchesModel = addbranchesModel?.copyWith(
        companyId: userModel?.data?.userCompany?.id.toString(),
      );
      emit(const BranchesState.loading());

      final result = await BranchesRepoImpl.i.addBranch(addbranchesModel!);
      result.fold(
        (l) {
          emit(BranchesState.error(error: KFailure.toError(l)));
          debugPrint('================= Branches (Bloc) : $l  ');
        },
        (r) {
          emit(BranchesState.success(model: branchesModel!));
          getBranches();
        },
      );
    } catch (e) {
      debugPrint('================= Branches (Bloc) (catch) : $e  ');
      emit(BranchesState.error(error: Tr.get.something_went_wrong));
    }
  }

  Future deleteBranches(int id) async {
    emit(const BranchesState.loading());
    try {
      final result = await BranchesRepoImpl.i.deleteBranch(id);
      result.fold(
        (l) {
          emit(BranchesState.error(error: KFailure.toError(l)));
          debugPrint('================= deleteBranches (Bloc) : $l  ');
        },
        (r) {
          emit(BranchesState.success(model: branchesModel!));
          getBranches();
        },
      );
    } catch (e) {
      debugPrint('================= deleteBranches (Bloc) (catch) : $e  ');
      emit(BranchesState.error(error: Tr.get.something_went_wrong));
    }
  }

  Future updateBranches(int id) async {
    try {
      addbranchesModel = addbranchesModel?.copyWith(id: id);
      emit(const BranchesState.loading());
      final result = await BranchesRepoImpl.i.updateBranch(addbranchesModel!);
      result.fold(
        (l) {
          emit(BranchesState.error(error: KFailure.toError(l)));
          debugPrint('================= Branches (Bloc) : $l  ');
        },
        (r) {
          emit(BranchesState.success(model: branchesModel!));
          getBranches();
        },
      );
    } catch (e) {
      debugPrint('================= Branches (Bloc) (catch) : $e  ');
      emit(BranchesState.error(error: Tr.get.something_went_wrong));
    }
  }

  setLocationData(AddressResult result) {
    addbranchesModel = addbranchesModel?.copyWith(
      latitude: result.latLng.latitude.toString(),
      longitude: result.latLng.longitude.toString(),
      detailedAddress: result.address,
      state: result.state,
      cityId: result.cityId.toString(),
      floor: result.floor,
      building: result.building,
      street: result.street,
      zipcode: result.zipcode,
      intercom: result.intercome,
    );
    emit(const BranchesState.loading());
    emit(const BranchesState.initial());
  }
}
