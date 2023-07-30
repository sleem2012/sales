import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import '../../data/models/famous/famous_data.dart';
import '../../packages/shared/localization/trans.dart';
import '../../packages/shared/theme/helper.dart';
import '../../packages/widgets/custom_button.dart';

import '../../packages/widgets/search_manager.dart';
import 'famous_tile.dart';

class FamousLanding extends StatelessWidget {
  final List<FamousEmployee> famousData;

  const FamousLanding({Key? key, required this.famousData}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Expanded(
          child: (famousData.isEmpty)
              ? Center(
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
                )
              : ListView.builder(
                  padding: const EdgeInsets.only(top: 20, bottom: 100),
                  physics: const NeverScrollableScrollPhysics(),
                  itemCount: (famousData.length <= 3) ? famousData.length : 3,
                  primary: false,
                  itemBuilder: (context, index) {
                    final filteredList = famousData;
                    if (index == 2) {
                      return Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: KButton(
                          title: Tr.get.show_more,
                          onPressed: () {
                            KHelper.showCustomBottomSheetWTIntrinsic(
                              Padding(
                                padding: const EdgeInsets.all(8.0),
                                child: SearchableView<FamousEmployee>(
                                  initialList: famousData,
                                  where: (item) => item.email,
                                  whereList: (item) => [],
                                  builder: (employees, isSearching) => ListView.builder(
                                    itemCount: employees.length,
                                    shrinkWrap: true,
                                    itemBuilder: (context, i) {
                                      return FamousTile(data: employees[i]);
                                    },
                                  ),
                                ),
                              ),
                            );
                          },
                        ),
                      );
                    } else {
                      return FamousTile(data: filteredList.elementAt(index));
                    }
                  },
                ),
        )
      ],
    );
  }
}
