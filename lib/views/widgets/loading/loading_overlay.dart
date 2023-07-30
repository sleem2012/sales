import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

import '../../../packages/shared/theme/colors.dart';
import '../../../packages/shared/theme/helper.dart';
import '../error/error_view.dart';

class KLoadingOverlay extends StatelessWidget {
  final Widget? child;
  final bool isLoading, reverseTheme;
  const KLoadingOverlay({Key? key, this.child, this.isLoading = false, this.reverseTheme = false}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Stack(
        alignment: Alignment.center,
        children: [
          if (isLoading)
            Positioned(
              top: 0,
              width: KHelper.width,
              height: KHelper.height,
              child: BackdropFilter(
                filter: ImageFilter.blur(sigmaX: 16.0, sigmaY: 16.0),
                child: Container(
                  decoration: BoxDecoration(
                    color: Colors.transparent,
                    borderRadius: BorderRadius.circular(KHelper.cornerRadius),
                  ),
                ),
              ),
            )
          else
            child ?? SizedBox(width: KHelper.width, height: KHelper.height),
          if (isLoading)
            Center(
              child: Stack(
                alignment: Alignment.center,
                children: <Widget>[
                  SizedBox(
                    width: 120,
                    height: 120,
                    child: CircularProgressIndicator(
                      strokeWidth: 2,
                      backgroundColor: KColors.of(context).accentColor,
                      // valueColor: An,
                    ),
                  ),
                  SvgPicture.asset(
                    'assets/images/Logo Only.svg',
                    height: 60,
                    width: 60,
                  )
                ],
              ),
            ),
        ],
      ),
    );
  }
}

class KRequestOverlay extends StatelessWidget {
  final Widget? child;
  final Widget? loader;
  final bool isLoading;
  final String? error;
  final void Function()? onTryAgain;
  const KRequestOverlay({Key? key, this.child, required this.isLoading, this.error, this.onTryAgain, this.loader}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Stack(
        alignment: Alignment.center,
        children: [
          if (!isLoading)
            child ?? SizedBox(width: KHelper.width, height: KHelper.height)
          else if (isLoading)
            BackdropFilter(
              filter: ImageFilter.blur(sigmaX: 16.0, sigmaY: 16.0),
              child: Center(
                child: Container(
                  color: Colors.transparent,
                  child: Stack(
                    alignment: Alignment.center,
                    children: <Widget>[
                      if (loader != null)
                        loader!
                      else ...[
                        SizedBox(
                          width: 120,
                          height: 120,
                          child: CircularProgressIndicator(strokeWidth: 2, backgroundColor: KColors.of(context).accentColor),
                        ),
                        SvgPicture.asset('assets/images/Logo Only.svg', height: 60, width: 60),
                      ]
                    ],
                  ),
                ),
              ),
            ),
          if (error != null) KErrorView(error: error, onTryAgain: onTryAgain)
        ],
      ),
    );
  }
}
