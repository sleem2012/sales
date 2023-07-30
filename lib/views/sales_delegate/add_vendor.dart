import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get/get.dart';

import '../../data/models/sales_delegate/vendor_states/vendor_states.dart';
import '../../logic/barnch_Staff/get_branch_staff/branch_staff_bloc.dart';
import '../../logic/nav_enforcer/nav_enforcer_bloc.dart';
import '../../logic/sales_delegate/add_vendor/add_vendor_bloc.dart';
import '../../logic/sales_delegate/add_vendor/add_vendor_state.dart';
import '../../logic/sales_delegate/update_vendor/update_vendor_bloc.dart';
import '../../packages/cache/locale_storage.dart';
import '../../packages/shared/error/failures.dart';
import '../../packages/shared/localization/trans.dart';
import '../../packages/shared/picker/logic/location_cubit/location_cubit.dart';
import '../../packages/shared/picker/logic/location_cubit/location_state.dart';
import '../../packages/shared/theme/helper.dart';
import '../../packages/shared/theme/text_theme.dart';
import '../../packages/widgets/custom_button.dart';
import '../../packages/widgets/drop_down.dart';
import '../../packages/widgets/text_field.dart';
import '../widgets/country_code.dart';
import '../widgets/date_picker.dart';
import '../widgets/loading/loading_overlay.dart';
import '../widgets/on_success_view.dart';

Widget buildFields(KVendorState? state, BuildContext context, bool isUpdate) {
  final update = UpdateVendorBloc.of(context);
  final add = AddVendorBloc.of(context);
  debugPrint(KStorage.i.getUserInfo?.data?.address?.cityId?.countryId?.id.toString());
  switch (state?.slug) {
    case KVendorState.waiting:
      return Column(
        children: [
          KTextFormField(
            hintText: Tr.get.reason,
            kWidth: Get.width - 40,
            validator: (value) {
              if (value!.isEmpty) {
                return Tr.get.field_required;
              }
              if (isUpdate) {
                update.setWaitting(value);
              } else {
                add.setWaitting(value);
              }
              return null;
            },
          ),
          const SizedBox(height: 10),

          GestureDetector(
            onTap: () async {
              final date = await SfDatePicker.showDateTimePickerHG(
                context,
                type: KDateTimePickerType.dateGregorian,
                start: DateTime.now().add(const Duration(hours: 6)),
                initial: DateTime.now().add(const Duration(hours: 6)),
                end: DateTime(2100, 1),
              );
              if (date == null) return;
              dateController.text = date;
              if (isUpdate) {
                update.setRemider(date);
              } else {
                add.setReminder(date);
              }
            },
            child: KTextFormField(
              hintText: Tr.get.reminder,
              controller: dateController,
              enabled: false,

              suffixIcon: const Icon(Icons.date_range),
              // errorText: "widget.error",
              style: KTextStyle.of(context).body2,
              validator: (p0) {
                if (p0!.isEmpty) {
                  // return Tr.get.req;
                }
                return null;
              },
            ),
          ),

          // DateTimePicker(
          //   initialDate: DateTime.now().add(const Duration(hours: 6)),
          //   type: DateTimePickerType.dateTime,
          //   firstDate: DateTime.now().add(const Duration(hours: 6)),
          //   lastDate: DateTime(2100, 1),
          //   dateLabelText: Tr.get.reminder,
          //   onChanged: (val) {
          //     if (isUpdate) {
          //       UpdateVendorBloc.of(context).setRemider(val);
          //     } else {
          //       AddVendorBloc.of(context).setReminder(val);
          //     }
          //   },
          //   onSaved: (val) {
          //     if (isUpdate) {
          //       UpdateVendorBloc.of(context).setRemider(val);
          //     } else {
          //       AddVendorBloc.of(context).setReminder(val);
          //     }
          //   },
          // ),
        ],
      );
    case KVendorState.cancelled:
      return KTextFormField(
        hintText: Tr.get.reason,
        kWidth: Get.width - 40,
        validator: (value) {
          if (value!.isEmpty) {
            return Tr.get.field_required;
          }
          UpdateVendorBloc.of(context).setCancelled(value);
          return null;
        },
      );
    case KVendorState.rejected:
      return KTextFormField(
        hintText: Tr.get.reason,
        kWidth: Get.width - 40,
        validator: (value) {
          if (value!.isEmpty) {
            return Tr.get.field_required;
          }
          UpdateVendorBloc.of(context).setRejected(value);
          return null;
        },
      );
    default:
      return const SizedBox();
  }
}

