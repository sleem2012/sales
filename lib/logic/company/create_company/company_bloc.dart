import 'dart:developer';
import 'dart:io';

import 'package:file_picker/file_picker.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../../data/models/company/create_company_model.dart';
import '../../../data/repository/company/company_repo.dart';
import 'company_state.dart';
import '../../../packages/shared/localization/trans.dart';
import '../../../packages/shared/theme/helper.dart';
import 'package:image_picker/image_picker.dart';

import '../../../../packages/shared/error/failures.dart';

class CompanyBloc extends Cubit<CompanyState> {
  CompanyBloc({required this.companyRepoImpl}) : super(const CompanyState.initial());

  static CompanyBloc of(BuildContext context) {
    return BlocProvider.of<CompanyBloc>(context);
  }

  final CompanyRepoImpl companyRepoImpl;

  CreateCompanyModel? createCompanyModel = CreateCompanyModel(
    socialNamesLinks: [],
    commercialValues: [],
    commercialKeys: [],
    socialNames: [],
    hotlineValues: [],
    emailKeys: [],
    emailValues: [],
    descriptionValue: '',
    nameValue: '',
    adminId: '',
    coverPhotosValues: [],
    packagesId: '1',
  );

  TextEditingController companyNameController = TextEditingController();
  TextEditingController companyDesController = TextEditingController();
  TextEditingController emailController = TextEditingController();
  TextEditingController departmentController = TextEditingController();
  // TextEditingController hotlineController = TextEditingController();
  TextEditingController typeController = TextEditingController();
  TextEditingController commercialNumberController = TextEditingController();
  TextEditingController socialNameController = TextEditingController();
  TextEditingController socialLinkController = TextEditingController();

  List<XFile> coverPhotos = [];
  List<PlatformFile>? commercialFiles = [];
  bool? hasCommFile;

  createCom() async {
    try {
      createCompanyModel = createCompanyModel?.copyWith(
        nameValue: companyNameController.text,
        descriptionValue: companyDesController.text,
        commercialFiles: commercialFiles,
      );
      if ((createCompanyModel?.logo) == null) {
        KHelper.showSnackBar(Tr.get.select_logo);
        return;
      }
      // if ((createCompanyModel?.coverPhotosValues ?? []).isEmpty) {
      //   KHelper.showSnackBar(Tr.get.select_cover);
      //   return;
      // }
      addCommercialInfo();
      addNewEmail();
      addSocialInfo();
      log('================= ${createCompanyModel?.toLog()} :::: ');
      if ((createCompanyModel?.commercialFiles ?? []).isEmpty) {
        hasCommFile = false;
        _update;
        return;
      }
      emit(const CompanyState.loading());

      final result = await companyRepoImpl.create(createCompanyModel: createCompanyModel!);
      result.fold(
        (l) {
          emit(CompanyState.error(error: KFailure.toError(l)));
          KHelper.showSnackBar(KFailure.toError(l));
          debugPrint('================= Company Bloc : $l  ');
        },
        (r) => emit(const CompanyState.success()),
      );
    } catch (e) {
      debugPrint('================= Company Bloc Ex : $e : ');
      emit(CompanyState.error(error: Tr.get.something_went_wrong));
    }
  }

  addCommercialFiles(FilePickerResult? files) async {
    if (files != null) {
      commercialFiles?.addAll(files.files.map((e) => e));

      /// for (var f in files.files) {
      ///   var temp = MultipartFile.fromFileSync(f.path ?? '');
      ///   commercialFiles?.add(temp);
      /// }
      debugPrint('================= ${commercialFiles?.toSet()}');
      createCompanyModel = createCompanyModel?.copyWith(commercialFiles: commercialFiles);
      hasCommFile = true;
      _update;
    } else {
      KHelper.showSnackBar('Please select Commercial File');
    }
  }

  addNewEmail() {
    if (departmentController.text.isNotEmpty && emailController.text.isNotEmpty) {
      createCompanyModel = createCompanyModel?.copyWith(
        emailKeys: (createCompanyModel?.emailKeys ?? [])..add(departmentController.text),
        emailValues: (createCompanyModel?.emailValues ?? [])..add(emailController.text),
        // hotlineValues: (createCompanyModel?.hotlineValues ?? [])..add(hotlineController.text),
      );
      departmentController.clear();
      emailController.clear();
      // hotlineController.clear();
      _update;
    }
  }

  removeEmail(int i) {
    createCompanyModel!.emailValues!.removeAt(i);
    createCompanyModel!.emailKeys!.removeAt(i);
    createCompanyModel!.hotlineValues!.removeAt(i);
    _update;
  }

  removeSocial(int i) {
    createCompanyModel!.socialNames!.removeAt(i);
    createCompanyModel!.socialNamesLinks!.removeAt(i);
    _update;
  }

  removeCommerical(int i) {
    commercialFiles?.removeAt(i);

    /// createCompanyModel!.commercialKeys!.removeAt(i);
    /// createCompanyModel!.commercialValues!.removeAt(i);
    _update;
  }

  removeCover(int i) {
    debugPrint('=================  ${coverPhotos.length} ');

    //createCompanyModel!.coverPhotosValues!.removeAt(i);
    coverPhotos.removeAt(i);
    debugPrint('=================  ${coverPhotos.length} ');
    _update;
  }

  removeCFile(PlatformFile i) {
    createCompanyModel!.commercialFiles!.remove(i);
    _update;
  }

  addCommercialInfo() {
    if (typeController.text.isNotEmpty && commercialNumberController.text.isNotEmpty) {
      createCompanyModel = createCompanyModel?.copyWith(
        commercialKeys: (createCompanyModel?.commercialKeys ?? [])..add(typeController.text),
        commercialValues: (createCompanyModel?.commercialValues ?? [])..add(commercialNumberController.text),
      );
      typeController.clear();
      commercialNumberController.clear();
      _update;
    }
  }

  addSocialInfo() {
    if (socialNameController.text.isNotEmpty && socialLinkController.text.isNotEmpty) {
      createCompanyModel = createCompanyModel?.copyWith(
        socialNames: (createCompanyModel?.socialNames ?? [])..add(socialNameController.text),
        socialNamesLinks: (createCompanyModel?.socialNamesLinks ?? [])..add(socialLinkController.text),
      );
      socialNameController.clear();
      socialLinkController.clear();
      _update;
    }
  }

  addCoverPhotos(List<XFile>? images) async {
    if (images != null) {
      coverPhotos.addAll(images.map((e) => e));
      debugPrint('================= ${coverPhotos.toSet()}');
      createCompanyModel = createCompanyModel?.copyWith(coverPhotosValues: coverPhotos);
      _update;
    } else {
      KHelper.showSnackBar('Please select Cover');
    }
  }

  selectImage(File? image) async {
    if (image != null) {
      createCompanyModel = createCompanyModel?.copyWith(logo: image);
      _update;
    } else {
      KHelper.showSnackBar('Please select ');
    }
  }

  Future<void> selectPackage(int id) async {
    // selectedPackage = companyPackageModel;
    createCompanyModel = createCompanyModel?.copyWith(packagesId: id.toString());
    debugPrint('================= ${createCompanyModel?.packagesId} :ss ');
    _update;
  }

  get _update {
    emit(const CompanyState.loading());
    emit(const CompanyState.initial());
  }
}
