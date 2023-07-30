import 'package:file_picker/file_picker.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';

import '../../di.dart';
import '../../logic/company/create_company/company_bloc.dart';
import '../../logic/company/create_company/company_state.dart';
import '../../logic/nav_enforcer/nav_enforcer_bloc.dart';
import '../../packages/shared/localization/trans.dart';
import '../../packages/shared/theme/colors.dart';
import '../../packages/shared/theme/helper.dart';
import '../../packages/shared/theme/text_theme.dart';
import '../../packages/widgets/custom_button.dart';
import '../../packages/widgets/icon_button.dart';
import '../../packages/widgets/pick_image_widget.dart';
import '../../packages/widgets/text_field.dart';
import '../main_screen/main_screen.dart';
import '../widgets/loading/loading_overlay.dart';
import 'new/create_company_dui.dart';

class CreateCompanyScreen extends StatefulWidget {
  const CreateCompanyScreen({Key? key}) : super(key: key);

  static final GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  @override
  State<CreateCompanyScreen> createState() => _CreateCompanyScreenState();
}

class _CreateCompanyScreenState extends State<CreateCompanyScreen> {
  @override
  void initState() {
    Future.delayed(const Duration(milliseconds: 500), () {
      KHelper.showCustomBottomSheet(const RegisterDialog());
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => Di.companyBloc,
      child: BlocConsumer<CompanyBloc, CompanyState>(
        listener: (context, state) {
          state.whenOrNull(
            success: () {
              NavEnforcerBloc.of(context).checkUser(
                msg: Tr.get.company_created_success,
                destination: const MainNavigationView(),
              );
            },
          );
        },
        builder: (context, state) {
          final comBloc = CompanyBloc.of(context);
          return Scaffold(
            body: KLoadingOverlay(
              isLoading: state.maybeWhen(orElse: () => false, loading: () => true),
              child: SingleChildScrollView(
                padding: const EdgeInsets.symmetric(horizontal: KHelper.hScaffoldPadding),
                child: Form(
                  key: CreateCompanyScreen._formKey,
                  child: Column(
                    children: [
                      SizedBox(height: Get.height * .1),
                      Center(child: SvgPicture.asset('assets/images/Logo Only.svg')),
                      // Text(
                      //   Tr.get.create_conmpany,
                      //   style: KTextStyle.of(context).headers2,
                      // ),
                      const SizedBox(height: 20),
                      PickProImageWidget(onSelect: comBloc.selectImage, hint: Tr.get.add_logo),
                      const SizedBox(height: 20),

                      Align(
                        alignment: Tr.isAr ? Alignment.topRight : Alignment.topLeft,
                        child: Text(
                          Tr.get.business_information,
                          style: KTextStyle.of(context).topHint,
                        ),
                      ),
                      SizedBox(height: Get.height * .01),
                      KTextFormField(
                        controller: comBloc.companyNameController,
                        hintText: Tr.get.company_name,
                        enabled: true,
                        keyboardType: TextInputType.text,
                        validator: (value) {
                          if (value!.isEmpty) {
                            return Tr.get.field_required;
                          }
                          return null;
                        },
                      ),
                      SizedBox(height: Get.height * .01),
                      KTextFormField(
                        controller: comBloc.companyDesController,
                        hintText: Tr.get.company_short_description,
                        enabled: true,
                        keyboardType: TextInputType.text,
                        validator: (value) {
                          if (value!.isEmpty) {
                            return Tr.get.field_required;
                          }
                          return null;
                        },
                      ),
                      SizedBox(height: Get.height * .01),
                      // BlocProvider(
                      //   create: (context) => PickMultipleImageCubit(),
                      //   child: BlocBuilder<PickMultipleImageCubit, PickMultipleImageState>(
                      //     builder: (context, state) {
                      //       final images = PickMultipleImageCubit.of(context);
                      //       return Column(
                      //         children: [
                      //           InkWell(
                      //             onTap: () async {
                      //               comBloc.addCoverPhotos(await PickMultipleImageCubit.of(context).selectImages());
                      //             },
                      //             child: Container(
                      //               padding: const EdgeInsets.all(10),
                      //               width: double.infinity,
                      //               decoration: BoxDecoration(
                      //                 borderRadius: BorderRadius.circular(KHelper.cornerRadius),
                      //                 border: Border.all(
                      //                   color: KColors.of(context).activeIcons,
                      //                 ),
                      //               ),
                      //               child: Row(
                      //                 mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      //                 children: [
                      //                   Text(Tr.get.pick_covers),
                      //                   const Icon(Icons.camera),
                      //                 ],
                      //               ),
                      //             ),
                      //           ),
                      //           SizedBox(height: Get.height * .01),
                      //           if (images.imageFileList!.isNotEmpty)
                      //             SizedBox(
                      //               height: 150,
                      //               child: ListView.builder(
                      //                 itemBuilder: (context, i) => Stack(
                      //                   children: [
                      //                     Container(
                      //                       margin: const EdgeInsets.symmetric(horizontal: 5),
                      //                       child: ClipRRect(
                      //                         borderRadius: BorderRadius.circular(8.0),
                      //                         child: Image.file(
                      //                           File(images.imageFileList![i].path),
                      //                           fit: BoxFit.cover,
                      //                         ),
                      //                       ),
                      //                     ),
                      //                     Positioned(
                      //                       right: 0,
                      //                       child: KIconButton(
                      //                         child: Icon(Icons.close, color: KColors.of(context).error),
                      //                         onPressed: () {
                      //                           images.imageFileList!.removeAt(i);
                      //                           comBloc.removeCover(i);
                      //                         },
                      //                       ),
                      //                     )
                      //                   ],
                      //                 ),
                      //                 itemCount: images.imageFileList!.length,
                      //                 scrollDirection: Axis.horizontal,
                      //               ),
                      //             ),
                      //         ],
                      //       );
                      //     },
                      //   ),
                      // ),
                      const Divider(height: 25, thickness: 2),

                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Align(
                            alignment: Alignment.topLeft,
                            child: Text(
                              Tr.get.email,
                              style: KTextStyle.of(context).body,
                            ),
                          ),
                          InkWell(
                            onTap: comBloc.addNewEmail,
                            child: Container(
                              padding: const EdgeInsets.symmetric(horizontal: 22, vertical: 2),
                              decoration: BoxDecoration(color: KColors.of(context).activeIcons, borderRadius: BorderRadius.circular(2)),
                              child: SvgPicture.asset('assets/images/plus_u.svg'),
                            ),
                          ),
                        ],
                      ),
                      const SizedBox(height: 10),
                      Row(
                        children: [
                          Expanded(
                            child: KTextFormField(
                              controller: comBloc.departmentController,
                              hintText: Tr.get.department,
                              enabled: true,
                              keyboardType: TextInputType.emailAddress,
                              validator: (value) {
                                if (value!.isEmpty && (comBloc.createCompanyModel?.emailKeys ?? []).isEmpty) {
                                  return Tr.get.field_required;
                                }
                                return null;
                              },
                            ),
                          ),
                          SizedBox(width: Get.width * .03),
                          Expanded(
                            child: KTextFormField(
                              controller: comBloc.emailController,
                              hintText: Tr.get.social_link,
                              enabled: true,
                              keyboardType: TextInputType.emailAddress,
                              validator: (value) {
                                if (value!.isEmpty && (comBloc.createCompanyModel?.emailValues ?? []).isEmpty) {
                                  return Tr.get.field_required;
                                }
                                return null;
                              },
                            ),
                          ),
                        ],
                      ),
                      SizedBox(height: Get.height * .01),
                      // KTextFormField(
                      //   controller: comBloc.hotlineController,
                      //   hintText: Tr.get.hotline,
                      //   enabled: true,
                      //   keyboardType: TextInputType.emailAddress,
                      //   validator: (value) {
                      //     if (value!.isEmpty && (comBloc.createCompanyModel?.hotlineValues ?? []).isEmpty) {
                      //       return Tr.get.field_required;
                      //     }
                      //     return null;
                      //   },
                      // ),
                      if (comBloc.createCompanyModel?.emailKeys != null && (comBloc.createCompanyModel!.emailKeys!.isNotEmpty))
                        Container(
                          padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
                          margin: const EdgeInsets.symmetric(vertical: 10),
                          decoration: KHelper.of(context).outLined,
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              for (int i = 0; i < comBloc.createCompanyModel!.emailKeys!.length; i++)
                                Row(
                                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                  children: [
                                    Expanded(
                                      child: Text(
                                        comBloc.createCompanyModel!.emailKeys![i],
                                        style: KTextStyle.of(context).body2,
                                        overflow: TextOverflow.ellipsis,
                                      ),
                                    ),
                                    Expanded(
                                      child: Text(
                                        comBloc.createCompanyModel!.emailValues![i],
                                        style: KTextStyle.of(context).body2,
                                        overflow: TextOverflow.ellipsis,
                                      ),
                                    ),
                                    // Expanded(
                                    //   child: Text(
                                    //     comBloc.createCompanyModel!.hotlineValues![i],
                                    //     style: KTextStyle.of(context).body2,
                                    //     overflow: TextOverflow.ellipsis,
                                    //   ),
                                    // ),
                                    KIconButton(
                                      child: Icon(Icons.close, color: KColors.of(context).error),
                                      onPressed: () {
                                        comBloc.removeEmail(i);
                                      },
                                    )
                                  ],
                                ),
                            ],
                          ),
                        ),
                      const Divider(height: 25, thickness: 2),

                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Align(
                            alignment: Alignment.topLeft,
                            child: Text(
                              Tr.get.add_commercial_info,
                              style: KTextStyle.of(context).body,
                            ),
                          ),
                          InkWell(
                            onTap: () {
                              comBloc.addCommercialInfo();
                            },
                            child: Container(
                              padding: const EdgeInsets.symmetric(horizontal: 22, vertical: 2),
                              decoration: BoxDecoration(color: KColors.of(context).activeIcons, borderRadius: BorderRadius.circular(2)),
                              child: SvgPicture.asset('assets/images/plus_u.svg'),
                            ),
                          ),
                        ],
                      ),
                      const SizedBox(height: 10),
                      Row(
                        children: [
                          Expanded(
                            child: KTextFormField(
                              controller: comBloc.typeController,
                              hintText: Tr.get.type,
                              enabled: true,
                              keyboardType: TextInputType.emailAddress,
                              validator: (value) {
                                if (value!.isEmpty && (comBloc.createCompanyModel?.commercialKeys ?? []).isEmpty) {
                                  return Tr.get.field_required;
                                }
                                return null;
                              },
                            ),
                          ),
                          SizedBox(width: Get.width * .03),
                          Expanded(
                            child: KTextFormField(
                              controller: comBloc.commercialNumberController,
                              hintText: Tr.get.document_number,
                              enabled: true,
                              keyboardType: TextInputType.emailAddress,
                              validator: (value) {
                                if (value!.isEmpty && (comBloc.createCompanyModel?.commercialValues ?? []).isEmpty) {
                                  return Tr.get.field_required;
                                }
                                return null;
                              },
                            ),
                          ),
                        ],
                      ),
                      if (comBloc.createCompanyModel?.commercialKeys != null && (comBloc.createCompanyModel!.commercialKeys!.isNotEmpty))
                        Container(
                          padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
                          margin: const EdgeInsets.symmetric(vertical: 10),
                          decoration: KHelper.of(context).outLined,
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              for (int i = 0; i < comBloc.createCompanyModel!.commercialKeys!.length; i++)
                                Row(
                                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                  children: [
                                    Expanded(
                                      child: Text(
                                        comBloc.createCompanyModel!.commercialKeys![i],
                                        style: KTextStyle.of(context).body2,
                                        overflow: TextOverflow.ellipsis,
                                      ),
                                    ),
                                    Expanded(
                                      child: Text(
                                        comBloc.createCompanyModel!.commercialValues![i],
                                        style: KTextStyle.of(context).body2,
                                        overflow: TextOverflow.ellipsis,
                                      ),
                                    ),
                                    KIconButton(
                                      child: Icon(Icons.close, color: KColors.of(context).error),
                                      onPressed: () {
                                        comBloc.removeCommerical(i);
                                      },
                                    )
                                  ],
                                ),
                            ],
                          ),
                        ),

                      Padding(
                        padding: const EdgeInsets.symmetric(vertical: 10),
                        child: KButton(
                          title: Tr.get.upload_file,
                          onPressed: () async {
                            FilePickerResult? result = await FilePicker.platform.pickFiles(
                              type: FileType.custom,
                              allowMultiple: true,
                              allowedExtensions: [
                                'pdf',
                                'doc',
                              ],
                            );
                            comBloc.addCommercialFiles(result);
                          },
                        ),
                      ),
                      if (comBloc.hasCommFile != null && !comBloc.hasCommFile!)
                        Text(
                          Tr.get.field_required,
                          style: KTextStyle.of(context).error,
                        ),
                      if (comBloc.commercialFiles != null && comBloc.commercialFiles!.isNotEmpty)
                        Wrap(
                          children: [
                            ...comBloc.commercialFiles!.map((e) {
                              return Row(
                                mainAxisSize: MainAxisSize.min,
                                children: [
                                  const Icon(Icons.file_copy),
                                  const SizedBox(width: 8),
                                  Expanded(child: Text(e.name, overflow: TextOverflow.ellipsis, maxLines: 1)),
                                  const SizedBox(width: 8),
                                  KIconButton(
                                    child: Icon(Icons.close, color: KColors.of(context).error),
                                    onPressed: () {
                                      comBloc.removeCFile(e);
                                    },
                                  )
                                ],
                              );
                            }).toList(),
                          ],
                        ),

                      const Divider(height: 25, thickness: 2),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Align(
                            alignment: Alignment.topLeft,
                            child: Text(
                              Tr.get.add_social_info,
                              style: KTextStyle.of(context).body,
                            ),
                          ),
                          InkWell(
                            onTap: () {
                              comBloc.addSocialInfo();
                            },
                            child: Container(
                              padding: const EdgeInsets.symmetric(horizontal: 22, vertical: 2),
                              decoration: BoxDecoration(color: KColors.of(context).activeIcons, borderRadius: BorderRadius.circular(2)),
                              child: SvgPicture.asset(
                                'assets/images/plus_u.svg',
                              ),
                            ),
                          ),
                        ],
                      ),
                      const SizedBox(height: 10),

                      Row(
                        children: [
                          Expanded(
                            child: KTextFormField(
                              controller: comBloc.socialNameController,
                              hintText: Tr.get.name,
                              enabled: true,
                              keyboardType: TextInputType.emailAddress,
                              validator: (value) {
                                if (value!.isEmpty && (comBloc.createCompanyModel?.socialNames ?? []).isEmpty) {
                                  return Tr.get.field_required;
                                }
                                return null;
                              },
                            ),
                          ),
                          SizedBox(width: Get.width * .03),
                          Expanded(
                            child: KTextFormField(
                              controller: comBloc.socialLinkController,
                              hintText: Tr.get.social_link,
                              enabled: true,
                              keyboardType: TextInputType.emailAddress,
                              validator: (value) {
                                if (value!.isEmpty && (comBloc.createCompanyModel?.socialNamesLinks ?? []).isEmpty) {
                                  return Tr.get.field_required;
                                }
                                return null;
                              },
                            ),
                          ),
                        ],
                      ),
                      if (comBloc.createCompanyModel?.socialNames != null && (comBloc.createCompanyModel!.socialNames!.isNotEmpty))
                        Container(
                          padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
                          margin: const EdgeInsets.symmetric(vertical: 10),
                          decoration: KHelper.of(context).outLined,
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              for (int i = 0; i < comBloc.createCompanyModel!.socialNames!.length; i++)
                                Row(
                                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                  children: [
                                    Expanded(
                                      child: Text(
                                        comBloc.createCompanyModel!.socialNames![i],
                                        style: KTextStyle.of(context).body2,
                                        overflow: TextOverflow.ellipsis,
                                      ),
                                    ),
                                    Expanded(
                                      child: Text(
                                        comBloc.createCompanyModel!.socialNamesLinks![i],
                                        style: KTextStyle.of(context).body2,
                                        overflow: TextOverflow.ellipsis,
                                      ),
                                    ),
                                    KIconButton(
                                      child: Icon(Icons.close, color: KColors.of(context).error),
                                      onPressed: () {
                                        comBloc.removeSocial(i);
                                      },
                                    )
                                  ],
                                ),
                            ],
                          ),
                        ),

                      const SizedBox(height: 10),
                      // KTextFormField(
                      //   controller: comBloc.agentIdController,
                      //   hintText: 'Agent ID (Not Required)',
                      //   keyboardType: TextInputType.emailAddress,
                      //   validator: (value) {
                      //     if (value!.isEmpty) {
                      //       return 'please enter your Agent ID';
                      //     }
                      //     return null;
                      //   },
                      // ),
                      Padding(
                        padding: const EdgeInsets.symmetric(vertical: 30),
                        child: KButton(
                          title: Tr.get.done,
                          onPressed: () {
                            comBloc.createCom();
                            if (CreateCompanyScreen._formKey.currentState!.validate()) {
                              FocusManager.instance.primaryFocus?.unfocus();
                            }
                          },
                          height: Get.height * 0.05,
                          width: Get.width * 5,
                        ),
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
