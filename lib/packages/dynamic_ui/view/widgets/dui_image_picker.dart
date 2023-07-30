import 'dart:io';

import 'package:flutter/material.dart';
import 'package:get/get_utils/get_utils.dart';
import 'package:image_cropper/image_cropper.dart';

import '../../../shared/localization/trans.dart';
import '../../../shared/theme/text_theme.dart';
import '../../../widgets/pick_image_widget.dart';
import '../../model/dynamic_ui_model.dart';
import '../../model/keyboard_union/keyboard_union.dart';

class DynamicImagePicker extends StatelessWidget {
  const DynamicImagePicker({Key? key, required this.field, required this.onChanged}) : super(key: key);
  final DUIFieldModel field;
  final dynamic Function(File?, DUICollectionModel collection) onChanged;
  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      builder: (context, constrains) {
        final width = constrains.maxWidth + 10;
        const crossCount = 3;
        final imgW = (width - (10 * (crossCount - 1))) / crossCount;
        final isAvatar = field.keyboard is DynamicKeyboardUnionAvatar;

        return Column(
          crossAxisAlignment: isAvatar ? CrossAxisAlignment.center : CrossAxisAlignment.start,
          children: [
            const SizedBox(height: 5),
            if (!isAvatar) ...[
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 12),
                child: Text(field.placeholder.capitalize ?? "", style: KTextStyle.of(context).title2),
              ),
              const SizedBox(height: 5),
            ],
            SizedBox(
              width: width,
              child: Wrap(
                alignment: isAvatar ? WrapAlignment.center : WrapAlignment.start,
                spacing: 5,
                runSpacing: 5,
                children: [
                  ...field.collection.map(
                    (collection) {
                      return PickProImageWidget(
                        isAvatar: isAvatar,
                        radius: imgW,
                        aspRat: const [CropAspectRatioPreset.square],
                        hint: (collection.placeholder?.capitalize ?? 'Image'),
                        initialImg: collection.initial,
                        onSelect: (file) {
                          onChanged(file, collection);
                        },
                        validator: (p0) {
                          if (p0 == null && (field.isRequired || collection.isRequired)) {
                            return Tr.get.field_required;
                          }
                          return null;
                        },
                      );
                    },
                  ).toList()
                ],
              ),
            ),
            const SizedBox(height: 5),
          ],
        );
      },
    );
  }
}
