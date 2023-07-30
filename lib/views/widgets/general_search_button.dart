import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../logic/main_view/main_view_bloc.dart';
import '../../logic/nav_enforcer/nav_enforcer_bloc.dart';
import '../../logic/search_company/search_company_bloc.dart';
import '../../packages/shared/theme/helper.dart';
import 'slug_drop_down.dart';

class GeneralSearchButton extends StatelessWidget {
  const GeneralSearchButton({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return IconButton(
      onPressed: () {
        debugPrint('General Search' "$searchLength");
        if (searchLength > 0) {
          KHelper.showCustomBottomSheet(
            SizedBox(
              height: Get.height * .25,
              child: ListView.builder(
                padding: EdgeInsets.zero,
                itemBuilder: (context, index) {
                  // final e = searchTypes.map((e) => e[index]).toList();
                  return ListTile(
                    title: Text(KSlugModel.searchTypes[index].translated),
                    trailing: const Icon(Icons.arrow_right_alt),
                    onTap: () {
                      Nav.back();
                      SearchCompanyBloc.of(context).setSearchType(type: KSlugModel.searchTypes[index]);
                      SearchCompanyBloc.of(context).searchController.text = '';
                      // SearchCompanyBloc.of(context).setFromSearch(true);
                      MainViewBloc.of(context).navTaped(5);
                    },
                  );
                },
                itemCount: KSlugModel.searchTypes.length,
              ),
            ),
          );
        }
      },
      icon: Icon(
        Icons.search,
        color: searchLength > 0 ? null : Colors.grey,
      ),
    );
  }
}
