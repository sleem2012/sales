// ignore_for_file: deprecated_member_use

import 'package:cached_network_svg_image/cached_network_svg_image.dart';
import 'package:flutter/material.dart';

import '../../di.dart';
import '../shared/theme/colors.dart';

class CachedSvgImage extends StatefulWidget {
  final String url;
  final double? width;
  final double? height;
  final Color? color;
  final BoxFit? fit;
  final Widget? placeHolder;
  final Widget? errorBuilder;
  final bool overrideColor;

  const CachedSvgImage({Key? key, required this.url, this.width, this.height, this.placeHolder, this.color, this.fit, this.errorBuilder, this.overrideColor = true})
      : super(key: key);

  @override
  State<CachedSvgImage> createState() => _CachedSvgImageState();
}

class _CachedSvgImageState extends State<CachedSvgImage> {
  bool isValid = true;
  checkImg() async {
    try {
      final value = await Di.dioClient.statusCodeCheck(widget.url);
      if (value.statusCode == 200) {
        if (mounted) setState(() => isValid = true);
      } else {
        if (mounted) setState(() => isValid = false);
      }
    } catch (e) {
      if (mounted) setState(() => isValid = false);
    }
  }

  @override
  void initState() {
    checkImg();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    if (isValid) {
      return CachedNetworkSVGImage(
        widget.url,
        color: widget.overrideColor ? (widget.color ?? KColors.textL) : null,
        placeholder: widget.placeHolder,
        errorWidget: Icon(Icons.error, color: KColors.of(context).accentColor),
        width: widget.width,
        height: widget.height,
        fadeDuration: const Duration(milliseconds: 500),
      );
    } else {
      return widget.errorBuilder ?? const SizedBox.shrink();
    }
  }
}
