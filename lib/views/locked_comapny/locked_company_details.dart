import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import '../../packages/modules/models/company/company_model.dart';
import '../../logic/nav_enforcer/nav_enforcer_bloc.dart';
import '../../packages/shared/theme/helper.dart';
import '../../packages/shared/theme/text_theme.dart';
import '../widgets/appbar.dart';
import '../../packages/widgets/image_widget.dart';
import '../widgets/photo_viewer.dart';

class CompanyDetails extends StatelessWidget {
  const CompanyDetails({Key? key, required this.data}) : super(key: key);
  final CompanyModel data;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const KAppBar(),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16),
        child: Column(
          children: [
            Container(
              decoration: KHelper.of(context).elevatedBox,
              padding: const EdgeInsets.all(8),
              child: ListTile(
                leading: CircleAvatar(
                  radius: 24,
                  backgroundColor: Colors.white,
                  backgroundImage: CachedNetworkImageProvider(data.logo?.s128px ?? ''),
                ),
                title: Text(
                  data.owner?.name ?? '',
                  style: KTextStyle.of(context).title,
                ),
                subtitle: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      data.owner?.email ?? '',
                    ),
                    const SizedBox(
                      height: 5,
                    ),
                    Text(
                      data.owner?.mobile ?? '',
                      style: KTextStyle.of(context).hint,
                    ),
                    const SizedBox(
                      height: 5,
                    ),
                    Text(
                      data.owner?.detailedAddress ?? '',
                      style: KTextStyle.of(context).hint,
                    ),
                  ],
                ),
              ),
            ),
            const SizedBox(
              height: 10,
            ),
            // Container(
            //   width: double.infinity,
            //   decoration: KHelper
            //       .of(context)
            //       .elevatedBox,
            //   padding: const EdgeInsets.all(8),
            //   child: Column(
            //       crossAxisAlignment: CrossAxisAlignment.start,
            //       children: [
            //
            //         Wrap(
            //             runSpacing: 10,
            //             spacing: 10,
            //             children: [
            //               if (data.commercial. != null)
            //                 InkWell(
            //                   onTap: () {
            //                     Nav.to(KPhotoView(
            //                         image: data.commercial?.identity?.file
            //                             ?.s512px ?? ''));
            //                   },
            //                   child: KImageWidget(
            //                     imageUrl: data.commercial?.identity?.file
            //                         ?.s128px ?? '',
            //                   ),
            //                 ),
            //
            //               if(data.commercial?.identity?.fileBack?.s128px !=
            //                   null)
            //                 InkWell(
            //                   onTap: () {
            //                     Nav.to(KPhotoView(
            //                         image: data.commercial?.identity?.fileBack
            //                             ?.s512px ?? ''));
            //                   },
            //                   child: KImageWidget(
            //                     imageUrl: data.commercial?.?.fileBack
            //                         ?.s128px ?? '',
            //                   ),
            //                 ),
            //             ]
            //         ),
            //       ]),
            // ),
            // const SizedBox(
            //   height: 10,
            // ),
            Container(
              width: double.infinity,
              decoration: KHelper.of(context).elevatedBox,
              padding: const EdgeInsets.all(8),
              child: Wrap(
                runSpacing: 10,
                spacing: 10,
                children: [
                  if (data.commercials?.commercial?.file?.s128px != null)
                    InkWell(
                      onTap: () {
                        Nav.to(KPhotoView(image: data.commercials?.commercial?.file?.s512px ?? ''));
                      },
                      child: KImageWidget(
                        imageUrl: data.commercials?.commercial?.file?.s128px ?? '',
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
                  if (data.commercials?.tax?.file?.s128px != null)
                    InkWell(
                      onTap: () {
                        Nav.to(KPhotoView(image: data.commercials?.tax?.file?.s512px ?? ''));
                      },
                      child: KImageWidget(
                        imageUrl: data.commercials?.tax?.file?.s128px ?? '',
                      ),
                    ),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
