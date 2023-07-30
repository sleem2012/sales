import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

import '../../../../packages/shared/error/failures.dart';
import '../../../data/models/add_new_emp_model.dart';
import '../../../packages/modules/models/branches/branch_model.dart';
import '../../../data/repository/branch_staff/branches_staff_repo.dart';
import 'add_employee_state.dart';
import '../../../packages/cache/locale_storage.dart';
import '../../../packages/modules/models/location/cities_model.dart';
import '../../../packages/modules/models/location/countries_model.dart';
import '../../../packages/shared/localization/trans.dart';
import '../../../packages/shared/picker/data/country_search_model/address_result.dart';
import '../../../packages/shared/theme/helper.dart';
import '../../../views/widgets/slug_drop_down.dart';

class AddEmployeeBloc extends Cubit<AddEmployeeState> {
  AddEmployeeBloc({required this.addEmployeeImpl}) : super(const AddEmployeeState.initial());

  static AddEmployeeBloc of(BuildContext context) {
    return BlocProvider.of<AddEmployeeBloc>(context);
  }

  final BranchStaffRepoImpl addEmployeeImpl;

  CountriesDatum? selectedCountry;
  BranchData? selectedBranch;
  CitiesDatum? selectedCity;
  String cCode = '';
  bool passVisible = true, addressIsNull = false;

  KSlugModel? selectedGender;

  togglePassV() {
    passVisible = !passVisible;
    _update;
  }

  AddEmployeeModel? addEmployeeModel = AddEmployeeModel(
    birthdate: DateTime.now().toString().split(' ').first,
    lang_id: KStorage.i.getLangId,
    currency_id: KStorage.i.getcurrencyId,
    timeZone: DateTime.now().timeZoneName,
  );

  TextEditingController nameController = TextEditingController();
  TextEditingController emailController = TextEditingController();
  TextEditingController phoneController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  TextEditingController passwordConfirmController = TextEditingController();
  TextEditingController stateController = TextEditingController();
  TextEditingController countryController = TextEditingController();
  TextEditingController streetController = TextEditingController();
  TextEditingController buildingController = TextEditingController();
  TextEditingController intercomController = TextEditingController();
  TextEditingController floorController = TextEditingController();
  TextEditingController zipcodeController = TextEditingController();
  TextEditingController detailedAddressController = TextEditingController();

  // TextEditingController requiredContractsController = TextEditingController();
  String? location;

  addEmployee() async {
    emit(const AddEmployeeState.loading());
    try {
      addEmployeeModel = addEmployeeModel?.copyWith(
        name: nameController.text,
        email: emailController.text,
        password: passwordController.text,
        mobile: cCode + phoneController.text,
        password_confirmation: passwordConfirmController.text,
        fcmToken: KStorage.i.getFcmToken,
        lang_id: KStorage.i.getLangId,
        currency_id: KStorage.i.getcurrencyId,

        // requiredContract: int.tryParse(requiredContractsController.text),
      );

      // debugPrint('=================  :${addEmployeeModel?.toJson()} ');
      final result = await addEmployeeImpl.addEmployee(addEmployeeModel!);

      result.fold(
        (l) {
          emit(AddEmployeeState.error(error: KFailure.toError(l)));
          debugPrint('================= AddEmployee (Bloc): Failed $l ');
        },
        (r) {
          emit(const AddEmployeeState.success());
          debugPrint('================= AddEmployee (Bloc) : Success ');
        },
      );
    } catch (e) {
      debugPrint('================= AddEmployee (Bloc) (catch):  $e');
      emit(AddEmployeeState.error(error: Tr.get.something_went_wrong));
    }
  }

  updateEmployee() async {
    emit(const AddEmployeeState.loading());
    try {
      addEmployeeModel = addEmployeeModel?.copyWith(
        name: nameController.text,
        email: emailController.text,
        mobile: phoneController.text,
      );

      debugPrint('=================  :${addEmployeeModel?.toJson()} ');
      final result = await addEmployeeImpl.updateEmployee(addEmployeeModel!);

      result.fold(
        (l) {
          emit(AddEmployeeState.error(error: KFailure.toError(l)));
          debugPrint('================= AddEmployee (Bloc): Failed $l ');
        },
        (r) {
          emit(const AddEmployeeState.success());
          debugPrint('================= AddEmployee (Bloc): Success ');
        },
      );
    } catch (e) {
      debugPrint('================= AddEmployee (Bloc) (catch):  $e');
      emit(AddEmployeeState.error(error: Tr.get.something_went_wrong));
    }
  }

  // CountriesDatum? selectedNationality;

  Future<void> selectNationality(int id) async {
    // selectedNationality = nationalityData;
    addEmployeeModel = addEmployeeModel?.copyWith(nationalityId: id.toString());
    debugPrint('================= ${addEmployeeModel?.nationalityId} ');
    _update;
  }

  setbirthdate(String val) {
    addEmployeeModel = addEmployeeModel?.copyWith(birthdate: val);
    _update;
  }

  selectGender(KSlugModel? selected) {
    selectedGender = selected;
    addEmployeeModel = addEmployeeModel?.copyWith(gender: selected?.slug);
    _update;
  }

  selectBranchId(BranchData branchData) {
    selectedBranch = branchData;

    addEmployeeModel = addEmployeeModel?.copyWith(branch_id: branchData.id);
    _update;
  }

  selectImage(File? image) async {
    if (image != null) {
      addEmployeeModel = addEmployeeModel?.copyWith(image: image);
      _update;
    } else {
      KHelper.showSnackBar('Please select ');
    }
  }

  Future<void> selectDate(BuildContext context) async {
    final DateTime? picked = await showDatePicker(
      context: context,
      initialDate: DateTime.now(),
      firstDate: DateTime(1900, 1),
      lastDate: DateTime.now(),
    );
    addEmployeeModel = addEmployeeModel?.copyWith(birthdate: picked.toString().split(' ').first);
    debugPrint('================= ${addEmployeeModel?.birthdate}');
    _update;
  }

  Future<void> selectCityId(int id, CitiesDatum? citiesDatum) async {
    selectedCity = citiesDatum;
    addEmployeeModel = addEmployeeModel?.copyWith(city_id: id);
    debugPrint('================= ${addEmployeeModel?.city_id} ');
    _update;
  }

  Future<void> selectCountry(CountriesDatum? country) async {
    selectedCountry = country;
    _update;
  }

  setLocationData(AddressResult result) {
    addEmployeeModel = addEmployeeModel?.copyWith(
      latitude: result.latLng.latitude,
      longitude: result.latLng.longitude,
      detailed_address: result.address,
      state: result.state,
      city_id: result.cityId,
      floor: result.floor,
      building: result.building,
      street: result.street,
      zipcode: result.zipcode,
      intercom: result.intercome,
    );
    location = result.address;
    _update;
  }

  AddressResult? setInitial() {
    return addEmployeeModel?.detailed_address == null
        ? null
        : AddressResult(
            latLng: LatLng(addEmployeeModel!.latitude!, addEmployeeModel!.longitude!),
            address: addEmployeeModel!.detailed_address!,
            zipcode: addEmployeeModel!.zipcode!,
            building: addEmployeeModel?.building!,
            countryId: addEmployeeModel!.countryId!,
            floor: addEmployeeModel?.floor!,
            cityId: addEmployeeModel?.city_id!,
            intercome: addEmployeeModel?.intercom!,
            street: addEmployeeModel?.street!,
          );
  }

  get _update {
    emit(const AddEmployeeState.loading());
    emit(const AddEmployeeState.initial());
  }
}
