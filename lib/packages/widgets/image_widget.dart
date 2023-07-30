import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';

import '../../views/widgets/shimmer_box.dart';
import '../shared/theme/helper.dart';
import 'svg_caching.dart';

class KImageWidget extends StatelessWidget {
  const KImageWidget({
    Key? key,
    required this.imageUrl,
    this.width,
    this.height,
    this.color,
    this.placeHolder,
    this.errorBuilder,
    this.fit,
    this.overrideColor = false,
  }) : super(key: key);
  final String imageUrl;
  final double? width;
  final double? height;
  final Color? color;
  final BoxFit? fit;
  final Widget? placeHolder;
  final Widget? errorBuilder;
  final bool overrideColor;

  @override
  Widget build(BuildContext context) {
    return imageUrl.endsWith('.svg')
        ? CachedSvgImage(
            url: imageUrl,
            color: color,
            height: height,
            fit: fit,
            width: width,
            overrideColor: overrideColor,
            placeHolder: ShimmerBox(height: height, width: width),
            errorBuilder: KImageWidget(imageUrl: dummyNetLogo),
          )
        : CachedNetworkImage(
            imageUrl: imageUrl,
            height: height,
            color: color,
            fit: fit,
            placeholder: (context, url) {
              return ShimmerBox(height: height, width: width);
            },
            errorWidget: (context, url, error) {
              return KImageWidget(imageUrl: dummyNetLogo);
            },
            width: width,
          );
  }
}
