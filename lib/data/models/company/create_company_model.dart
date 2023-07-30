import 'dart:io';

import 'package:dio/dio.dart';
import 'package:file_picker/file_picker.dart';
import 'package:flutter/foundation.dart';
import 'package:image_picker/image_picker.dart';

class CreateCompanyModel {
  String? nameValue;
  String? descriptionValue;
  List<String>? socialNames;
  List<String>? socialNamesLinks;
  List<String>? emailKeys;
  List<String>? emailValues;
  List<String>? hotlineValues;
  List<String>? commercialKeys;
  List<String>? commercialValues;
  String? packagesId;
  String? adminId;
  File? logo;
  List<XFile>? coverPhotosValues;
  List<PlatformFile>? commercialFiles;

  CreateCompanyModel({
    this.nameValue,
    this.descriptionValue,
    this.socialNames,
    this.socialNamesLinks,
    this.emailKeys,
    this.emailValues,
    this.hotlineValues,
    this.commercialKeys,
    this.commercialValues,
    this.packagesId,
    this.adminId,
    this.logo,
    this.coverPhotosValues,
    this.commercialFiles,
  });

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['name_value'] = nameValue;
    data['description_value'] = descriptionValue;
    data['social_names[]'] = socialNames;
    data['social_names_links[]'] = socialNamesLinks;
    data['email_keys[]'] = emailKeys;
    data['email_values[]'] = emailValues;
    data['hotline_values[]'] = hotlineValues;
    data['packages_id'] = packagesId;
    // data['logo'] = MultipartFile.fromFileSync(logo?.path ??'' , filename: logo?.path.split('/').last);
    if(logo != null  )data['logo']= MultipartFile.fromFileSync(logo?.path ??'' , filename: logo?.path.split('/').last);
    data['cover_photos_values[]'] = coverPhotosValues?.map((item) => MultipartFile.fromFileSync(item.path , filename: item.path.split('/').last)).toList();
    data['commercial_keys[]'] = commercialKeys;
    data['commercial_values[]'] = commercialValues;
    data['commercial_files[]'] = commercialFiles?.map((item) => MultipartFile.fromFileSync(item.path ?? '', filename: item.path?.split('/').last)).toList();
    return data;
  }
  Map<String, dynamic> toLog() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['name_value'] = nameValue;
    data['description_value'] = descriptionValue;
    data['social_names[]'] = socialNames;
    data['social_names_links[]'] = socialNamesLinks;
    data['email_keys[]'] = emailKeys;
    data['email_values[]'] = emailValues;
    data['hotline_values[]'] = hotlineValues;
    data['packages_id'] = packagesId;
    data['logo'] = logo?.length;
    data['cover_photos_values[]'] = coverPhotosValues?.length;
    data['commercial_keys[]'] = commercialKeys;
    data['commercial_values[]'] = commercialValues;
    data['commercial_files[]'] = commercialFiles;
    return data;
  }

  @override
  bool operator ==(covariant CreateCompanyModel other) {
    if (identical(this, other)) return true;

    return other.nameValue == nameValue &&
        other.descriptionValue == descriptionValue &&
        listEquals(other.socialNames, socialNames) &&
        listEquals(other.socialNamesLinks, socialNamesLinks) &&
        listEquals(other.emailKeys, emailKeys) &&
        listEquals(other.emailValues, emailValues) &&
        listEquals(other.hotlineValues, hotlineValues) &&
        listEquals(other.commercialKeys, commercialKeys) &&
        listEquals(other.commercialValues, commercialValues) &&
        other.packagesId == packagesId &&
        other.adminId == adminId &&
        other.logo == logo &&
        listEquals(other.coverPhotosValues, coverPhotosValues) &&
        listEquals(other.commercialFiles, commercialFiles);
  }

  @override
  int get hashCode {
    return nameValue.hashCode ^
        descriptionValue.hashCode ^
        socialNames.hashCode ^
        socialNamesLinks.hashCode ^
        emailKeys.hashCode ^
        emailValues.hashCode ^
        hotlineValues.hashCode ^
        commercialKeys.hashCode ^
        commercialValues.hashCode ^
        packagesId.hashCode ^
        adminId.hashCode ^
        logo.hashCode ^
        coverPhotosValues.hashCode ^
        commercialFiles.hashCode;
  }

  CreateCompanyModel copyWith({
    String? nameValue,
    String? descriptionValue,
    List<String>? socialNames,
    List<String>? socialNamesLinks,
    List<String>? emailKeys,
    List<String>? emailValues,
    List<String>? hotlineValues,
    List<String>? commercialKeys,
    List<String>? commercialValues,
    String? packagesId,
    String? adminId,
    File? logo,
    List<XFile>? coverPhotosValues,
    List<PlatformFile>? commercialFiles,
  }) {
    return CreateCompanyModel(
      nameValue: nameValue ?? this.nameValue,
      descriptionValue: descriptionValue ?? this.descriptionValue,
      socialNames: socialNames ?? this.socialNames,
      socialNamesLinks: socialNamesLinks ?? this.socialNamesLinks,
      emailKeys: emailKeys ?? this.emailKeys,
      emailValues: emailValues ?? this.emailValues,
      hotlineValues: hotlineValues ?? this.hotlineValues,
      commercialKeys: commercialKeys ?? this.commercialKeys,
      commercialValues: commercialValues ?? this.commercialValues,
      packagesId: packagesId ?? this.packagesId,
      adminId: adminId ?? this.adminId,
      logo: logo ?? this.logo,
      coverPhotosValues: coverPhotosValues ?? this.coverPhotosValues,
      commercialFiles: commercialFiles ?? this.commercialFiles,
    );
  }
}