class AddVendorView extends StatelessWidget {
  AddVendorView({Key? key, required this.isAgency}) : super(key: key);
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  final bool isAgency;

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Padding(
        padding: const EdgeInsets.symmetric(vertical: 50),
        child: BlocConsumer<AddVendorBloc, AddVendorState>(
          listener: (context, state) {
            state.whenOrNull(
              success: () {
                BranchStaffBloc.of(context).getStaff();
                Nav.to(OnSuccessView(msg: Tr.get.vendor_update_success, doubleBack: true));
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
                          controller: AddVendorBloc.of(context).emailCtrl,
                          validator: (value) {
                            if (value!.isEmpty) {
                              return Tr.get.field_required;
                            }
                            return null;
                          },
                        ),
                        const SizedBox(height: 10),
                        KTextFormField(
                          hintText: Tr.get.owner_name.replaceAll(":", ""),
                          kWidth: Get.width - 40,
                          controller: AddVendorBloc.of(context).ownerCtrl,
                          validator: (value) {
                            if (value!.isEmpty) {
                              return Tr.get.field_required;
                            }
                            return null;
                          },
                        ),
                        const SizedBox(height: 10),
                        KTextFormField(
                          hintText: Tr.get.company_name.replaceAll(":", ""),
                          kWidth: Get.width - 40,
                          controller: AddVendorBloc.of(context).compCtrl,
                          validator: (value) {
                            if (value!.isEmpty) {
                              return Tr.get.field_required;
                            }
                            return null;
                          },
                        ),
                        const SizedBox(height: 10),
                        KTextFormField(
                          controller: AddVendorBloc.of(context).phoneCtrl,
                          hintText: Tr.get.phone_number,
                          enabled: true,
                          keyboardType: TextInputType.phone,
                          prefixIcon: CountryCodeWidget(
                            onChanged: (p0) {
                              AddVendorBloc.of(context).cCode = "(${p0?.dialCode ?? '+966'})".replaceAll('+', '');
                              // debugPrint('================= ${regBloc.cCode} : ');
                            },
                            onInit: (p0) {
                              AddVendorBloc.of(context).cCode = "(${p0?.dialCode ?? '+966'})".replaceAll('+', '');
                              // debugPrint('================= ${regBloc.cCode} : ');
                            },
                          ),
                          validator: (value) {
                            if (value!.isEmpty) {
                              return Tr.get.phone_number_validation;
                            }
                            return null;
                          },
                        ),
                        const SizedBox(height: 10),
                        if (KStorage.i.getUserInfo?.data?.address?.cityId?.countryId?.id == 191)
                          Column(
                            children: [
                              KTextFormField(
                                controller: AddVendorBloc.of(context).commercialIDCtrl,
                                hintText: Tr.get.commercial_id,
                                enabled: true,
                                keyboardType: TextInputType.number,
                                validator: (value) {
                                  if (value!.isEmpty) {
                                    return Tr.get.name_validation;
                                  }
                                  return null;
                                },
                              ),
                              const SizedBox(height: 10),
                              KTextFormField(
                                controller: AddVendorBloc.of(context).entityIdCtrl,
                                hintText: Tr.get.entity_id,
                                enabled: true,
                                keyboardType: TextInputType.number,
                                validator: (value) {
                                  if (value!.isEmpty) {
                                    return Tr.get.name_validation;
                                  }
                                  return null;
                                },
                              ),
                            ],
                          ),
                        const SizedBox(height: 10),
                        KDropdownBtn<KVendorState>(
                          onChanged: AddVendorBloc.of(context).setVendorstate,
                          value: AddVendorBloc.of(context).vendorState,
                          items: KVendorState.add.map((e) => KHelper.of(context).itemView<KVendorState>(itemText: e.name, value: e)).toList(),
                          title: Tr.get.status,
                        ),
                        const SizedBox(height: 10),
                        AddVendorBloc.of(context).stateIsNull ?? false
                            ? Text(
                                Tr.get.field_required,
                                style: KTextStyle.of(context).error,
                              )
                            : const SizedBox(),
                        buildFields(AddVendorBloc.of(context).vendorState, context, false),
                        const SizedBox(height: 10),
                        BlocBuilder<GetLocationCubit, GetLocationState>(
                          builder: (context, state) {
                            return state.maybeWhen(
                              orElse: () => KTextFormField(
                                // enabled: false,
                                controller: AddVendorBloc.of(context).detailedAddressController,
                                hintText: Tr.get.address,
                                onTap: () async {
                                  await GetLocationCubit.of(context).initLocation().then((value) {
                                    value.fold(
                                      (l) => KHelper.showSnackBar(KFailure.toError(l)),
                                      (r) {
                                        {
                                          try {
                                            debugPrint('=>>>>>>>>>trueeee');
                                            AddVendorBloc.of(context).selectAddress(context);
                                          } catch (e) {
                                            KHelper.showSnackBar(Tr.get.address_is_null);
                                          }
                                        }
                                      },
                                    );
                                  });
                                },
                                validator: (value) {
                                  if (value!.isEmpty) {
                                    return Tr.get.field_required;
                                  }
                                  return null;
                                },
                              ),
                              loading: () => const Center(
                                child: CircularProgressIndicator(),
                              ),
                            );
                          },
                        ),
                        const SizedBox(height: 30),
                        KButton(
                          title: Tr.get.add,
                          width: Get.width - 40,
                          onPressed: () {
                            if (_formKey.currentState!.validate()) {
                              AddVendorBloc.of(context).addVendor(company_type: isAgency ? 'agencies' : 'vendors');
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
      ),
    );
  }
}
