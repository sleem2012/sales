import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';

import '../../logic/search_company/search_company_bloc.dart';
import '../../logic/search_company/search_company_event.dart';
import '../../packages/extensions.dart';
import '../../packages/shared/localization/trans.dart';
import '../../packages/shared/theme/colors.dart';
import '../../packages/shared/theme/helper.dart';
import '../../packages/widgets/icon_button.dart';
import '../../packages/widgets/text_field.dart';
import '../home_screen/managers_list_tile.dart';
import '../sales_delegate/vendor_state/vendor_tile.dart';
import '../widgets/error/error_widget.dart';
import '../widgets/new_bg_img.dart';
import '../widgets/slug_drop_down.dart';

class GeneralSearchScreen extends StatefulWidget {
  const GeneralSearchScreen({Key? key, required this.type}) : super(key: key);
  final KSlugModel type;

  @override
  State<GeneralSearchScreen> createState() => _GeneralSearchScreenState();
}

class _GeneralSearchScreenState extends State<GeneralSearchScreen> {
  @override
  Widget build(BuildContext context) {
    return BlocBuilder<SearchCompanyBloc, SearchState>(
      builder: (context, state) {
        final search = SearchCompanyBloc.of(context);
        final GlobalKey<FormState> formKey = GlobalKey<FormState>();
        int length = widget.type.slug == KSlugModel.user ? search.userData.length : search.company.length;

        return BgImg(
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: KHelper.hPadding),
            child: Form(
              key: formKey,
              child: Column(
                children: [
                  Row(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Expanded(
                        flex: 6,
                        child: KTextFormField(
                          hintText: widget.type.translated,
                          controller: search.searchController,
                          validator: (p0) {
                            if (p0!.isEmpty) {
                              return Tr.get.field_required;
                            }
                            return null;
                          },
                        ),
                      ),
                      10.w,
                      Padding(
                        padding: const EdgeInsets.only(top: 10),
                        child: KIconButton(
                          radius: 45,
                          backgroundColor: KColors.of(context).background,
                          onPressed: () {
                            if (formKey.currentState!.validate()) search.search(search.searchController.text, widget.type.slug);
                          },
                          child: Icon(
                            Icons.person_search_outlined,
                            color: KColors.of(context).accentColor,
                          ),
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  state.when(
                    initial: () => const SizedBox(),
                    loading: () => const CircularProgressIndicator(),
                    success: () {
                      // final search = SearchCompanyBloc.of(context);
                      // debugPrint("search ${search.userData.length}");
                      return length < 1
                          ? Padding(
                              padding: EdgeInsets.only(top: Get.height * .25),
                              child: SvgPicture.asset("assets/images/No Requests.svg"),
                            )
                          : SizedBox(
                              height: Get.height * .7,
                              child: ListView.separated(
                                padding: const EdgeInsets.all(0).copyWith(bottom: 40),
                                itemBuilder: (context, index) {
                                  return widget.type.slug == KSlugModel.user
                                      ? ManagersListTile(
                                          data: search.userData[index],
                                        )
                                      : VendorsTile(
                                          data: search.company[index],
                                          canUpdate: true,
                                        );
                                },
                                itemCount: length,
                                separatorBuilder: (BuildContext context, int index) {
                                  return const SizedBox(
                                    height: 8,
                                  );
                                },
                              ),
                            );
                    },
                    error: (error) => KErrorWidget(
                      error: error,
                    ),
                  )
                ],
              ),
            ),
          ),
        );
      },
    );
  }
}
