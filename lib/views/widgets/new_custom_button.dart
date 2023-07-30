import 'package:flutter/material.dart';
import '../../packages/shared/theme/colors.dart';
import 'package:get/get.dart';

class NewCustomButton extends StatelessWidget {
  const NewCustomButton({Key? key, required this.onPressed, required this.label}) : super(key: key);
  final void Function() onPressed;
  final String label;
  @override
  Widget build(BuildContext context) {
    return   ElevatedButton(
      onPressed: onPressed,
      style: ElevatedButton.styleFrom(
        padding: const EdgeInsets.all(0.0), backgroundColor: Colors.transparent,
        shape: const RoundedRectangleBorder(borderRadius: BorderRadius.only(topRight:  Radius.circular(15),topLeft: Radius.circular(15))),
      ),
      child: Ink(
        decoration:  const BoxDecoration(
            gradient: LinearGradient(colors: [KColors.linearTwo, KColors.linearOne],
              begin: Alignment.centerLeft,
              end: Alignment.centerRight,
            ),
            borderRadius: BorderRadius.only(bottomRight: Radius.circular(15),topLeft: Radius.circular(15)),
        ),
        child: Container(
          width: Get.width/1.1,
          height: 50,
          alignment: Alignment.center,
          child:  Text(label, style: const TextStyle(color: Colors.white,fontSize: 18),),
        ),
      ),


    );
  }
}
