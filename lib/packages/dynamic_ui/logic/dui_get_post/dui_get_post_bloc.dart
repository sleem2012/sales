import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../packages/shared/error/failures.dart';
import '../../repo/dui_get_post_repo.dart';
import 'dui_get_post_state.dart';

class DuiGetPostBloc extends Cubit<DuiGetPostState> {
  DuiGetPostBloc() : super(const DuiGetPostState.initial());

  static DuiGetPostBloc of(BuildContext context) => BlocProvider.of<DuiGetPostBloc>(context);

  void get(String get_url, Map<String, dynamic>? params) async {
    try {
      emit(const DuiGetPostState.getting());
      final result = await DuiGetPostRepoImp.i.get(get_url, params);
      result.fold(
        (l) {
          debugPrint('================= DuiGetPost Bloc : ${KFailure.toError(l)}');
          emit(DuiGetPostState.getError(error: l, params: params));
        },
        (r) {
          debugPrint('================= DuiGetPost Bloc : ${r.toString()}  ');
          emit(DuiGetPostState.getSuccess(model: r));
        },
      );
    } catch (e) {
      debugPrint('================= DuiGetPost Bloc (Catch): ${e.toString()} ');
      emit(DuiGetPostState.getError(error: const KFailure.someThingWrongPleaseTryAgain(), params: params));
      rethrow;
    }
  }

  void post(String post_url, Map<String, dynamic> map) async {
    try {
      emit(const DuiGetPostState.posting());
      final result = await DuiGetPostRepoImp.i.post(post_url, map);
      result.fold(
        (l) {
          debugPrint('================= DuiGetPost Bloc : ${KFailure.toError(l)}');
          emit(DuiGetPostState.postError(error: l, postMap: map));
        },
        (r) {
          debugPrint('================= DuiGetPost Bloc : ${r.toString()}  ');
          emit(DuiGetPostState.postSuccess(response: r));
        },
      );
    } catch (e) {
      debugPrint('================= DuiGetPost Bloc (Catch): ${e.toString()} ');
      emit(DuiGetPostState.postError(error: const KFailure.someThingWrongPleaseTryAgain(), postMap: map));
    }
  }
}
