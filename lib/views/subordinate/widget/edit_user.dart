import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../packages/shared/error/failures.dart';
import '../../../di.dart';
import '../../../logic/barnch_Staff/block_user/block_user_bloc_cubit.dart';
import '../../../logic/barnch_Staff/block_user/block_user_bloc_state.dart';
import '../../../logic/barnch_Staff/get_branch_staff/branch_staff_bloc.dart';
import '../../../logic/nav_enforcer/nav_enforcer_bloc.dart';
import '../../../packages/shared/localization/trans.dart';
import '../../../packages/shared/theme/colors.dart';
import '../../../packages/widgets/custom_button.dart';
import '../../../packages/widgets/text_field.dart';
import '../../main_screen/main_screen.dart';
import '../../widgets/loading/loading_overlay.dart';

class BlockUserDialog extends StatelessWidget {
  final int id;
  final int isBlocked;

  const BlockUserDialog({Key? key, required this.id, required this.isBlocked}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final GlobalKey<FormState> formKey = GlobalKey<FormState>();
    final TextEditingController reasonCtrl = TextEditingController();
    return Center(
      child: SingleChildScrollView(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Form(
              key: formKey,
              child: Padding(
                padding: const EdgeInsets.all(20),
                child: BlocProvider(
                  create: (context) => Di.blockUserBloc,
                  child: BlocConsumer<BlockUserBloc, BlockUserState>(
                    listener: (context, state) {
                      state.whenOrNull(
                        success: () {
                          Navigator.pushReplacement(
                            context,
                            MaterialPageRoute(
                              builder: (context) => const MainNavigationView(),
                            ),
                          );
                          BranchStaffBloc.of(context).getStaff();
                        },
                      );
                    },
                    builder: (context, state) {
                      return KLoadingOverlay(
                        isLoading: state.maybeWhen(orElse: () => false, loading: () => true),
                        child: Column(
                          children: [
                            state.maybeWhen(
                              orElse: () => const SizedBox(),
                              error: (failure) => Text(KFailure.toError(failure)),
                            ),
                            Padding(
                              padding: const EdgeInsets.symmetric(vertical: 20),
                              child: KTextFormField(
                                controller: reasonCtrl,
                                hintText: Tr.get.block_reason,
                                validator: (value) {
                                  if (value!.isEmpty) {
                                    return Tr.get.block_reason_required;
                                  }
                                  return null;
                                },
                              ),
                            ),
                            Row(
                              children: [
                                Expanded(
                                  child: KButton(
                                    title: Tr.get.cancel,
                                    onPressed: () {
                                      Nav.back();
                                    },
                                  ),
                                ),
                                const SizedBox(width: 20),
                                Expanded(
                                  child: KButton(
                                    title: Tr.get.block,
                                    onPressed: () {
                                      if (formKey.currentState!.validate()) {
                                        FocusManager.instance.primaryFocus?.unfocus();
                                        BlockUserBloc.of(context).block(id: id, isBlocked: isBlocked, reason: reasonCtrl.text);
                                      }
                                    },
                                  ),
                                ),
                              ],
                            )
                          ],
                        ),
                      );
                    },
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class EditUserDialog extends StatelessWidget {
  final int id;

  const EditUserDialog({Key? key, required this.id}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final GlobalKey<FormState> formKey = GlobalKey<FormState>();
    final TextEditingController ContractController = TextEditingController();
    return Center(
      child: SingleChildScrollView(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Material(
              color: KColors.of(context).background,
              child: Form(
                key: formKey,
                child: Padding(
                  padding: const EdgeInsets.all(20),
                  child: BlocProvider(
                    create: (context) => Di.blockUserBloc,
                    child: BlocConsumer<BlockUserBloc, BlockUserState>(
                      listener: (context, state) {
                        state.whenOrNull(
                          success: () {
                            Navigator.pushReplacement(
                              context,
                              MaterialPageRoute(
                                builder: (context) => const MainNavigationView(),
                              ),
                            );
                          },
                        );
                      },
                      builder: (context, state) {
                        return KLoadingOverlay(
                          isLoading: state.maybeWhen(orElse: () => false, loading: () => true),
                          child: Column(
                            children: [
                              state.maybeWhen(
                                orElse: () => const SizedBox(),
                                error: (failure) => Text(KFailure.toError(failure)),
                              ),
                              Padding(
                                padding: const EdgeInsets.symmetric(vertical: 20),
                                child: KTextFormField(
                                  keyboardType: TextInputType.phone,
                                  controller: ContractController,
                                  hintText: Tr.get.update_contract,
                                  validator: (value) {
                                    if (value!.isEmpty) {
                                      return Tr.get.block_reason_required;
                                    }
                                    return null;
                                  },
                                ),
                              ),
                              Row(
                                children: [
                                  Expanded(
                                    child: KButton(
                                      title: Tr.get.cancel,
                                      onPressed: () {
                                        Nav.back();
                                      },
                                    ),
                                  ),
                                  const SizedBox(width: 20),
                                  Expanded(
                                    child: KButton(
                                      title: Tr.get.update,
                                      onPressed: () {
                                        if (formKey.currentState!.validate()) {
                                          FocusManager.instance.primaryFocus?.unfocus();
                                          BlockUserBloc.of(context).block(id: id, requiredContract: int.tryParse(ContractController.text));
                                        }
                                      },
                                    ),
                                  ),
                                ],
                              )
                            ],
                          ),
                        );
                      },
                    ),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class UnBlockUserDialog extends StatelessWidget {
  final int id;
  final String reson;

  const UnBlockUserDialog({Key? key, required this.id, required this.reson}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Center(
      child: SingleChildScrollView(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Material(
              color: KColors.of(context).background,
              child: Padding(
                padding: const EdgeInsets.all(20),
                child: BlocProvider(
                  create: (context) => Di.blockUserBloc,
                  child: BlocConsumer<BlockUserBloc, BlockUserState>(
                    listener: (context, state) {
                      state.whenOrNull(
                        success: () {
                          Navigator.pushReplacement(
                            context,
                            MaterialPageRoute(
                              builder: (context) => const MainNavigationView(),
                            ),
                          );
                          BranchStaffBloc.of(context).getStaff();
                        },
                      );
                    },
                    builder: (context, state) {
                      return KLoadingOverlay(
                        isLoading: state.maybeWhen(orElse: () => false, loading: () => true),
                        child: Column(
                          children: [
                            state.maybeWhen(
                              orElse: () => const SizedBox(),
                              error: (failure) => Text(KFailure.toError(failure)),
                            ),
                            Padding(
                              padding: const EdgeInsets.symmetric(vertical: 30),
                              child: Text(reson),
                            ),
                            Row(
                              children: [
                                Expanded(
                                  child: KButton(
                                    title: Tr.get.cancel,
                                    onPressed: () {
                                      Nav.back();
                                    },
                                  ),
                                ),
                                const SizedBox(width: 20),
                                Expanded(
                                  child: KButton(
                                    title: Tr.get.unblock,
                                    onPressed: () {
                                      BlockUserBloc.of(context).block(id: id, isBlocked: 0);
                                    },
                                  ),
                                ),
                              ],
                            )
                          ],
                        ),
                      );
                    },
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
