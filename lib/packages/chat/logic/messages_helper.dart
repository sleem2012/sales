import 'dart:io';
import 'dart:ui' as ui;

import 'package:file_picker/file_picker.dart';
import 'package:flutter/material.dart';
import 'package:geolocator/geolocator.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

import '../../../di.dart';
import '../../shared/theme/helper.dart';
import '../data/models/send_msg_model.dart';

abstract class MsgHelper {
  static const String locationBase = "http://maps.google.com/maps?z=12&t=m&q=loc:";

  static bool isLocation(String? text) => (text ?? '').contains(locationBase);
  static LatLng? latLng(String? url) {
    List? l = url?.replaceAll(locationBase, '').split('+').toList();
    if (l != null && l.isNotEmpty) {
      return LatLng(double.parse(l.first), double.parse(l.last));
    }
    return null;
  }

  static share_location(BuildContext context, Function(String url) callback, {Position? initLocation}) async {
    try {
      final result = await KHelper.showMaps(context, initLocation: initLocation);
      if (result != null) {
        String url = "$locationBase${result.latLng.latitude}+${result.latLng.longitude}";
        callback.call(url);
      }
    } catch (e) {
      debugPrint('================= Location Pick>>> $e');
    }
  }

  static Future<ui.Image> getImageInfo(String path) async {
    File image = File(path);
    return await decodeImageFromList(image.readAsBytesSync());
  }

  static bool isAllEmoji(String text) {
    for (String s in Di.emojiParser.unemojify(text).split(" ")) {
      if (!s.startsWith(":") || !s.endsWith(":")) return false;
    }
    return true;
  }

  static Future<MsgContent> make_msg(MessageType msg_type, [String? voise_path, int? voise_duration, File? selectedImage, PlatformFile? selectedFile, String? text]) async {
    final str = Di.emojiParser.unemojify(text ?? '');
    switch (msg_type) {
      case MessageType.file:
        return MsgContent(media: selectedFile?.path, text: str, mediaName: selectedFile?.path?.split('/').last, imgH: 0, imgW: 0);
      case MessageType.image:
        ui.Image image = await MsgHelper.getImageInfo(selectedImage?.path ?? '');
        return MsgContent(media: selectedImage?.path, text: str, imgH: image.height.toDouble(), imgW: image.width.toDouble());
      case MessageType.voice:
        return MsgContent(media: voise_path, imgH: 0, imgW: 0, voice_duration: Duration(milliseconds: voise_duration ?? 0));
      default:
        return MsgContent(text: str, imgH: 0, imgW: 0);
    }
  }
}
