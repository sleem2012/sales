import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:url_launcher/url_launcher_string.dart';

import '../../../widgets/image_widget.dart';
import '../../theme/helper.dart';

const apiKey = "AIzaSyA4PY3RYKRShU07E-8rxSKnBMHY5UNUDjY";

class MapStaticView extends StatelessWidget {
  final LatLng? latLng;
  final String? zoom, width, height;
  const MapStaticView({super.key, this.latLng, this.zoom, this.width, this.height});
  String get imgUrl {
    return 'https://maps.googleapis.com/maps/api/staticmap?center=&${latLng?.latitude ?? -3.1178833},${latLng?.longitude ?? -60.0029284}&zoom=${zoom ?? 16}&size=${width ?? 400}x${height ?? 200}&maptype=roadmap&markers=color:red%7Clabel:C%7C${latLng?.latitude ?? -3.1178833},${latLng?.longitude ?? -60.0029284}&key=$apiKey';
  }

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        final url = "http://maps.google.com/maps?z=12&t=m&q=loc:${latLng?.latitude}+${latLng?.longitude}";
        launchUrlString(url, mode: LaunchMode.externalNonBrowserApplication);
      },
      child: ClipRRect(
        borderRadius: BorderRadius.circular(KHelper.cornerRadius),
        child: KImageWidget(
          imageUrl: imgUrl,
          width: double.infinity,
        ),
      ),
    );
  }
}
