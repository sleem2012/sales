import 'package:flutter/material.dart';
import '../../packages/shared/localization/trans.dart';
import '../../packages/shared/theme/helper.dart';
import '../../packages/shared/theme/text_theme.dart';

class ProfileSectionTitle extends StatelessWidget {
  final String title;
  const ProfileSectionTitle({Key? key, required this.title}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Padding(
          padding: const EdgeInsets.all(KHelper.hPadding),
          child: Text(
            title,
            style: KTextStyle.of(context).title2,
          ),
        ),
      ],
    );
  }
}

class ProfileTile extends StatelessWidget {
  final Widget traling;
  final IconData leading;
  final String title;
  final Function()? onTap;
  const ProfileTile({Key? key, required this.leading, required this.traling, required this.title, this.onTap}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: KHelper.hPadding, vertical: 7),
        child: Row(
          children: [
            Icon(leading, size: KHelper.iconSize),
            const SizedBox(width: 10),
            Expanded(
              child: Text(title, style: KTextStyle.of(context).profileTiles, maxLines: 1),
            ),
            Expanded(
              child: Align(
                alignment: Tr.isAr ? Alignment.centerLeft : Alignment.centerRight,
                child: traling,
              ),
            )
          ],
        ),
      ),
    );
  }
}
