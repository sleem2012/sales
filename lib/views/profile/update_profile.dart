import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../di.dart';
import '../../logic/auth/update_user/update_user_bloc.dart';
import '../../logic/auth/update_user/update_user_state.dart';
import '../../logic/auth/user_info/user_info_bloc.dart';
import '../../logic/theme/theme_cubit.dart';
import '../../packages/cache/locale_storage.dart';
import '../../packages/shared/localization/trans.dart';
import '../../packages/shared/theme/helper.dart';
import '../widgets/appbar.dart';
import '../../packages/widgets/custom_button.dart';
import '../widgets/loading/loading_overlay.dart';
import '../widgets/new_bg_img.dart';
import '../../packages/widgets/pick_image_widget.dart';
import '../../packages/widgets/text_field.dart';
import 'package:get/get.dart';
import '../../../../packages/shared/error/failures.dart';
import '../../packages/modules/logic/currencies/currencies_bloc.dart';
import '../../packages/modules/view/currencies/currency_drop.dart';
import '../../packages/modules/view/language/lang_dropdown.dart';

class UpdateProfile extends StatelessWidget {
  const UpdateProfile({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: KAppBar(title: Tr.get.update_profile),
      body: BgImg(
        child: Center(
          child: SingleChildScrollView(
            child: BlocProvider(
              create: (context) => Di.updateUserBloc,
              child: BlocConsumer<UpdateUserBloc, UpdateUserState>(
                listener: (context, state) {
                  state.whenOrNull(
                    error: (value) => KHelper.showSnackBar(KFailure.toError(value)),
                    success: () {
                      UserInfoBloc.of(context).getUserInfo();
                    },
                  );
                },
                builder: (context, state) {
                  return KLoadingOverlay(
                    isLoading: state.maybeWhen(orElse: () => false, loading: () => true),
                    child: Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 25).copyWith(top: 50, bottom: 20),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Center(
                            child: FittedBox(
                              child: PickProImageWidget(
                                hint: Tr.get.personal_photo,
                                radius: 100,
                                onSelect: UpdateUserBloc.of(context).selectImage,
                                initialImg: KStorage.i.getUserInfo?.data?.image?.s128px,
                              ),
                            ),
                          ),
                          const SizedBox(height: 20),
                          KTextFormField(
                            enabled: false,
                            hintText: Tr.get.name,
                            controller: UpdateUserBloc.of(context).nameCtrl,
                          ),
                          const SizedBox(height: 10),
                          KTextFormField(
                            controller: UpdateUserBloc.of(context).phoneCtrl,
                            hintText: Tr.get.phone_number,
                            enabled: false,
                            keyboardType: TextInputType.phone,
                            validator: (value) {
                              if (value!.isEmpty) {
                                return Tr.get.phone_number_validation;
                              }
                              return null;
                            },
                          ),
                          const SizedBox(height: 10),
                          KTextFormField(
                            enabled: false,
                            hintText: Tr.get.email,
                            controller: UpdateUserBloc.of(context).emailCtrl,
                            keyboardType: TextInputType.emailAddress,
                          ),
                          // KSlugDropdown(
                          //   items: KSlugModel.genders,
                          //   onChanged: UpdateUserBloc.of(context).selectGender,
                          //   value: UpdateUserBloc.of(context).selectedGender?.slug,
                          // ),
                          const SizedBox(height: 10),
                          InkWell(
                            child: KTextFormField(
                              controller: UpdateUserBloc.of(context).birthdateController,
                              hintText: Tr.get.birthdate,
                              enabled: false,
                              autofocus: false,
                              keyboardType: TextInputType.text,
                            ),
                          ),
                          const SizedBox(height: 10),
                          LanguageDropdown(
                            onSelect: (val) {
                              ThemeBloc.of(context).updateLocale(val?.symbols);
                              CurrenciesBloc.of(context).getCurrencies();
                            },
                          ),
                          const SizedBox(height: 10),
                          CurrenciesDropdown(
                            onSelect: (val) {
                              CurrenciesBloc.of(context).selectCurrency(val!);
                            },
                          ),
                          const SizedBox(height: 30),
                          KButton(
                            title: Tr.get.update,
                            onPressed: UpdateUserBloc.of(context).update,
                            width: Get.width - 60,
                          ),
                        ],
                      ),
                    ),
                  );
                },
              ),
            ),
          ),
        ),
      ),
    );
  }
}
