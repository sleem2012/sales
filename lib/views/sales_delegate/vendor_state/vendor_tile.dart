import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';

import '../../../data/models/branch_staff/vendors_model.dart';
import '../../../data/models/sales_delegate/vendor_states/vendor_states.dart';
import '../../../di.dart';
import '../../../logic/barnch_Staff/get_branch_staff/branch_staff_bloc.dart';
import '../../../logic/nav_enforcer/nav_enforcer_bloc.dart';
import '../../../logic/sales_delegate/update_vendor/update_vendor_bloc.dart';
import '../../../logic/sales_delegate/update_vendor/update_vendor_state.dart';
import '../../../logic/theme/theme_cubit.dart';
import '../../../packages/modules/models/company/company_model.dart';
import '../../../packages/shared/localization/trans.dart';
import '../../../packages/shared/theme/colors.dart';
import '../../../packages/shared/theme/helper.dart';
import '../../../packages/shared/theme/text_theme.dart';
import '../../../packages/widgets/icon_button.dart';
import '../../subordinate/subordinate.dart';
import '../../subordinate/widget/edit_user.dart';
import '../../widgets/action_dialog.dart';
import '../../widgets/slug_drop_down.dart';
import '../../widgets/vendor/vendor_details.dart';
import '../update_vendor.dart';

class VendorsTile extends StatelessWidget {
  final VendorsModel data;
  final bool canUpdate;
  final bool showMore;

