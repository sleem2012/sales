import "package:dartz/dartz.dart";
import 'package:dio/dio.dart';
import '../../models/add_new_emp_model.dart';
import '../../models/branch_staff/branch_staff_model.dart';
import '../../models/famous/add_famous_model.dart';
import '../../models/famous/famous_data.dart';
import '../../models/famous/famous_types.dart';
import '../../../di.dart';
import '../../../../packages/shared/error/failures.dart';
import '../../../packages/dynamic_ui/model/dynamic_ui_model.dart';
import '../../../packages/shared/api_client/dio_client_helper.dart';
import '../../../packages/shared/api_client/endpoints.dart';

abstract class _BranchStaffRepo {
  Future<Either<KFailure, BranchStaffModel>> getBranchStaff({int? id});

  Future<Either<KFailure, FamousModel>> getFamous();

  Future<Either<KFailure, FamousTypes>> getFamousTypes();

  Future<Either<KFailure, Unit>> addEmployee(AddEmployeeModel addEmployeeModel);

  Future<Either<KFailure, Unit>> addPreFamous(AddFamousModel addFamousModel);

  Future<Either<KFailure, Unit>> updateEmployee(AddEmployeeModel addEmployeeModel);

  Future<Either<KFailure, Unit>> blockUser({required int id, required int isBlocked, required String reason});

  Future<Either<KFailure, Unit>> addInternalEmployee(Map<String, dynamic> values);

  Future<Either<KFailure, Unit>> addFamous(Map<String, dynamic> values);

  Future<Either<KFailure, List<DUIFieldModel>>> get_internal_emp_fields();

  Future<Either<KFailure, List<DUIFieldModel>>> get_famous_fields();
}

class BranchStaffRepoImpl implements _BranchStaffRepo {
  @override
  Future<Either<KFailure, BranchStaffModel>> getBranchStaff({int? id}) async {
    Future<Response<dynamic>> func = Di.dioClient.get(
      KEndPoints.branch_staff,
      params: id != null ? {"id": id} : null,
    );
    final result = await ApiClientHelper.responseOrFailure(func: func);
    return result.fold((l) => left(l), (r) => right(BranchStaffModel.fromJson(r)));
  }

  @override
  Future<Either<KFailure, Unit>> addEmployee(AddEmployeeModel addEmployeeModel) async {
    Future<Response<dynamic>> func = Di.dioClient.postWithFiles(KEndPoints.branch_staff, data: addEmployeeModel.toMap());

    final result = await ApiClientHelper.responseOrFailure(func: func);
    return result.fold((l) => left(l), (r) => right(unit));
  }

  @override
  Future<Either<KFailure, Unit>> addPreFamous(AddFamousModel addFamousModel) async {
    Future<Response<dynamic>> func = Di.dioClient.post(KEndPoints.preFamous, data: addFamousModel.toJson());

    final result = await ApiClientHelper.responseOrFailure(func: func);
    return result.fold((l) => left(l), (r) => right(unit));
  }

  @override
  Future<Either<KFailure, Unit>> updateEmployee(AddEmployeeModel addEmployeeModel) async {
    Future<Response<dynamic>> func = Di.dioClient.put(KEndPoints.branch_staff, data: addEmployeeModel.toJson());
    final result = await ApiClientHelper.responseOrFailure(func: func);
    return result.fold((l) => left(l), (r) => right(unit));
  }

  @override
  Future<Either<KFailure, Unit>> blockUser({required int id, int? isBlocked, String? reason}) async {
    Future<Response<dynamic>> func = Di.dioClient.put(KEndPoints.branch_staff, data: {
      "id": id,
      if (isBlocked != null) "is_blocked": isBlocked,
      if (reason != null) "block_reason": reason,
      // if (requiredContracts != null) "required_contracts": requiredContracts
    },);
    final result = await ApiClientHelper.responseOrFailure(func: func);
    return result.fold((l) => left(l), (r) => right(unit));
  }

  @override
  Future<Either<KFailure, FamousModel>> getFamous() async {
    Future<Response<dynamic>> func = Di.dioClient.get(KEndPoints.famous);
    final result = await ApiClientHelper.responseOrFailure(func: func);
    return result.fold((l) => left(l), (r) => right(FamousModel.fromJson(r)));
  }

  @override
  Future<Either<KFailure, FamousTypes>> getFamousTypes() async {
    Future<Response<dynamic>> func = Di.dioClient.get(KEndPoints.famousTypes);
    final result = await ApiClientHelper.responseOrFailure(func: func);
    return result.fold((l) => left(l), (r) => right(FamousTypes.fromJson(r)));
  }

  @override
  Future<Either<KFailure, Unit>> addInternalEmployee(Map<String, dynamic> values) async {
    Future<Response<dynamic>> func = Di.dioClient.postWithFiles(KEndPoints.internal_employee, data: values);
    final result = await ApiClientHelper.responseOrFailure(func: func);
    return result.fold(
      (l) => left(l),
      (r) => right(unit),
    );
  }

  @override
  Future<Either<KFailure, List<DUIFieldModel>>> get_internal_emp_fields() async {
    Future<Response<dynamic>> func = Di.dioClient.get(KEndPoints.internal_employee_fields);
    final result = await ApiClientHelper.responseOrFailure(func: func);
    return result.fold(
      (l) => left(l),
      (r) {
        List<DUIFieldModel> fields = [];
        List list = r["data"] as List;
        for (var v in list) {
          fields.add(DUIFieldModel.fromJson(v));
        }
        return right(fields);
      },
    );
  }

  @override
  Future<Either<KFailure, List<DUIFieldModel>>> get_famous_fields() async {
    Future<Response<dynamic>> func = Di.dioClient.get(KEndPoints.famous_attribute);
    final result = await ApiClientHelper.responseOrFailure(func: func);
    return result.fold(
      (l) => left(l),
      (r) {
        List<DUIFieldModel> fields = [];
        List list = r["data"] as List;
        for (var v in list) {
          fields.add(DUIFieldModel.fromJson(v));
        }
        return right(fields);
      },
    );
  }

  @override
  Future<Either<KFailure, Unit>> addFamous(Map<String, dynamic> values) async {
    Future<Response<dynamic>> func = Di.dioClient.postWithFiles(KEndPoints.famous, data: values);
    final result = await ApiClientHelper.responseOrFailure(func: func);
    return result.fold(
      (l) => left(l),
      (r) => right(unit),
    );
  }
}
