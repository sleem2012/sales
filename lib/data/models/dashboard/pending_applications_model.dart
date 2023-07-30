import '../../../packages/modules/models/user_info/user_model.dart';

import '../branch_staff/branch_staff_model.dart';


class PendingApplicationsData {
  int? id;
  UserModelData? user;
  CommercialAttributes? commercial;
  String? state;

  PendingApplicationsData({this.id, this.user, this.commercial, this.state});

  PendingApplicationsData.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    user = json['user'] != null ? UserModelData.fromJson(json['user']) : null;
    commercial = json['commercial'] != null
        ? CommercialAttributes.fromJson(json['commercial'])
        : null;
    state = json['state'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = id;
    if (user != null) {
      data['user'] = user!.toJson();
    }

    data['state'] = state;
    return data;
  }
}


class CommercialAttributes {
  Identity? identity;
  Identity? passport;
  FreeWorkLicense? freeWorkLicense;

  CommercialAttributes({this.identity, this.passport, this.freeWorkLicense});

  CommercialAttributes.fromJson(Map<String, dynamic> json) {
    identity = json['identity'] != null
        ? Identity.fromJson2(json['identity'])
        : null;
    passport = json['passport'] != null
        ? Identity.fromJson(json['passport'])
        : null;
    freeWorkLicense = json['free_work_license'] != null
        ? FreeWorkLicense.fromJson(json['free_work_license'])
        : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    if (identity != null) {
      data['identity'] = identity!.toJson();
    }
    if (passport != null) {
      data['passport'] = passport!.toJson();
    }
    if (freeWorkLicense != null) {
      data['free_work_license'] = freeWorkLicense!.toJson();
    }
    return data;
  }
}

class Identity {
  Image? file;
  Image? fileBack;
  String? value;

  Identity({this.file, this.value,this.fileBack});

  Identity.fromJson(Map<String, dynamic> json) {
    file = json['file'] != null ? Image.fromJson(json['file']) : null;
    value = json['value'];
  }
  Identity.fromJson2(Map<String, dynamic> json) {
    fileBack = json['file_back'] != null ? Image.fromJson(json['file_back']) : null;
    file = json['file_front'] != null ? Image.fromJson(json['file_front']) : null;
    value = json['value'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    if (file != null) {
      data['file'] = file!.toJson();
    }
    data['value'] = value;
    return data;
  }
}

class FreeWorkLicense {
  Image? file;
  String? name;
  String? value;
  String? expiryAt;
  String? releaseAt;

  FreeWorkLicense(
      {this.file, this.name, this.value, this.expiryAt, this.releaseAt,});

  FreeWorkLicense.fromJson(Map<String, dynamic> json) {
    file = json['file'] != null ? Image.fromJson(json['file']) : null;
    name = json['name'];
    value = json['value'];
    expiryAt = json['expiry_at'];
    releaseAt = json['release_at'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    if (file != null) {
      data['file'] = file!.toJson();
    }
    data['name'] = name;
    data['value'] = value;
    data['expiry_at'] = expiryAt;
    data['release_at'] = releaseAt;
    return data;
  }
}

class Pagination {
  Links? links;
  Meta? meta;

  Pagination({this.links, this.meta});

  Pagination.fromJson(Map<String, dynamic> json) {
    links = json['links'] != null ? Links.fromJson(json['links']) : null;
    meta = json['meta'] != null ? Meta.fromJson(json['meta']) : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    if (links != null) {
      data['links'] = links!.toJson();
    }
    if (meta != null) {
      data['meta'] = meta!.toJson();
    }
    return data;
  }
}

class Links {
  String? first;
  dynamic prev;
  dynamic next;

  Links({this.first, this.prev, this.next});

  Links.fromJson(Map<String, dynamic> json) {
    first = json['first'];
    prev = json['prev'];
    next = json['next'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['first'] = first;
    data['prev'] = prev;
    data['next'] = next;
    return data;
  }
}

class Meta {
  int? currentPage;
  int? from;
  int? to;
  int? perPage;
  int? total;

  Meta({this.currentPage, this.from, this.to, this.perPage, this.total});

  Meta.fromJson(Map<String, dynamic> json) {
    currentPage = json['current_page'];
    from = json['from'];
    to = json['to'];
    perPage = json['per_page'];
    total = json['total'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['current_page'] = currentPage;
    data['from'] = from;
    data['to'] = to;
    data['per_page'] = perPage;
    data['total'] = total;
    return data;
  }
}
