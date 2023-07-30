import 'dart:io';
import 'package:flutter/material.dart';
import 'package:image_cropper/image_cropper.dart';
import 'package:image_picker/image_picker.dart';
import '../extensions.dart';
import '../shared/enums.dart';
import '../shared/theme/helper.dart';
import '../shared/theme/text_theme.dart';
import 'image_widget.dart';

class PickProImageWidget extends StatefulWidget {
  const PickProImageWidget({
    Key? key,
    required this.onSelect,
    this.initialImg,
    this.maxWidth,
    this.maxHeight,
    this.radius,
    this.isAvatar = false,
    this.validator,
    this.aspRat = const [
      CropAspectRatioPreset.original,
      CropAspectRatioPreset.square,
      CropAspectRatioPreset.ratio3x2,
      CropAspectRatioPreset.ratio4x3,
      CropAspectRatioPreset.ratio16x9,
    ],
    this.hint,
    this.decoration,
  }) : super(key: key);

  final String? initialImg;
  final Function(File? file) onSelect;
  final double? maxWidth;
  final double? maxHeight;
  final double? radius;
  final bool isAvatar;
  final String? hint;
  final BoxDecoration? decoration;
  final List<CropAspectRatioPreset> aspRat;

  final String? Function(File?)? validator;

  @override
  State<PickProImageWidget> createState() => _PickProImageWidgetState();
}

class _PickProImageWidgetState extends State<PickProImageWidget> {
  File? file;

  GeneralState state = GeneralState.initial;
  @override
  Widget build(BuildContext context) {
    BorderRadiusGeometry borderRadius = BorderRadius.circular(20);
    return FormField<File?>(
      validator: widget.validator,
      builder: (formState) {
        return Container(
          height: widget.radius ?? 70,
          width: widget.radius ?? 70,
          decoration: (widget.decoration ?? KHelper.of(context).roundedFields).copyWith(
            borderRadius: borderRadius,
            border: formState.hasError ? KHelper.of(context).eBorder : null,
          ),
          child: RawMaterialButton(
            shape: RoundedRectangleBorder(borderRadius: borderRadius),
            elevation: 0,
            onPressed: () => pick(formState, widget.aspRat),
            child: SizedBox(
              height: widget.radius ?? 70,
              width: widget.radius ?? 70,
              child: ClipRRect(
                borderRadius: borderRadius,
                child: (state == GeneralState.initial && widget.initialImg != null)
                    ? KImageWidget(imageUrl: widget.initialImg!, fit: BoxFit.cover)
                    : (state == GeneralState.success && file != null)
                        ? Image.file(file!, fit: BoxFit.cover)
                        : Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Icon(Icons.camera, size: (widget.radius ?? 70) * .25),
                              8.h,
                              if (widget.hint != null)
                                Padding(
                                  padding: const EdgeInsets.symmetric(horizontal: 5),
                                  child: Text(
                                    widget.hint!,
                                    style: KTextStyle.of(context).hint,
                                    maxLines: 2,
                                    overflow: TextOverflow.ellipsis,
                                  ),
                                )
                            ],
                          ),
              ),
            ),
          ),
        );
      },
    );
  }

  void pick(FormFieldState<File?> formState, List<CropAspectRatioPreset> aspRat) async {
    setState(() => state = GeneralState.loading);
    try {
      file = await ImageHelper.i.pickImage();
      if (file != null) {
        final cropped = await ImageHelper.i.cropImage(image: file, aspRat: aspRat);
        file = cropped;
        widget.onSelect(cropped);
        formState
          ..didChange(cropped)
          ..validate();
      }
      setState(() => state = GeneralState.success);
    } catch (e) {
      setState(() => state = GeneralState.error);
    }
  }
}

class ImageHelper {
  final ImagePicker imagePicker = ImagePicker();
  final ImageCropper imageCropper = ImageCropper();

  static ImageHelper? _instance;
  ImageHelper._internal() {
    _instance = this;
  }
  static ImageHelper get i {
    return _instance ?? ImageHelper._internal();
  }

  Future<File?> pickImage({double? maxHeight, double? maxWidth}) async {
    File? image;
    try {
      final pickedFile = await imagePicker.pickImage(
        source: ImageSource.gallery,
        maxHeight: maxHeight,
        maxWidth: maxWidth,
      );
      if (pickedFile != null) {
        image = File(pickedFile.path);
      }
    } catch (e) {
      return null;
    }
    return image;
  }

  Future<List<File>> pickMultiImage({double? maxHeight, double? maxWidth}) async {
    List<File> images = [];

    try {
      final pickedFile = await imagePicker.pickMultiImage(maxHeight: maxHeight, maxWidth: maxWidth);
      for (var img in pickedFile) {
        images.add(File(img.path));
      }
    } catch (e) {
      return images;
    }
    return images;
  }

  Future<File?> cropImage({required File? image, bool isAvatar = false, required List<CropAspectRatioPreset> aspRat}) async {
    if (image != null) {
      final img = await imageCropper.cropImage(
        sourcePath: image.path,
        cropStyle: isAvatar ? CropStyle.circle : CropStyle.rectangle,
        aspectRatioPresets: aspRat,
        compressQuality: 100,
      );
      image = File(img!.path);
    }
    return image;
  }
}
