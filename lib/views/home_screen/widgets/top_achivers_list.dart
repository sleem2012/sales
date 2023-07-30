import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import '../../../data/models/branch_staff/branch_staff_model.dart';
import '../../../packages/modules/models/company/company_model.dart';
import '../../../packages/shared/localization/trans.dart';
import '../../../packages/shared/theme/colors.dart';
import '../../../packages/shared/theme/helper.dart';
import '../../../packages/shared/theme/text_theme.dart';
import '../../../packages/widgets/search_manager.dart';
import '../managers_list_tile.dart';
import '../../subordinate/subordinate.dart';
import 'package:get/get.dart';

class TopAchieversListView extends StatelessWidget {
  final BranchStaffData staffData;

  const TopAchieversListView({Key? key, required this.staffData}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    if (staffData.employees?.isEmpty ?? true) {
      return const SizedBox();
    }
    return Column(
      children: [
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 24),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                Tr.get.top_achievers,
                style: KTextStyle.of(context).title2,
              ),
              TextButton(
                child: Text(Tr.get.show_more, style: KTextStyle.of(context).body),
                onPressed: () {
                  KHelper.showCustomBottomSheetWTIntrinsic(
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: SearchableView<CompanyOwner>(
                        initialList: staffData.employees ?? [],
                        where: (item) => item.name,
                        whereList: (item) => [],
                        builder: (employees, isSearching) => ListView.builder(
                          itemCount: employees.length,
                          shrinkWrap: true,
                          itemBuilder: (context, i) {
                            return Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: ManagersListTile(
                                data: employees[i],
                              ),
                            );
                          },
                        ),
                      ),
                    ),
                  );
                },
              )
            ],
          ),
        ),
        SizedBox(
          height: 120.0,
          child: ListView.separated(
            padding: const EdgeInsets.symmetric(horizontal: 10),
            separatorBuilder: (context, i) => const SizedBox(
              width: 8,
            ),
            scrollDirection: Axis.horizontal,
            itemCount: staffData.employees?.length ?? 0,
            itemBuilder: (_, index) {
              return InkWell(
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) =>
                          SubordinateScreen(employees: staffData.employees?[index] ?? CompanyOwner(), isSales: staffData.employees?[index].type?.id == 7),
                    ),
                  );
                },
                child: Stack(
                  clipBehavior: Clip.none,
                  alignment: AlignmentDirectional.topCenter,
                  children: [
                    Align(
                      alignment: Alignment.bottomCenter,
                      child: Container(
                        padding: const EdgeInsets.all(5),
                        alignment: Alignment.center,
                        height: 90.0,
                        width: Get.width / 3,
                        decoration: KHelper.of(context).elevatedBox,
                        child: Center(
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              const SizedBox(
                                height: 15,
                              ),
                              Text(
                                "${staffData.employees?[index].name.toString()}",
                                style: KTextStyle.of(context).body2,
                                maxLines: 1,
                                overflow: TextOverflow.ellipsis,
                                textAlign: TextAlign.center,
                              ),
                              const SizedBox(
                                height: 8,
                              ),
                              Text(
                                "${staffData.employees?[index].achievedContracts.toString()}"
                                ' ${Tr.get.contracts}',
                                style: KTextStyle.of(context).body3,
                                textAlign: TextAlign.center,
                              ),
                            ],
                          ),
                        ),
                      ),
                    ),
                    Positioned(
                      top: 0,
                      child: CircleAvatar(
                        radius: 30.0,
                        backgroundColor: KColors.of(context).elevated,
                        child: CircleAvatar(
                          radius: 25.0,
                          backgroundImage: CachedNetworkImageProvider(
                            staffData.employees?[index].image?.s128px?.toString() ?? dummyNetImg,
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              );
            },
          ),
        ),
      ],
    );
  }
}
