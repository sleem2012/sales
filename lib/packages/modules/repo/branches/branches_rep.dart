import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';

import '../../../../di.dart';
import '../../../shared/api_client/dio_client_helper.dart';
import '../../../shared/api_client/endpoints.dart';
import '../../../shared/error/failures.dart';
import '../../models/branches/add_branch.dart';
import '../../models/branches/add_new_emp_model.dart';
import '../../models/branches/branch_man.dart';
import '../../models/branches/branch_model.dart';

abstract class _BranchesRepoAbs {
  Future<Either<KFailure, BranchModel>> getBranches();

  Future<Either<KFailure, Unit>> addBranch(AddBranchModel addBranchModel);

  Future<Either<KFailure, Unit>> deleteBranch(int id);

  Future<Either<KFailure, Unit>> updateBranch(AddBranchModel addBranchModel);

  ///
  Future<Either<KFailure, Unit>> add_branch_man(AddBranchManModel addBranchModel);

  Future<Either<KFailure, BranchManModel>> get_managers();

  Future<Either<KFailure, Unit>> editBranchForManager({required int id, int? branch_id});

  Future<Either<KFailure, Unit>> blockUser({required int id, required int isBlocked, required String reason});
}

class BranchesRepoImpl implements _BranchesRepoAbs {
  static BranchesRepoImpl? _instance;

  BranchesRepoImpl._internal() {
    _instance = this;
  }

  static BranchesRepoImpl get i {
    return _instance ?? BranchesRepoImpl._internal();
  }

  @override
  Future<Either<KFailure, BranchModel>> getBranches() async {
    Future<Response<dynamic>> func = Di.dioClient.get(KEndPoints.branch_read);
    final result = await ApiClientHelper.responseOrFailure(func: func);
    return result.fold((l) => left(l), (r) => right(BranchModel.fromJson(r)));
  }

  @override
  Future<Either<KFailure, Unit>> addBranch(AddBranchModel addBranchModel) async {
    Future<Response<dynamic>> func = Di.dioClient.post(KEndPoints.branch_read, data: addBranchModel.toJson());
    final result = await ApiClientHelper.responseOrFailure(func: func);
    return result.fold((l) => left(l), (r) => right(unit));
  }

  @override
  Future<Either<KFailure, Unit>> deleteBranch(id) async {
    Future<Response<dynamic>> func = Di.dioClient.delete(KEndPoints.branch_read, data: {'id': id});
    final result = await ApiClientHelper.responseOrFailure(func: func);
    return result.fold((l) => left(l), (r) => right(unit));
  }

  @override
  Future<Either<KFailure, Unit>> updateBranch(AddBranchModel addBranchModel) async {
    Future<Response<dynamic>> func = Di.dioClient.put(KEndPoints.branch_read, data: addBranchModel.toJson());
    final result = await ApiClientHelper.responseOrFailure(func: func);
    return result.fold((l) => left(l), (r) => right(unit));
  }

  ///
  @override
  Future<Either<KFailure, Unit>> add_branch_man(AddBranchManModel addEmployeeModel) async {
    Future<Response<dynamic>> func = Di.dioClient.postWithFiles(KEndPoints.branch_man, data: addEmployeeModel.toMap());
    final result = await ApiClientHelper.responseOrFailure(func: func);
    return result.fold((l) => left(l), (r) => right(unit));
  }

  @override
  Future<Either<KFailure, BranchManModel>> get_managers() async {
    Future<Response<dynamic>> func = Di.dioClient.get(KEndPoints.branch_man);
    final result = await ApiClientHelper.responseOrFailure(func: func);
    return result.fold((l) => left(l), (r) => right(BranchManModel.fromJson(r)));
  }

  @override
  Future<Either<KFailure, Unit>> blockUser({required int id, int? isBlocked, String? reason}) async {
    Future<Response<dynamic>> func = Di.dioClient.put(
      KEndPoints.branch_man,
      data: {"id": id, if (isBlocked != null) "is_blocked": isBlocked, if (reason != null) "block_reason": reason},
    );
    final result = await ApiClientHelper.responseOrFailure(func: func);
    return result.fold((l) => left(l), (r) => right(unit));
  }

  @override
  Future<Either<KFailure, Unit>> editBranchForManager({required int id, int? branch_id}) async {
    Future<Response<dynamic>> func = Di.dioClient.put(KEndPoints.branch_man, data: {"id": id, "company_branch_id": branch_id});
    final result = await ApiClientHelper.responseOrFailure(func: func);
    return result.fold((l) => left(l), (r) => right(unit));
  }
}
