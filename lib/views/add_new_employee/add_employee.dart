import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';

import '../../data/models/employee_model.dart';
import '../../di.dart';
import '../../logic/auth/user_info/user_info_bloc.dart';
import '../../logic/barnch_Staff/add_barnch_staff/add_employee_bloc.dart';
import '../../logic/barnch_Staff/add_barnch_staff/add_employee_state.dart';
import '../../logic/barnch_Staff/get_branch_staff/branch_staff_bloc.dart';
import '../../logic/nav_enforcer/nav_enforcer_bloc.dart';
import '../../packages/modules/logic/branches/get_branches/branches_bloc.dart';
import '../../packages/modules/logic/branches/get_branches/branches_state.dart';
import '../../packages/modules/models/branches/branch_model.dart';
import '../../packages/modules/view/branches/branches_list.dart';
import '../../packages/shared/localization/trans.dart';
import '../../packages/shared/picker/view/dialog_picker.dart';
import '../../packages/shared/theme/colors.dart';
import '../../packages/shared/theme/helper.dart';
import '../../packages/shared/theme/text_theme.dart';
import '../../packages/widgets/custom_button.dart';
import '../../packages/widgets/drop_down.dart';
import '../../packages/widgets/icon_button.dart';
import '../../packages/widgets/pick_image_widget.dart';
import '../../packages/widgets/text_field.dart';
import '../main_screen/main_screen.dart';
import '../widgets/country_code.dart';
import '../widgets/loading/loading_overlay.dart';
import '../widgets/nationality/nationality_drop_down.dart';
import '../widgets/new_bg_img.dart';
import '../widgets/slug_drop_down.dart';

class AddNewEmployeeScreen extends StatefulWidget {
  const AddNewEmployeeScreen({Key? key, this.employees}) : super(key: key);
  final EmployeeModel? employees;

  @override
  State<AddNewEmployeeScreen> createState() => _AddNewEmployeeScreenState();
}

