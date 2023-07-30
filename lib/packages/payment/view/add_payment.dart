import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get/get.dart';

import '../../../di.dart';
import '../../../logic/nav_enforcer/nav_enforcer_bloc.dart';
import '../../../packages/dynamic_ui/view/widgets/sub_widgets/dui_loading.dart';
import '../../../packages/extensions.dart';
import '../../../views/widgets/appbar.dart';
import '../../widgets/custom_button.dart';
import '../../widgets/drop_down.dart';
import '../../../views/widgets/loading/loading_overlay.dart';
import '../../../views/widgets/new_bg_img.dart';
import '../../../views/widgets/on_success_view.dart';
import '../../widgets/text_field.dart';
import '../../shared/localization/trans.dart';
import '../../shared/theme/helper.dart';
import '../../widgets/image_widget.dart';
import '../data/payment/banks_model.dart';
import '../data/payment/my_payment_model.dart';
import '../logic/add_payment_bloc/add_payment_bloc.dart';
import '../logic/add_payment_bloc/add_payment_state.dart';
import '../logic/get_banks/get_banks_bloc.dart';
import '../logic/get_banks/get_banks_state.dart';
import '../logic/get_my_payment_bloc/get_my_payment_bloc.dart';

class AddPaymentView extends StatelessWidget {
  const AddPaymentView({Key? key, required this.data}) : super(key: key);
  final PaymentData data;

  @override
  Widget build(BuildContext context) {
    final bankName = data.values?.where((element) => element.key == 'bank_name');

    final GlobalKey<FormState> formKey = GlobalKey<FormState>();
    return Scaffold(
      extendBodyBehindAppBar: true,
      appBar: const KAppBar(),
      body: BgImg(
        child: MultiBlocProvider(
          providers: [
            BlocProvider(create: (context) => Di.addPaymentTypeBloc..setCtrlLength(data, (bankName ?? []).first)),
            BlocProvider(create: (context) => Di.getBanksBloc..get()),
          ],
          child: BlocConsumer<AddPaymentTypeBloc, AddPaymentState>(
            listener: (context, state) {
              state.whenOrNull(
                success: () {
                  Nav.replace(OnSuccessView(msg: Tr.get.payment_edited_successfully));
                  MyPaymentsBloc.of(context).getMyPayments();
                },
              );
            },
            builder: (context, state) {
              return KLoadingOverlay(
                isLoading: state.maybeWhen(orElse: () => false, loading: () => true),
                child: SingleChildScrollView(
                  padding: const EdgeInsets.symmetric(horizontal: 20),
                  child: Form(
                    key: formKey,
                    child: Column(
                      children: [
                        Column(
                          children: [
                            BlocBuilder<GetBanksBloc, GetBanksState>(
                              builder: (context, state) {
                                final list = state
                                    .maybeWhen(orElse: () => <BankModelData>[], success: (model) => model.data ?? [])
                                    .map(
                                      (e) => KHelper.of(context).itemView(
                                        itemText: e.name?.value ?? '',
                                        value: e,
                                        icon: e.icon != null ? KImageWidget(imageUrl: e.icon.toString(), width: 25, height: 25) : null,
                                      ),
                                    )
                                    .toList();
                                return state is GetBanksStateLoading
                                    ? const DUILoadingWrapper(isLoading: true, child: SizedBox(height: 48))
                                    : KDropdownBtn(
                                        title: bankName?.first.value ?? Tr.get.bank_name,
                                        items: list,
                                        validator: (values) {
                                          return null;
                                        },
                                        onChanged: (p0) {
                                          AddPaymentTypeBloc.of(context).addBank(p0?.id ?? bankName?.first.id);
                                        },
                                      );
                              },
                            ),
                            5.h,
                            ListView.builder(
                              itemCount: AddPaymentTypeBloc.of(context).controllers.length,
                              shrinkWrap: true,
                              physics: const NeverScrollableScrollPhysics(),
                              padding: EdgeInsets.zero,
                              itemBuilder: (context, index) {
                                return Padding(
                                  padding: const EdgeInsets.symmetric(vertical: 5),
                                  child: KTextFormField(
                                    hintText: '',
                                    // AddPaymentTypeBloc.of(context).selectedPayTypeData?.keys?[index].placeholder?.value,
                                    controller: AddPaymentTypeBloc.of(context).controllers[index],
                                    validator: (p0) {
                                      if (p0!.isEmpty) {
                                        return Tr.get.field_required;
                                      }

                                      return null;
                                    },
                                  ),
                                );
                              },
                            ),
                            SwitchListTile(
                              title: Text(AddPaymentTypeBloc.of(context).isVisibile ? Tr.get.active : Tr.get.dis_active),
                              value: AddPaymentTypeBloc.of(context).isVisibile,
                              onChanged: AddPaymentTypeBloc.of(context).toggleVisibility,
                            ),
                            Padding(
                              padding: const EdgeInsets.symmetric(vertical: 20),
                              child: KButton(
                                title: Tr.get.update,
                                onPressed: () {
                                  if (formKey.currentState!.validate()) {
                                    FocusManager.instance.primaryFocus?.unfocus();
                                    AddPaymentTypeBloc.of(context).addPayment();
                                  }
                                },
                                width: Get.width * .7,
                              ),
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                ),
              );
            },
          ),
        ),
      ),
    );
  }
}
