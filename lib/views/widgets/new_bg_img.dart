import 'package:flutter/material.dart';
import '../../logic/theme/theme_cubit.dart';

class BgImg extends StatelessWidget {
  const BgImg({Key? key, this.child, this.isInputs}) : super(key: key);
  final Widget? child;
  final bool? isInputs;

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Container(
          width: double.infinity,
          height: double.infinity,
          decoration: BoxDecoration(
            image: DecorationImage(
              image: AssetImage(
                'assets/images/splash_${ThemeBloc.of(context).strTheme}.png',
              ),
              fit: BoxFit.cover,
            ),
          ),
        ),
        // Container(
        //   width: double.infinity,
        //   height: height,
        //   decoration: BoxDecoration(
        //     gradient: LinearGradient(
        //       colors: [
        //         KColors.of(context).statusBar,
        //         KColors.of(context).statusBar,
        //         Colors.transparent,
        //       ],
        //       stops: const [0.0, .0001, 1],
        //       begin: Alignment.topCenter,
        //       end: Alignment.bottomCenter,
        //     ),
        //   ),
        // ),
        SizedBox(
          width: double.infinity,
          height: double.infinity,
          child: child,
        ),
      ],
    );
  }
}
