import '../../../../packages/cache/locale_storage.dart';
import '../../../../packages/shared/localization/trans.dart';

class KVendorState {
  final String name;
  final String slug;

  KVendorState({required this.name, required this.slug});

  static List<KVendorState> list = [
    KVendorState(name: Tr.get.v_pending, slug: pending),
    KVendorState(name: Tr.get.v_watting, slug: waiting),
    KVendorState(name: Tr.get.v_joined, slug: joined),
    KVendorState(name: Tr.get.v_cancelled, slug: cancelled),
    KVendorState(name: Tr.get.v_rejected, slug: rejected),
  ];
  static List<KVendorState> add = [
    KVendorState(name: Tr.get.v_pending, slug: pending),
    KVendorState(name: Tr.get.v_watting, slug: waiting),
  ];
  static List<KVendorState> update = [
    KVendorState(name: Tr.get.v_watting, slug: waiting),
    KVendorState(name: Tr.get.v_pending, slug: pending),
    KVendorState(name: Tr.get.v_cancelled, slug: cancelled),
    KVendorState(name: Tr.get.v_rejected, slug: rejected),
  ];

  static const String pending = 'pending';
  static const String waiting = 'waiting';
  static const String joined = 'joined';
  static const String cancelled = 'cancelled';
  static const String rejected = 'rejected';
}

class KApplicationState {
  final String name;
  final String slug;

  KApplicationState({required this.name, required this.slug});

  static List<KApplicationState> applicationState = [
    KApplicationState(name: Tr.get.accept, slug: 'joined'),
    if (KStorage.i.getUserInfo?.data?.type?.id != 7) KApplicationState(name: Tr.get.assign, slug: 'joined'),
    KApplicationState(name: Tr.get.delete, slug: "delete"),
    KApplicationState(name: Tr.get.reject, slug: "reject"),
  ];
}

class KUpdateCompanyState {
  // final String name;
  // final String slug;
  //
  // KApplicationState({required this.name, required this.slug});

  static List state = [
    Tr.get.accept,
    if (KStorage.i.getUserInfo?.data?.type?.id != 7) Tr.get.assign,
    // KApplicationState(name: Tr.get.delete, slug: "delete"),
    // KApplicationState(name: Tr.get.reject, slug: "reject"),
  ];
}
