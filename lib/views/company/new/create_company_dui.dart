import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../packages/shared/error/failures.dart';
import '../../../di.dart';
import '../../../logic/company/create_compny_dui/create/create_company_dui_bloc_bloc.dart';
import '../../../logic/company/create_compny_dui/create/create_company_dui_bloc_state.dart';
import '../../../logic/company/create_compny_dui/get_fields/get_company_fields_bloc.dart';
import '../../../logic/company/create_compny_dui/get_fields/get_company_fields_state.dart';
import '../../../logic/nav_enforcer/nav_enforcer_bloc.dart';
import '../../../packages/dynamic_ui/view/dynamic_ui_view.dart';
import '../../../packages/shared/localization/trans.dart';
import '../../../packages/shared/theme/colors.dart';
import '../../../packages/shared/theme/helper.dart';
import '../../internal_emplyee_view/intrenal_view_screen.dart';
import '../../main_screen/main_screen.dart';
import '../../widgets/appbar.dart';
import '../../widgets/loading/loading_overlay.dart';
import '../../widgets/new_bg_img.dart';

class CreateCompanyDUIView extends StatefulWidget {
  const CreateCompanyDUIView({Key? key}) : super(key: key);

  @override
  State<CreateCompanyDUIView> createState() => _CreateCompanyDUIViewState();
}

class _CreateCompanyDUIViewState extends State<CreateCompanyDUIView> {
  @override
  void initState() {
    WidgetsBinding.instance.addPostFrameCallback(
      (_) => KHelper.showCustomBottomSheet(const RegisterDialog(), isDismissible: false),
    );
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(create: (context) => Di.getCompanyFieldsBloc..get()),
        BlocProvider(create: (context) => Di.createCompanyDuiBlocBloc),
      ],
      child: Scaffold(
        appBar: const KAppBar(isDUI: true),
        body: BgImg(
          isInputs: true,
          child: BlocBuilder<GetCompanyFieldsBloc, GetCompanyFieldsState>(
            builder: (context, state) {
              return KRequestOverlay(
                isLoading: state.maybeWhen(orElse: () => false, loading: () => true),
                error: state.maybeWhen(orElse: () => null, error: (e) => KFailure.toError(e)),
                onTryAgain: GetCompanyFieldsBloc.of(context).get,
                child: state.maybeWhen(
                  orElse: () => const SizedBox(),
                  success: (fields) {
                    return BlocConsumer<CreateCompanyDuiBlocBloc, CreateCompanyDuiBlocState>(
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
                            padding: const EdgeInsets.all(20),
                            fields: state.maybeWhen(orElse: () => [], success: (l) => l),
                            failure: addStates.maybeWhen(orElse: () => null, error: (f) => f),
                            submitTitle: Tr.get.subscribe,
                            onConfirm: (values, ans, grouped, values_with_key) {
                              CreateCompanyDuiBlocBloc.of(context).create(values);
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

class RegisterDialog extends StatelessWidget {
  const RegisterDialog({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Padding(
        padding: const EdgeInsets.all(20).copyWith(bottom: 50),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisSize: MainAxisSize.min,
          children: [
            InkWell(
              onTap: () {
                Nav.back();
              },
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [Text(Tr.get.company_continue), const Icon(Icons.arrow_forward_rounded)],
              ),
            ),
            const SizedBox(
              height: 10,
            ),
            Divider(
              height: 5,
              color: KColors.of(context).accentColor,
            ),
            const SizedBox(
              height: 10,
            ),
            InkWell(
              onTap: () {
                Nav.offAll(const InternalEmployeeScreen());
              },
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [Text(Tr.get.join_forall), const Icon(Icons.arrow_forward_rounded)],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
