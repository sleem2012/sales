import 'package:flutter/material.dart';
import '../../../logic/barnch_Staff/add_barnch_staff/add_employee_bloc.dart';
import '../../../logic/nav_enforcer/nav_enforcer_bloc.dart';
import '../../../packages/shared/localization/trans.dart';
import '../../../packages/widgets/custom_button.dart';
import '../../../packages/widgets/text_field.dart';
import 'package:get/get.dart';

import '../../../packages/shared/theme/helper.dart';

class AddEmployeeLocationDetails extends StatefulWidget {
  const AddEmployeeLocationDetails({Key? key, required this.openMap, required this.addEmployeeBloc}) : super(key: key);

  final AddEmployeeBloc addEmployeeBloc;
  final Function() openMap;

  @override
  State<AddEmployeeLocationDetails> createState() => _AddEmployeeLocationDetailsState();
}

class _AddEmployeeLocationDetailsState extends State<AddEmployeeLocationDetails> {
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    final regBloc = widget.addEmployeeBloc;
    return Center(
      child: Material(
        color: Colors.transparent,
        child: Container(
          margin: MediaQuery.of(context).viewInsets,
          padding: const EdgeInsets.symmetric(horizontal: KHelper.hPadding, vertical: 20),
          decoration: KHelper.of(context).elevatedBox,
          child: Form(
            key: _formKey,
            child: SingleChildScrollView(
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  Container(
                    height: 4,
                    width: 60,
                    decoration: KHelper.of(context).freeShipping,
                  ),
                  SizedBox(height: Get.height * .01),
                  Text(Tr.get.add_location),
                  SizedBox(height: Get.height * .01),
                  KButton(
                    title: Tr.get.open_map,
                    onPressed: widget.openMap,
                  ),
                  SizedBox(height: Get.height * .01),
                  StatefulBuilder(
                    builder: (context, setState) => KTextFormField(
                      enabled: false,
                      controller: regBloc.detailedAddressController,
                      hintText: Tr.get.address,
                      validator: (value) {
                        if (value!.isEmpty) {
                          return Tr.get.field_required;
                        }
                        return null;
                      },
                    ),
                  ),
                  SizedBox(height: Get.height * .01),
                  KTextFormField(
                    controller: regBloc.countryController,
                    hintText: Tr.get.country,
                    validator: (value) {
                      if (value!.isEmpty) {
                        return Tr.get.country_validation;
                      }
                      return null;
                    },
                  ),
                  SizedBox(height: Get.height * .01),
                  KTextFormField(
                    controller: regBloc.stateController,
                    hintText: Tr.get.state,
                    validator: (value) {
                      if (value!.isEmpty) {
                        return Tr.get.field_required;
                      }
                      return null;
                    },
                  ),
                  SizedBox(height: Get.height * .01),
                  KTextFormField(
                    controller: regBloc.streetController,
                    hintText: Tr.get.street,
                    validator: (value) {
                      if (value!.isEmpty) {
                        return Tr.get.field_required;
                      }
                      return null;
                    },
                  ),
                  SizedBox(height: Get.height * .01),
                  KTextFormField(
                    controller: regBloc.zipcodeController,
                    hintText: Tr.get.zipcode,
                    validator: (value) {
                      if (value!.isEmpty) {
                        return Tr.get.field_required;
                      }
                      return null;
                    },
                  ),
                  SizedBox(height: Get.height * .01),
                  KTextFormField(
                    controller: regBloc.buildingController,
                    hintText: Tr.get.building,
                    validator: (value) {
                      if (value!.isEmpty) {
                        return Tr.get.field_required;
                      }
                      return null;
                    },
                  ),
                  SizedBox(height: Get.height * .01),
                  KTextFormField(
                    controller: regBloc.intercomController,
                    hintText: Tr.get.intercom,
                    validator: (value) {
                      if (value!.isEmpty) {
                        return Tr.get.field_required;
                      }
                      return null;
                    },
                  ),
                  SizedBox(height: Get.height * .01),
                  KTextFormField(
                    controller: regBloc.floorController,
                    hintText: Tr.get.floor,
                    validator: (value) {
                      if (value!.isEmpty) {
                        return Tr.get.field_required;
                      }
                      return null;
                    },
                  ),
                  SizedBox(height: Get.height * .01),
                  KButton(
                    title: Tr.get.done,
                    onPressed: () {
                      if (!_formKey.currentState!.validate()) {
                        return;
                      } else {
                        Nav.back();
                      }
                    },
                  ),
                  const SizedBox(height: 30),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
