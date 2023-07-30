// import 'package:flutter/material.dart';
// import 'package:flutter_bloc/flutter_bloc.dart';
// import '../../data/models/dashboard/pending_applications_model.dart';
// import '../../data/repository/dashboard/dashboard_repo.dart';
// import '../../shared/error/failures.dart';
// import '../../shared/localization/trans.dart';
// import 'dashboard_state.dart';
//
// class DashboardBloc extends Cubit<DashboardState> {
//   DashboardBloc({required this.dashboardRepoImp}) : super(const DashboardState.loading());
//
//   static DashboardBloc of(BuildContext context) => BlocProvider.of<DashboardBloc>(context);
//
//
//   final DashboardRepoImp dashboardRepoImp;
//   PendingApplicationsModel? pendingApplicationModel;
//
//   get() async {
//     try {
//       emit(const DashboardState.loading());
//       final result = await dashboardRepoImp.get_pending_applications();
//       result.fold(
//         (l) {
//           debugPrint('================= Dashboard Bloc : ${KFailure.toError(l)}');
//           emit(DashboardState.error(error: KFailure.toError(l)));
//         },
//         (r) {
//           debugPrint('================= Dashboard Bloc : ${r.toString()}  ');
//           pendingApplicationModel = r;
//           emit(const DashboardState.success());
//         },
//       );
//     } catch (e) {
//       debugPrint('================= Dashboard Bloc (Catch): ${e.toString()} ');
//       emit(DashboardState.error(error: Tr.get.something_went_wrong));
//     }
//   }
// }
