import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../di.dart';
import '../../logic/barnch_Staff/famous/add_famous_attrs/add_famous_attrs_bloc.dart';
import '../../logic/barnch_Staff/famous/add_famous_attrs/add_famous_attrs_state.dart';
import '../../logic/barnch_Staff/famous/get_famous_attrs/get_famous_attrs_bloc.dart';
import '../../logic/barnch_Staff/famous/get_famous_attrs/get_famous_attrs_state.dart';
import '../../logic/nav_enforcer/nav_enforcer_bloc.dart';
import '../../packages/cache/locale_storage.dart';
import '../../packages/shared/localization/trans.dart';
import '../../packages/shared/theme/helper.dart';
import '../main_screen/main_screen.dart';
import '../widgets/appbar.dart';
import '../widgets/loading/loading_overlay.dart';
import '../widgets/new_bg_img.dart';

import '../../../../packages/shared/error/failures.dart';
import '../../packages/dynamic_ui/view/dynamic_ui_view.dart';

class AddFamousAttributesView extends StatelessWidget {
  const AddFamousAttributesView({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(create: (context) => Di.addFamousAttrsBloc),
        BlocProvider(create: (context) => Di.getFamousAttrsBloc..get()),
      ],
      child: Scaffold(
        appBar: const KAppBar(
          isDUI: true,
        ),
        body: BgImg(
          isInputs: true,
          child: BlocBuilder<GetFamousAttrsBloc, GetFamousAttrsState>(
            builder: (context, state) {
              return KRequestOverlay(
                isLoading: state.maybeWhen(orElse: () => false, loading: () => true),
                error: state.maybeWhen(orElse: () => null, error: (e) => KFailure.toError(e)),
                onTryAgain: GetFamousAttrsBloc.of(context).get,
                child: state.maybeWhen(
                  orElse: () => const SizedBox(),
                  success: (fields) {
                    return BlocConsumer<AddFamousAttrsBloc, AddFamousAttrsState>(
                      listener: (context, addStates) {
                        addStates.whenOrNull(
                          success: () {
                            NavEnforcerBloc.of(context).checkUser(
                              msg: Tr.get.added_success,
                              destination: const MainNavigationView(),
                            );
                          },
                        );
                      },
                      builder: (context, addStates) {
                        return KLoadingOverlay(
                          isLoading: addStates.maybeWhen(orElse: () => false, loading: () => true),
                          child: DynamicUi(
                            padding: const EdgeInsets.symmetric(horizontal: KHelper.hPadding, vertical: 20),
                            fields: fields,
                            posting: addStates.maybeWhen(orElse: () => false, loading: () => true),
                            failure: addStates.maybeWhen(orElse: () => null, error: (f) => f),
                            submitTitle: Tr.get.subscribe,
                            onConfirm: (values, ans, grouped, groupedAns) {
                              debugPrint('================= ${KStorage.i.getToken} : ');
                              AddFamousAttrsBloc.of(context).addFamous(ans);
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
