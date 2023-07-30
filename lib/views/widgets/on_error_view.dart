import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

import '../../logic/nav_enforcer/nav_enforcer_bloc.dart';
import '../../packages/shared/theme/text_theme.dart';
import 'new_bg_img.dart';

class OnErrorView extends StatefulWidget {
  final String msg;
  final Widget? destination;
  final bool? doubleBack;

  const OnErrorView({Key? key, required this.msg, this.destination, this.doubleBack = false}) : super(key: key);

  @override
  State<OnErrorView> createState() => _OnErrorViewState();
}

class _OnErrorViewState extends State<OnErrorView> {
  @override
  void initState() {
    timer();
    super.initState();
  }

  timer() async {
    Timer(
      const Duration(seconds: 4),
      () {
        if (widget.destination == null) {
          Nav.back();
          if (widget.doubleBack!) {
            Nav.back();
          }
        } else {
          Nav.replace(widget.destination!);
        }
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: BgImg(
        child: Center(
          child: SingleChildScrollView(
            padding: const EdgeInsets.symmetric(horizontal: 20),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                SvgPicture.asset('assets/images/Logo Only.svg'),
                const SizedBox(
                  height: 5,
                ),
                Text(
                  "Sorry",
                  style: KTextStyle.of(context).names,
                ),
                const SizedBox(
                  height: 30,
                ),
                SvgPicture.asset('assets/images/oops.svg'),
                Padding(
                  padding: const EdgeInsets.symmetric(vertical: 30),
                  child: Row(
                    children: [
                      Expanded(
                        child: Text(
                          widget.msg,
                          style: KTextStyle.of(context).names,
                          textAlign: TextAlign.center,
                        ),
                      ),
                    ],
                  ),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
