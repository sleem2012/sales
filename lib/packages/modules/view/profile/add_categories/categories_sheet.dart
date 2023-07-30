import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../../di.dart';
import '../../../../../logic/auth/user_info/user_info_bloc.dart';
import '../../../../../logic/nav_enforcer/nav_enforcer_bloc.dart';
import '../../../../widgets/custom_button.dart';
import '../../../../widgets/drop_down.dart';
import '../../../../cache/locale_storage.dart';
import '../../../../shared/localization/trans.dart';
import '../../../../shared/theme/colors.dart';
import '../../../../shared/theme/helper.dart';
import '../../../../widgets/image_widget.dart';
import '../../../logic/category/add_category/add_category_cubit.dart';
import '../../../logic/category/add_category/add_category_state.dart';
import '../../../logic/category/category_bloc.dart';
import '../../../logic/category/category_state.dart';
import '../../../models/category/category_model.dart';

class CategoriesSheet extends StatelessWidget {
  const CategoriesSheet({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final userCategory = KStorage.i.getUserInfo?.data?.categories;
    final user = KStorage.i.getUserInfo;
    return BlocProvider(
      create: (context) => Di.addCategoryCubit,
      child: Padding(
        padding: const EdgeInsets.all(10),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Wrap(
              crossAxisAlignment: WrapCrossAlignment.start,
              spacing: 3,
              children: (userCategory ?? [])
                  .map(
                    (e) => Chip(
                      backgroundColor: KColors.of(context).background,
                      label: Text(e.name ?? ''),
                    ),
                  )
                  .toList(),
            ),
            const SizedBox(height: 20),
            BlocProvider(
              create: (context) => Di.categoryBloc..getCategories(packageId: user?.data?.userCompany?.packages?.id.toString()),
              child: BlocBuilder<CategoryBloc, CategoryState>(
                builder: (context, state) {
                  final cat = CategoryBloc.of(context);
                  if (cat.canAddFrom.isEmpty) return const SizedBox();

                  return Column(
                    children: [
                      KDropdownBtnMulti<CategoryData>(
                        hint: state.maybeWhen(orElse: () => Tr.get.select_category, loading: () => Tr.get.loading),
                        onChanged: (p0) {
                          AddCategoryCubit.of(context).catIds = p0;
                          debugPrint(AddCategoryCubit.of(context).catIds.length.toString());
                        },
                        items: cat.canAddFrom
                            .map(
                              (e) => KHelper.of(context).itemView<CategoryData>(
                                itemText: "${e.name?.value}",
                                value: e,
                                icon: KImageWidget(
                                  imageUrl: e.icons!.svg!,
                                  width: 30,
                                  height: 25,
                                  color: KColors.accentColorD,
                                ),
                              ),
                            )
                            .toList(),
                      ),
                      Padding(
                        padding: const EdgeInsets.symmetric(vertical: 15),
                        child: BlocConsumer<AddCategoryCubit, AddCategoryState>(
                          listener: (context, addState) {
                            addState.whenOrNull(success: (model) => UserInfoBloc.of(context).getUserInfo());
                          },
                          builder: (context, addState) {
                            return addState.maybeWhen(
                              orElse: () => KButton(
                                title: Tr.get.send,
                                onPressed: () async {
                                  await AddCategoryCubit.of(context).setIdsList();
                                  Nav.back();
                                },
                              ),
                              loading: () => const Center(child: CircularProgressIndicator()),
                            );
                          },
                        ),
                      ),
                    ],
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
