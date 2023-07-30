import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get/get.dart';

import '../../data/models/famous/famous_types.dart';
import '../../di.dart';
import '../../logic/barnch_Staff/get_branch_staff/branch_staff_bloc.dart';
import '../../logic/famous/add_famous/add_famous_bloc.dart';
import '../../logic/famous/add_famous/add_famous_state.dart';
import '../../logic/famous/famous_types/famous_types_bloc.dart';
import '../../logic/famous/famous_types/famous_types_state.dart';
import '../../logic/nav_enforcer/nav_enforcer_bloc.dart';
import '../../packages/shared/localization/trans.dart';
import '../../packages/shared/theme/helper.dart';
import '../../packages/widgets/custom_button.dart';
import '../../packages/widgets/drop_down.dart';
import '../../packages/widgets/text_field.dart';
import '../widgets/loading/loading_overlay.dart';

class AddFamousView extends StatelessWidget {
  AddFamousView({Key? key}) : super(key: key);
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Padding(
        padding: const EdgeInsets.symmetric(vertical: 50),
        child: BlocProvider(
          create: (context) => Di.addFamous,
          child: BlocConsumer<AddFamousBloc, AddFamousState>(
            listener: (context, state) {
              state.whenOrNull(
                success: () {
                  BranchStaffBloc.of(context).getStaff();
                  Nav.back();
                },
              );
            },
            builder: (context, state) {
              return Center(
                child: KLoadingOverlay(
                  isLoading: state.maybeWhen(orElse: () => false, loading: () => true),
                  child: SingleChildScrollView(
                    padding: const EdgeInsets.symmetric(horizontal: 30),
                    child: Form(
                      key: _formKey,
                      child: Column(
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          KTextFormField(
                            hintText: Tr.get.email,
                            kWidth: Get.width - 40,
                            controller: AddFamousBloc.of(context).emailController,
                            validator: (value) {
                              if (value!.isEmpty) {
                                return Tr.get.field_required;
                              }
                              return null;
                            },
                          ),
                          const SizedBox(height: 10),
                          KTextFormField(
                            controller: AddFamousBloc.of(context).couponController,
                            hintText: Tr.get.coupun,
                            enabled: true,
                            keyboardType: TextInputType.text,
                            validator: (value) {
                              if (value!.isEmpty) {
                                return Tr.get.name_validation;
                              }
                              return null;
                            },
                          ),
                          const SizedBox(height: 10),
                          BlocBuilder<FamousTypesBloc, FamousTypesState>(
                            builder: (context, typeState) {
                              return typeState.maybeWhen(
                                success: (m) => KDropdownBtn<FamousTypesData>(
                                  onChanged: (p0) {
                                    return AddFamousBloc.of(context).setFamousType(p0 ?? FamousTypesData());
                                  },
                                  value: AddFamousBloc.of(context).selectedType,
                                  items: FamousTypesBloc.of(context)
                                          .famousTypes
                                          ?.data
                                          ?.map(
                                            (e) => KHelper.of(context).itemView<FamousTypesData>(itemText: e.name?.value ?? '', value: e),
                                          )
                                          .toList() ??
                                      [],
                                  title: typeState.maybeWhen(orElse: () => false, loading: () => true) ? Tr.get.loading : Tr.get.typee,
                                ),
                                orElse: () => Text(Tr.get.loading),
                              );
                            },
                          ),
                          const SizedBox(height: 10),
                          KButton(
                            title: Tr.get.add,
                            width: Get.width - 40,
                            onPressed: () {
                              if (_formKey.currentState!.validate()) {
                                AddFamousBloc.of(context).addFamous();
                                FocusManager.instance.primaryFocus?.unfocus();
                                return;
                              }
                            },
                            height: 45,
                          )
                        ],
                      ),
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
