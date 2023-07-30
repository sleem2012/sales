import 'package:flutter/material.dart';
import '../../../packages/shared/theme/colors.dart';

class RoundedButton extends StatelessWidget {
  const RoundedButton({Key? key, required this.icon, this.onTap})
      : super(key: key);
  final IconData icon;
  final void Function()? onTap;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap ?? () {},
      child: Container(
        width: 30,
        height: 30,
        decoration: BoxDecoration(
            color: KColors.of(context).fillContainer.withOpacity(1),
            shape: BoxShape.circle,),
        child:
            // Icon(icon,color: KColors.of(context).accentColor),
            CircleAvatar(
          radius: 15,
          backgroundColor: KColors.accentColorL,
          child: Icon(icon, color: Colors.white, size: 20),
        ),
      ),
    );
  }
}
