import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get/get.dart';

import '../../data/models/sales_delegate/vendor_states/vendor_states.dart';
import '../../logic/barnch_Staff/get_branch_staff/branch_staff_bloc.dart';
import '../../logic/nav_enforcer/nav_enforcer_bloc.dart';
import '../../logic/sales_delegate/update_vendor/update_vendor_bloc.dart';
import '../../logic/sales_delegate/update_vendor/update_vendor_state.dart';
import '../../packages/shared/localization/trans.dart';
import '../../packages/shared/theme/helper.dart';
import '../../packages/shared/theme/text_theme.dart';
import '../../packages/widgets/custom_button.dart';
import '../../packages/widgets/drop_down.dart';
import '../widgets/loading/loading_overlay.dart';
import 'add_vendor.dart';

class UpdateVendorView extends StatelessWidget {
  final int id;

  UpdateVendorView({Key? key, required this.id}) : super(key: key);
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(vertical: 50),
      child: BlocConsumer<UpdateVendorBloc, UpdateVendorState>(
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
                    children: [
                      KDropdownBtn<KVendorState>(
                        onChanged: UpdateVendorBloc.of(context).setVendorstate,
                        value: UpdateVendorBloc.of(context).vendorState,
                        items: KVendorState.update.map((e) => KHelper.of(context).itemView<KVendorState>(itemText: e.name, value: e)).toList(),
                        title: Tr.get.status,
                      ),
                      const SizedBox(height: 10),
                      UpdateVendorBloc.of(context).stateIsNull ?? false
                          ? Text(
                              Tr.get.field_required,
                              style: KTextStyle.of(context).error,
                            )
                          : const SizedBox(),
                      buildFields(UpdateVendorBloc.of(context).vendorState, context, true),
                      const SizedBox(height: 30),
                      KButton(
                        title: Tr.get.update,
                        width: Get.width - 40,
                        onPressed: () {
                          if (_formKey.currentState!.validate()) {
                            UpdateVendorBloc.of(context).updateVendor(id);
                            FocusManager.instance.primaryFocus?.unfocus();
                            return;
                          }
                        },
                        height: 45,
                      ),
                    ],
                  ),
                ),
              ),
            ),
          );
        },
      ),
    );
  }
}
