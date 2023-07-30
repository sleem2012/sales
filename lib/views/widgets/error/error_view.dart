import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:linkwell/linkwell.dart';

import '../../../packages/shared/localization/trans.dart';
import '../../../packages/shared/theme/text_theme.dart';
import '../../../packages/widgets/custom_button.dart';
import '../new_bg_img.dart';

class KErrorView extends StatelessWidget {
  final void Function()? onTryAgain;
  final String? error;

  const KErrorView({Key? key, this.onTryAgain, this.error}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: BgImg(
        child: Center(
          child: SingleChildScrollView(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                SvgPicture.asset('assets/images/Logo Only.svg'),
                const SizedBox(
                  height: 5,
                ),
                Text(
                  Tr.get.sorry,
                  style: KTextStyle.of(context).names,
                ),
                const SizedBox(
                  height: 30,
                ),
                SvgPicture.asset('assets/images/oops.svg'),
                const SizedBox(
                  height: 30,
                ),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Text(
                    error ?? Tr.get.try_later,
                    style: KTextStyle.of(context).title,
                    textAlign: TextAlign.center,
                  ),
                ),
                const SizedBox(height: 25),
                if (onTryAgain != null)
                  KButton(
                    title: Tr.get.try_again,
                    onPressed: onTryAgain!,
                    width: Get.width * .4,
                  ),
                const SizedBox(
                  height: 10,
                ),
                LinkWell(
                  "www.forallfa.com",
                  style: KTextStyle.of(context).body2,
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
