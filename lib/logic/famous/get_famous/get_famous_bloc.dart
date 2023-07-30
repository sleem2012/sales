import 'package:flutter/cupertino.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../../data/models/famous/famous_data.dart';
import '../../../data/repository/branch_staff/branches_staff_repo.dart';
import '../../../packages/cache/locale_storage.dart';

import '../../../../packages/shared/error/failures.dart';
import 'get_famous_state.dart';

class GetFamousBloc extends Cubit<GetFamousState> {
  GetFamousBloc({required this.branchStaffRepoImpl}) : super(const GetFamousState.initial());

  static GetFamousBloc of(BuildContext context) {
    return BlocProvider.of<GetFamousBloc>(context);
  }

  final BranchStaffRepoImpl branchStaffRepoImpl;

  FamousModel? famousModel;

  getFamous() async {
    try {
      final result = await branchStaffRepoImpl.getFamous();
      result.fold(
        (l) {
          debugPrint('=================My Famous  :$l ');
          emit(GetFamousState.error(error: KFailure.toError(l)));
        },
        (r) {
          famousModel = r;
          debugPrint('=================My Famous :$r ');
          emit(const GetFamousState.success());
          if ((r.data ?? []).isNotEmpty) {
            KStorage.i.setFamous(r.data?.firstOrNull?.coupon);
          }
        },
      );
    } catch (e) {
      debugPrint('=================My Payment  catch $e  ');
    }
  }
}