class _AddNewEmployeeScreenState extends State<AddNewEmployeeScreen> {
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: BgImg(
        isInputs: true,
        child: BlocProvider(
          create: (context) => Di.addEmployeeBloc,
          child: BlocConsumer<AddEmployeeBloc, AddEmployeeState>(
            listener: (context, state) {
              state.whenOrNull(
                success: () {
                  BranchStaffBloc.of(context).getStaff();
                  Nav.offAll(const MainNavpages());
                },
              );
            },
            builder: (context, state) {
              final addEmp = AddEmployeeBloc.of(context);
              return KLoadingOverlay(
                isLoading: state.maybeWhen(orElse: () => false, loading: () => true),
                child: Padding(
                  padding: const EdgeInsets.symmetric(horizontal: KHelper.hScaffoldPadding),
                  child: SingleChildScrollView(
                    scrollDirection: Axis.vertical,
                    child: Column(
                      children: [
                        SizedBox(height: Get.height * .1),
                        SvgPicture.asset('assets/images/Logo Only.svg'),
                        Text(
                          widget.employees != null ? Tr.get.update_employee : Tr.get.add_new_employeee,
                          style: TextStyle(
                            color: KColors.of(context).accentColor,
                            fontWeight: FontWeight.bold,
                            fontSize: 20,
                          ),
                        ),

                        /// SizedBox(height: Get.height * .05),
                        /// SvgPicture.asset('assets/images/registration.svg'),
                        /// SizedBox(height: Get.height * .07),
                        Form(
                          key: _formKey,
                          child: Column(
                            children: [
                              Padding(
                                padding: const EdgeInsets.symmetric(vertical: 30),
                                child: PickProImageWidget(onSelect: addEmp.selectImage, hint: Tr.get.employee_photo),
                              ),
                              Row(
                                mainAxisAlignment: MainAxisAlignment.start,
                                children: [
                                  Text(
                                    Tr.get.employee_info,
                                    style: KTextStyle.of(context).topHint,
                                  ),
                                ],
                              ),
                              const SizedBox(height: 10),
                              KTextFormField(
                                controller: addEmp.nameController,
                                hintText: Tr.get.name,
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
                              KDropdownBtn<KSlugModel>(
                                onChanged: addEmp.selectGender,
                                items: KSlugModel.genders.map((e) => KHelper.of(context).itemView<KSlugModel>(itemText: e.translated, value: e)).toList(),
                                title: Tr.get.gender,
                              ),

                              // const SizedBox(height: 10),
                              // Text(Tr.get.birthdate_title,
                              //     style: KTextStyle.of(context).body),
                              const SizedBox(height: 10),
                              InkWell(
                                onTap: () {
                                  addEmp.selectDate(context);
                                },
                                child: KTextFormField(
                                  hintText: addEmp.addEmployeeModel?.birthdate.toString(),
                                  enabled: false,
                                  autofocus: false,
                                ),
                              ),
                              const SizedBox(height: 10),
                              if (UserInfoBloc.of(context).user?.data?.userCompany != null)
                                BlocConsumer<BranchesBloc, BranchesState>(
                                  listener: (context, state) {
                                    state.whenOrNull(
                                      success: (model) {
                                        if (model.branchData?.isEmpty ?? false) {
                                          KHelper.showSnackBar(Tr.get.create_branch_first);
                                          Nav.to(const BranchesList());
                                        }
                                      },
                                    );
                                  },
                                  builder: (context, state) {
                                    final branchList = state.maybeWhen(
                                      orElse: () => <BranchData>[],
                                      success: (model) => model.branchData!,
                                    );
                                    return Column(
                                      children: [
                                        if (branchList.isEmpty)
                                          TextButton(
                                            child: Text(
                                              Tr.get.dont_have_branches,
                                              style: KTextStyle.of(context).textBtn,
                                            ),
                                            onPressed: () {
                                              Nav.to(const BranchesList());
                                            },
                                          )
                                        else
                                          KDropdownBtn<BranchData>(
                                            onChanged: (val) {
                                              addEmp.selectBranchId(val!);
                                            },
                                            items: branchList
                                                .map(
                                                  (e) => KHelper.of(context).itemView<BranchData>(itemText: "${e.addressId?.detailedAddress}", value: e),
                                                )
                                                .toList(),
                                            title: state.maybeWhen(orElse: () => false, loading: () => true) ? Tr.get.loading : Tr.get.select_branch,
                                            value: addEmp.selectedBranch,
                                          ),
                                        if (state.maybeWhen(orElse: () => false, error: (e) => true))
                                          TextButton(
                                            onPressed: () {
                                              BranchesBloc.of(context).getBranches();
                                            },
                                            child: Text(Tr.get.try_again),
                                          ),
                                      ],
                                    );
                                  },
                                ),
                              const SizedBox(height: 10),
                              InkWell(
                                onTap: () async {
                                  await KHelper.showCustomBottomSheet(
                                    isDismissible: false,
                                    AddLocationDetails(
                                      onSave: (value) {
                                        if (value != null) {
                                          addEmp.setLocationData(value);

                                          Nav.back();
                                        }
                                      },
                                      initialData: addEmp.setInitial(),
                                    ),
                                  );
                                },
                                child: Container(
                                  decoration: KHelper.of(context).fillContainer,
                                  padding: const EdgeInsets.symmetric(horizontal: 10),
                                  height: 45,
                                  child: Row(
                                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                    crossAxisAlignment: CrossAxisAlignment.center,
                                    children: [
                                      Expanded(
                                        child: Text(
                                          addEmp.location ?? Tr.get.location_input,
                                          style: addEmp.location == null ? KTextStyle.of(context).hint : KTextStyle.of(context).title3,
                                        ),
                                      ),
                                      Icon(
                                        Icons.location_on_outlined,
                                        color: KColors.of(context).accentColor,
                                      ),
                                    ],
                                  ),
                                ),
                              ),
                              if (addEmp.addressIsNull) Text(Tr.get.address_is_null, style: KTextStyle.of(context).error),
                              const SizedBox(height: 10),
                              NationalityDropDown(
                                onChanged: (p0) {
                                  addEmp.selectNationality(
                                    p0?.id ?? -1,
                                  );
                                },
                              ),
                              const SizedBox(height: 10),

                              Directionality(
                                textDirection: TextDirection.ltr,
                                child: KTextFormField(
                                  controller: addEmp.phoneController,
                                  hintText: Tr.get.phone_number,
                                  enabled: true,
                                  keyboardType: TextInputType.phone,
                                  prefixIcon: widget.employees == null
                                      ? CountryCodeWidget(
                                          onChanged: (p0) {
                                            addEmp.cCode = "(${p0?.dialCode ?? '+966'})".replaceAll('+', '');
                                            debugPrint('================= ${addEmp.cCode} : ');
                                          },
                                          onInit: (p0) {
                                            addEmp.cCode = "(${p0?.dialCode ?? '+966'})".replaceAll('+', '');
                                            debugPrint('================= ${addEmp.cCode} : ');
                                          },
                                        )
                                      : const SizedBox(),
                                  validator: (value) {
                                    if (value!.isEmpty) {
                                      return Tr.get.phone_number_validation;
                                    }
                                    return null;
                                  },
                                ),
                              ),
                              const SizedBox(height: 10),
                              // KTextFormField(
                              //   controller: addEmp.requiredContractsController,
                              //   hintText: Tr.get.required_contract,
                              //   enabled: true,
                              //   keyboardType: TextInputType.phone,
                              //   validator: (value) {
                              //     if (value!.isEmpty) {
                              //       return Tr.get.please_enter_required_contract;
                              //     }
                              //     return null;
                              //   },
                              // ),
                              // const SizedBox(height: 10),
                              KTextFormField(
                                hintText: Tr.get.email_for_employee,
                                controller: addEmp.emailController,
                                enabled: true,
                                keyboardType: TextInputType.emailAddress,
                                validator: (value) {
                                  if (value!.isEmpty) {
                                    return Tr.get.email_validation;
                                  }
                                  return null;
                                },
                              ),
                              const SizedBox(height: 10),
                              KTextFormField(
                                hintText: Tr.get.password,
                                controller: addEmp.passwordController,
                                obscureText: addEmp.passVisible,
                                keyboardType: TextInputType.visiblePassword,
                                validator: (value) {
                                  if (value!.isEmpty) {
                                    return Tr.get.pass_validation;
                                  }
                                  return null;
                                },
                                suffixIcon: KIconButton(
                                  onPressed: addEmp.togglePassV,
                                  child: Icon(!addEmp.passVisible ? KHelper.visibilityOff : KHelper.visibility),
                                ),
                              ),
                              const SizedBox(height: 10),
                              KTextFormField(
                                hintText: Tr.get.confirm_password,
                                obscureText: addEmp.passVisible,
                                controller: addEmp.passwordConfirmController,
                                keyboardType: TextInputType.visiblePassword,
                                validator: (value) {
                                  if (value!.isEmpty) {
                                    return Tr.get.pass_validation;
                                  }
                                  if (value != addEmp.passwordController.text) {
                                    return Tr.get.confirm_password_matching_validation;
                                  }
                                  return null;
                                },
                                suffixIcon: KIconButton(
                                  onPressed: addEmp.togglePassV,
                                  child: Icon(!addEmp.passVisible ? KHelper.visibilityOff : KHelper.visibility),
                                ),
                              ),
                              const SizedBox(height: 40),
                              KButton(
                                title: widget.employees != null ? Tr.get.update : Tr.get.add,
                                onPressed: () {
                                  if (widget.employees != null) {
                                    addEmp.updateEmployee();
                                    return;
                                  }
                                  if (_formKey.currentState!.validate()) {
                                    FocusManager.instance.primaryFocus?.unfocus();
                                    addEmp.addEmployee();
                                    return;
                                  }
                                },
                                height: 45,
                              ),
                              const SizedBox(height: 50),
                            ],
                          ),
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
