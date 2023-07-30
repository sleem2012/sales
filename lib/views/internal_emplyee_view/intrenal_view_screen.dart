import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../di.dart';
import '../../logic/barnch_Staff/internal_employee/create_int_emp/internal_employee_cubit.dart';
import '../../logic/barnch_Staff/internal_employee/create_int_emp/internal_employee_state.dart';
import '../../logic/barnch_Staff/internal_employee/get_fields/get_fields_bloc.dart';
import '../../logic/barnch_Staff/internal_employee/get_fields/get_fields_state.dart';
import '../../logic/nav_enforcer/nav_enforcer_bloc.dart';
import '../../packages/shared/localization/trans.dart';
import '../../packages/shared/theme/helper.dart';
import '../main_screen/main_screen.dart';
import '../widgets/appbar.dart';
import '../widgets/loading/loading_overlay.dart';
import '../widgets/new_bg_img.dart';

import '../../../../packages/shared/error/failures.dart';
import '../../packages/dynamic_ui/view/dynamic_ui_view.dart';

class InternalEmployeeScreen extends StatelessWidget {
  const InternalEmployeeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(create: (context) => Di.internalEmployeeCubit),
        BlocProvider(create: (context) => Di.internalEmpFieldsBloc..get()),
      ],
      child: Scaffold(
        appBar: const KAppBar(
          isDUI: true,
        ),
        body: BgImg(
          child: BlocBuilder<InternalEmpFieldsBloc, InternalEmpFieldsState>(
            builder: (context, state) {
              return KRequestOverlay(
                isLoading: state.maybeWhen(orElse: () => false, loading: () => true),
                error: state.maybeWhen(orElse: () => null, error: (e) => KFailure.toError(e)),
                onTryAgain: InternalEmpFieldsBloc.of(context).get,
                child: state.maybeWhen(
                  orElse: () => const SizedBox(),
                  success: (fields) {
                    return BlocConsumer<InternalEmployeeCubit, InternalEmployeeState>(
                      listener: (context, addStates) {
                        addStates.whenOrNull(
                          success: () {
                            NavEnforcerBloc.of(context).checkUser(
                              msg: Tr.get.company_created_success,
                              destination: const MainNavigationView(),
                            );
                          },
                        );
                      },
                      builder: (context, addStates) {
                        return KLoadingOverlay(
                          isLoading: addStates.maybeWhen(orElse: () => false, loading: () => true),
                          child: DynamicUi(
                            posting: addStates.maybeWhen(orElse: () => false, loading: () => true),
                            padding: const EdgeInsets.symmetric(horizontal: KHelper.hPadding, vertical: 20),
                            title: Tr.get.create_conmpany,
                            fields: state.maybeWhen(orElse: () => [], success: (l) => l),
                            failure: addStates.maybeWhen(orElse: () => null, error: (f) => f),
                            submitTitle: Tr.get.subscribe,
                            onConfirm: (values, ans, grouped, values_with_key) {
                              InternalEmployeeCubit.of(context).addInternal(values);
                            },
                          ),
                        );
                      },
                    );
                  },
                ),
              );
            },
          ),
        ),
      ),
    );
  }
}
