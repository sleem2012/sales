import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../packages/shared/error/failures.dart';
import '../../../payment/data/payment_repo.dart';
import '../../../shared/localization/trans.dart';
import 'get_banks_state.dart';

class GetBanksBloc extends Cubit<GetBanksState> {
  GetBanksBloc() : super(const GetBanksState.loading());

  static GetBanksBloc of(BuildContext context) => BlocProvider.of<GetBanksBloc>(context);

  get() async {
    try {
      emit(const GetBanksState.loading());
      final result = await PayemntRepoImpl.i.get_banks();
      result.fold(
        (l) {
          debugPrint('================= GetBanks Bloc : ${KFailure.toError(l)}');
          emit(GetBanksState.error(error: KFailure.toError(l)));
        },
        (r) {
          debugPrint('================= GetBanks Bloc : ${r.toString()}  ');
          emit(GetBanksState.success(r));
        },
      );
    } catch (e) {
      debugPrint('================= GetBanks Bloc (Catch): ${e.toString()} ');
      emit(GetBanksState.error(error: Tr.get.something_went_wrong));
    }
  }
}
