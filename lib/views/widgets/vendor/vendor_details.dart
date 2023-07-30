import 'package:flutter/material.dart';
import '../../../data/models/branch_staff/vendors_model.dart';
import '../../../logic/nav_enforcer/nav_enforcer_bloc.dart';
import '../../../packages/shared/localization/trans.dart';
import '../../../packages/shared/theme/colors.dart';
import '../../../packages/shared/theme/helper.dart';
import '../../../packages/shared/theme/text_theme.dart';
import '../appbar.dart';
import '../../../packages/widgets/image_widget.dart';
import '../new_bg_img.dart';
import '../photo_viewer.dart';
import 'widgets/profile_widget.dart';

class VendorDetails extends StatelessWidget {
  const VendorDetails({Key? key, required this.vendor}) : super(key: key);
  final VendorsModel vendor;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: KAppBar(title: Tr.get.vendors),
      body: BgImg(
        child: SingleChildScrollView(
          child: Column(
            children: [
              ProfileWidget(vendor: vendor),
              const Divider(),
              const SizedBox(height: 22),
              Container(
                width: double.infinity,
                decoration: KHelper.of(context).elevatedBox,
                padding: const EdgeInsets.all(8),
                child: Wrap(
                  runSpacing: 10,
                  spacing: 10,
                  children: [
                    if (vendor.company?.commercials?.commercial?.file?.s128px != null)
                      InkWell(
                        onTap: () {
                          Nav.to(KPhotoView(image: vendor.company?.commercials?.commercial?.file?.s512px ?? ''));
                        },
                        child: KImageWidget(
                          imageUrl: vendor.company?.commercials?.commercial?.file?.s128px ?? '',
                        ),
                      ),
                  ],
                ),
              ),
              const SizedBox(
                height: 10,
              ),
              Container(
                width: double.infinity,
                decoration: KHelper.of(context).elevatedBox,
                padding: const EdgeInsets.all(8),
                child: Wrap(
                  runSpacing: 10,
                  spacing: 10,
                  children: [
                    if (vendor.company?.commercials?.tax?.file?.s128px != null)
                      InkWell(
                        onTap: () {
                          Nav.to(KPhotoView(image: vendor.company?.commercials?.tax?.file?.s512px ?? ''));
                        },
                        child: KImageWidget(
                          imageUrl: vendor.company?.commercials?.tax?.file?.s128px ?? '',
                        ),
                      ),
                  ],
                ),
              )
            ],
          ),
        ),
      ),
    );
  }

  buildVendorInfo(context, String? text, String info) {
    return Padding(
      padding: const EdgeInsets.all(20.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          Expanded(child: Text(text ?? '', style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 16))),
          const Spacer(),
          Expanded(
            child: Text(
              info,
              style: KTextStyle.of(context).names.copyWith(color: KColors.of(context).accentColor),
              textAlign: TextAlign.start,
            ),
          ),
        ],
      ),
    );
  }
}
