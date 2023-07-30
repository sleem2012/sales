import 'package:flutter/foundation.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../data/models/commission/commission_model.dart';
import '../../data/repository/commission/commission_repo.dart';
import 'commission_state.dart';
import '../../packages/shared/localization/trans.dart';

import '../../../../packages/shared/error/failures.dart';

class CommissionBloc extends Cubit<CommissionState> {
  CommissionBloc({required this.commissionRepoImpl}) : super(const CommissionState.initial());

  static CommissionBloc of(context) => BlocProvider.of(context);

  final CommissionRepoImpl commissionRepoImpl;

  CommissionModel? commissionModel;

  getCommission() async {
    try {
      emit(const CommissionState.loading());
      final result = await commissionRepoImpl.getCommission();
      result.fold(
        (l) {
          debugPrint('=================getCommission fails :$l ');
          emit(CommissionState.error(error: KFailure.toError(l)));
        },
        (r) {
          commissionModel = r;
          debugPrint('================getCommission  Success :$r ');
          emit(CommissionState.success(commissionModel: commissionModel!));
        },
      );
    } catch (e) {
      debugPrint('=================getCommission  catch $e  ');
      emit(CommissionState.error(error: Tr.get.something_went_wrong));
      rethrow;
    }
  }
}
