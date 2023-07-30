import '../main.dart';
import 'cache/locale_storage.dart';

abstract class UsersPermissions {
  static final _user = KStorage.i.getUserInfo?.data;

  static bool get _isManager => _user?.type?.id == 8;

  static bool get _hasCompany => _user?.userCompany != null;

  static bool get _hasReport => _user?.categories?.where((element) => element.hasReport == true).toList().isNotEmpty == true;

  static bool get canAddEditBranch => appName.maybeWhen(
        orElse: () => true,
        vendor: () => (_isManager && _hasCompany),
      );

  static bool get canAddBranchManager => _isManager;

  static bool get canAddEditProducts => _isManager;

  static bool get hasReport => _hasReport;

  static bool get isManager => _isManager;

  static bool salesCanAddBranch(bool isEmpty) =>
      (_hasCompany) && (_user?.type?.id == 1 || isEmpty || (_user?.type?.id == 3 && _user?.forallUser == true) || (_user?.type?.id == 4 && _user?.forallUser == true));

  static bool checkApp(bool isEmpty) {
    return appName.maybeWhen(
      orElse: () => false,
      vendor: () => canAddEditBranch,
      sales: () => salesCanAddBranch(isEmpty),
    );
  }
}
