import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

import '../../logic/nav_enforcer/nav_enforcer_bloc.dart';
import '../../packages/shared/theme/text_theme.dart';
import 'new_bg_img.dart';

class OnSuccessView extends StatefulWidget {
  final String msg;
  final Widget? destination;
  final bool? doubleBack;

  const OnSuccessView({Key? key, required this.msg, this.destination, this.doubleBack = false}) : super(key: key);

  @override
  State<OnSuccessView> createState() => _OnSuccessViewState();
}

class _OnSuccessViewState extends State<OnSuccessView> {
  @override
  void initState() {
    timer();
    super.initState();
  }

  timer() async {
    Timer(
      const Duration(seconds: 3),
      () {
        if (widget.destination == null) {
          Nav.back();
          if (widget.doubleBack!) {
            Nav.back();
          }
        } else {
          Nav.offAll(widget.destination!);
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
              children: [
                SvgPicture.asset('assets/images/acc_added_success.svg'),
                Padding(
                  padding: const EdgeInsets.symmetric(vertical: 30),
                  child: Row(
                    children: [
                      Expanded(
                        child: Text(
                          widget.msg,
                          style: KTextStyle.of(context).body,
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
