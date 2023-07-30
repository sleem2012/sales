import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:get/get_navigation/get_navigation.dart';

import '../../../data/models/branch_staff/vendors_model.dart';
import '../../../data/models/sales_delegate/vendor_states/vendor_states.dart';
import '../../../packages/shared/localization/trans.dart';
import '../../../packages/shared/theme/helper.dart';
import '../../../packages/shared/theme/text_theme.dart';
import '../../../packages/widgets/custom_button.dart';
import '../../../packages/widgets/search_manager.dart';
import 'vendor_tile.dart';

class VendorsLanding extends StatefulWidget {
  final List<VendorsModel> vendors;
  final bool canUpdate;
  final int? employeeId;

  const VendorsLanding({Key? key, required this.vendors, required this.canUpdate, this.employeeId}) : super(key: key);

  @override
  State<VendorsLanding> createState() => _VendorsLandingState();
}

class _VendorsLandingState extends State<VendorsLanding> with SingleTickerProviderStateMixin {
  late TabController tabController = TabController(length: 5, vsync: this);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        TabBar(
          padding: EdgeInsets.symmetric(horizontal: Get.height / 50, vertical: 15),
          controller: tabController,
          labelPadding: const EdgeInsets.symmetric(horizontal: 0, vertical: 5),
          indicatorSize: TabBarIndicatorSize.label,
          tabs: [
            FittedBox(
              child: Text(
                Tr.get.v_pending,
                style: KTextStyle.of(context).tapBar,
              ),
            ),
            FittedBox(
              child: Text(
                Tr.get.v_watting,
                style: KTextStyle.of(context).tapBar,
              ),
            ),
            FittedBox(
              child: Text(
                Tr.get.v_joined,
                style: KTextStyle.of(context).tapBar,
              ),
            ),
            FittedBox(
              child: Text(
                Tr.get.v_cancelled,
                style: KTextStyle.of(context).tapBar,
              ),
            ),
            FittedBox(
              child: Text(
                Tr.get.v_rejected,
                style: KTextStyle.of(context).tapBar,
              ),
            ),
          ],
        ),
        Expanded(
          child: TabBarView(
            controller: tabController,
            children: [
              ...KVendorState.list.map((e) {
                if (widget.vendors.where((element) => element.state == e.slug).isEmpty) {
                  return Center(
                    child: SingleChildScrollView(
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text(Tr.get.no_request_yet),
                          const SizedBox(
                            height: 10,
                          ),
                          SvgPicture.asset("assets/images/No Requests.svg"),
                        ],
                      ),
                    ),
                  );
                } else {
                  return ListView.separated(
                    separatorBuilder: (context, index) => const SizedBox(
                      height: 20,
                    ),
                    padding: const EdgeInsets.only(top: 20, bottom: 100),
                    physics: const NeverScrollableScrollPhysics(),
                    itemCount: (widget.vendors.where((element) => element.state == e.slug).length <= 3) ? widget.vendors.where((element) => element.state == e.slug).length : 3,
                    primary: false,
                    itemBuilder: (context, index) {
                      final filterdList = widget.vendors.where((element) => element.state == e.slug).toList();
                      if (index == 2) {
                        return Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: KButton(
                            title: Tr.get.show_more,
                            onPressed: () {
                              KHelper.showCustomBottomSheetWTIntrinsic(
                                Padding(
                                  padding: const EdgeInsets.all(8.0),
                                  child: SearchableView<VendorsModel>(
                                    initialList: filterdList,
                                    where: (item) => item.email,
                                    whereList: (item) => [],
                                    builder: (list, isSearching) => ListView.separated(
                                      separatorBuilder: (context, index) => const SizedBox(
                                        height: 10,
                                      ),
                                      itemCount: list.length,
                                      shrinkWrap: true,
                                      itemBuilder: (context, i) {
                                        return VendorsTile(
                                          showMore: true,
                                          data: list[i],
                                          canUpdate: widget.canUpdate,
                                        );
                                      },
                                    ),
                                  ),
                                ),
                              );
                            },
                          ),
                        );
                      } else {
                        return VendorsTile(
                          data: filterdList.elementAt(index),
                          canUpdate: widget.canUpdate,
                        );
                      }
                    },
                  );
                }
              }).toList(),
            ],
          ),
        ),
      ],
    );
  }
}
