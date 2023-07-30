import 'package:flutter/cupertino.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../../data/models/famous/add_famous_model.dart';
import '../../../data/models/famous/famous_types.dart';
import '../../../data/repository/branch_staff/branches_staff_repo.dart';
import 'add_famous_state.dart';
import '../../../packages/shared/localization/trans.dart';

import '../../../../packages/shared/error/failures.dart';

class AddFamousBloc extends Cubit<AddFamousState> {
  AddFamousBloc({required this.branchStaffRepoImpl}) : super(const AddFamousState.initial());

  static AddFamousBloc of(BuildContext context) {
    return BlocProvider.of<AddFamousBloc>(context);
  }

  final BranchStaffRepoImpl branchStaffRepoImpl;
  AddFamousModel addFamousModel = AddFamousModel();
  final TextEditingController emailController = TextEditingController();
  final TextEditingController couponController = TextEditingController();

  addFamous() async {
    try {
      emit(const AddFamousState.loading());
      addFamousModel = addFamousModel.copyWith(
        email: emailController.text,
        coupon: couponController.text,
      );
      final result = await branchStaffRepoImpl.addPreFamous(addFamousModel);
      result.fold((l) {
        emit(AddFamousState.error(error: KFailure.toError(l)));
      }, (r) {
        emit(const AddFamousState.success());
      });
    } catch (e) {
      emit(AddFamousState.error(error: Tr.get.something_went_wrong));
    }
  }

  FamousTypesData? selectedType;
  setFamousType(FamousTypesData selected) async {
    selectedType = selected;
    addFamousModel = addFamousModel.copyWith(type: selected.id);
    emit(const AddFamousState.loading());
    emit(const AddFamousState.initial());
  }
}