  const VendorsTile({Key? key, required this.data, required this.canUpdate, this.showMore = false}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final decoration = KHelper.of(context).elevatedBox.copyWith(color: KHelper.of(context).elevatedBox.color?.withOpacity(.5), borderRadius: BorderRadius.circular(0));
    final width = MediaQuery.of(context).size.width;

    return BlocProvider(
      create: (context) => Di.updateVendorBloc,
      child: Stack(
        clipBehavior: Clip.none,
        children: [
          InkWell(
            onTap: () {
              if (data.state == KVendorState.joined && searchCollection?.vendor?.view?.company == true) {
                Nav.to(VendorDetails(vendor: data));
              } else {
                return;
              }
            },
            child: Container(
              decoration: decoration,
              // height: Get.height * .13,
              width: width,
              padding: const EdgeInsets.symmetric(vertical: 30, horizontal: 10),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  if (data.state == KVendorState.joined)
                    Padding(
                      padding: const EdgeInsets.only(bottom: 8.0),
                      child: CircleAvatar(
                        radius: 24,
                        backgroundColor: Colors.white,
                        backgroundImage: CachedNetworkImageProvider(data.company?.logo?.s128px?.toString() ?? dummyNetImg),
                      ),
                    ),
                  const SizedBox(width: 8),
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisAlignment: MainAxisAlignment.start,
                      // mainAxisSize: MainAxisSize.min,
                      children: [
                        if (data.state == KVendorState.joined)
                          Text(
                            "${data.company?.name?.value.toString().capitalize}",
                            style: KTextStyle.of(context).title,
                            overflow: TextOverflow.ellipsis,
                          ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.start,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Expanded(
                              child: Column(
                                mainAxisAlignment: MainAxisAlignment.start,
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  //email
                                  Row(
                                    children: [
                                      if (data.state != KVendorState.joined)
                                        const Icon(
                                          Icons.email,
                                          size: 20,
                                        ),
                                      const SizedBox(
                                        width: 3,
                                      ),
                                      Expanded(
                                        child: Text(
                                          data.email.toString().capitalize ?? '',
                                          style: KTextStyle.of(context).body2,
                                          overflow: TextOverflow.ellipsis,
                                        ),
                                      ),
                                    ],
                                  ),

                                  if (data.state != KVendorState.joined) ...[
                                    Row(
                                      children: [
                                        const Icon(
                                          Icons.home,
                                          size: 20,
                                        ),
                                        const SizedBox(
                                          width: 3,
                                        ),
                                        Text(
                                          data.company_name.toString().capitalize ?? '',
                                          style: KTextStyle.of(context).body2,
                                          overflow: TextOverflow.ellipsis,
                                        ),
                                      ],
                                    ),
                                    Row(
                                      children: [
                                        const Icon(
                                          Icons.phone,
                                          size: 20,
                                        ),
                                        const SizedBox(
                                          width: 3,
                                        ),
                                        Text(
                                          data.phone.toString().capitalize ?? '',
                                          style: KTextStyle.of(context).body2,
                                          overflow: TextOverflow.ellipsis,
                                          textDirection: TextDirection.ltr,
                                        ),
                                      ],
                                    ),
                                  ],
                                ],
                              ),
                            ),
                            // SizedBox(width: 7,),
                            Expanded(
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  if (data.state != KVendorState.joined) ...[
                                    Row(
                                      children: [
                                        const Icon(
                                          Icons.manage_accounts,
                                          size: 20,
                                        ),
                                        const SizedBox(
                                          width: 3,
                                        ),
                                        Text(
                                          data.owner.toString().capitalize ?? '',
                                          style: KTextStyle.of(context).body2,
                                          overflow: TextOverflow.ellipsis,
                                        ),
                                      ],
                                    ),
                                    Row(
                                      children: [
                                        const Icon(
                                          Icons.location_city_rounded,
                                          size: 20,
                                        ),
                                        const SizedBox(
                                          width: 3,
                                        ),
                                        Text(
                                          data.city?.name?.value.toString().capitalize ?? '',
                                          style: KTextStyle.of(context).body2,
                                          overflow: TextOverflow.ellipsis,
                                        ),
                                      ],
                                    ),
                                    if (data.state == KVendorState.waiting || data.state == KVendorState.pending)
                                      Row(
                                        children: [
                                          const Icon(
                                            Icons.code_off_sharp,
                                            size: 20,
                                          ),
                                          const SizedBox(
                                            width: 3,
                                          ),
                                          Text(
                                            data.verifyCode ?? '',
                                            style: KTextStyle.of(context).body2,
                                            overflow: TextOverflow.ellipsis,
                                          ),
                                        ],
                                      ),
                                    if (data.state == KVendorState.cancelled || data.state == KVendorState.rejected)
                                      Row(
                                        children: [
                                          const Icon(
                                            Icons.format_indent_decrease_outlined,
                                            size: 20,
                                          ),
                                          const SizedBox(
                                            width: 3,
                                          ),
                                          Expanded(
                                            child: Text(
                                              data.reason ?? '',
                                              style: KTextStyle.of(context).body2,
                                              overflow: TextOverflow.ellipsis,
                                            ),
                                          ),
                                        ],
                                      ),
                                  ],
                                ],
                              ),
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ),
          Positioned(
            bottom: -16,
            right: !Tr.isAr ? 20 : null,
            left: Tr.isAr ? 20 : null,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                if (data.state != KVendorState.joined && canUpdate && !showMore)
                  CircleAvatar(
                    radius: 24,
                    backgroundColor: KColors.of(context).fillContainer.withOpacity(1),
                    child: KIconButton(
                      child: Icon(Icons.edit, color: KColors.of(context).accentColor),
                      onPressed: () {
                        KHelper.showCustomBottomSheet(UpdateVendorView(id: data.id!));
                      },
                    ),
                  ),
                const SizedBox(
                  width: 4,
                ),
                if ((data.state == KVendorState.cancelled || data.state == KVendorState.rejected) &&
                    // (SearchCompanyBloc.of(context).fromSearch) &&
                    searchCollection?.vendor?.view?.delete == true)
                  BlocConsumer<UpdateVendorBloc, UpdateVendorState>(
                    listener: (context, state) {
                      state.whenOrNull(
                        success: () {
                          BranchStaffBloc.of(context).getStaff();
                          Nav.back();
                        },
                      );
                    },
                    builder: (context, state) {
                      return CircleAvatar(
                        radius: 24,
                        backgroundColor: KColors.of(context).fillContainer.withOpacity(1),
                        child: KIconButton(
                          child: state is AddVendorStateLoading ? const CircularProgressIndicator() : Icon(Icons.delete, color: KColors.of(context).accentColor),
                          onPressed: () {
                            ActionDialog(
                              title: Tr.get.delete,
                              approveAction: Tr.get.yes_message,
                              cancelAction: Tr.get.no_message,
                              onApproveClick: () {
                                UpdateVendorBloc.of(context).deleteVendor(id: data.id ?? 0);

                                Navigator.pop(context);
                              },
                              onCancelClick: () {
                                Navigator.pop(context);
                              },
                            ).show<void>(context);
                          },
                        ),
                      );
                    },
                  ),
                if (data.state == KVendorState.joined && !showMore) ...[
                  if (searchCollection?.vendor?.view?.agents == true)
                    CircleAvatar(
                      radius: 24,
                      backgroundColor: KColors.of(context).fillContainer.withOpacity(1),
                      child: InkWell(
                        onTap: () {
                          // print("object");
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) => SubordinateScreen(employees: data.company?.agent ?? CompanyOwner(), isSales: false),
                            ),
                          );
                        },
                        child: SvgPicture.asset(
                          'assets/images/Sales_${ThemeBloc.of(context).strTheme}.svg',
                          width: 25,
                        ),
                      ),
                    ),
                  const SizedBox(width: 10),
                  if (searchCollection?.vendor?.view?.owner == true)
                    CircleAvatar(
                      radius: 24,
                      backgroundColor: KColors.of(context).fillContainer.withOpacity(1),
                      child: InkWell(
                        onTap: () {
                          // print("object");
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) => SubordinateScreen(employees: data.company?.owner ?? CompanyOwner(), isSales: false),
                            ),
                          );
                        },
                        child: SvgPicture.asset(
                          'assets/images/CEO_${ThemeBloc.of(context).strTheme}.svg',
                          width: 25,
                        ),
                      ),
                    ),
                  const SizedBox(width: 10),
                  if (searchCollection?.vendor?.view?.lock == true)
                    CircleAvatar(
                      radius: 24,
                      backgroundColor: KColors.of(context).fillContainer.withOpacity(1),
                      child: KIconButton(
                        child: Icon(
                          Icons.lock,
                          color: KColors.of(context).accentBlackColor,
                        ),
                        onPressed: () {
                          KHelper.showCustomBottomSheet(
                            data.company?.owner?.isBlocked == false
                                ? BlockUserDialog(
                                    id: data.company?.owner?.id ?? 0,
                                    isBlocked: data.company?.owner?.isBlocked == false ? 1 : 0,
                                  )
                                : UnBlockUserDialog(
                                    id: data.company?.owner?.id ?? 0,
                                    reson: data.company?.owner?.blockReason ?? '',
                                  ),
                          );
                        },
                      ),
                    ),
                ]
              ],
            ),
          ),
        ],
      ),
    );
  }
}
