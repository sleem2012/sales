
class Categories {
  int? id;
  String? name;
  Category? category;

  Categories({this.id, this.name, this.category});

  Categories.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    name = json['name'] != null ? json['name']['value'] : null;
    category = json['category'] != null ? Category.fromJson(json['category']) : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = id;
    if (name != null) {
      data['name'] = {"value" : name};
    }
    if (category != null) {
      data['category'] = category!.toJson();
    }
    return data;
  }
}




class Category {
  int? id;
  String? name;
  List<Categories>? children;
  String? icons;
  String? features;
  String? type;
  int? companyTypeId;
  int? parentId;
  bool? hasReport;
  bool? isVisible;

  Category({
    this.id,
    this.name,
    this.children,
    this.icons,
    this.features,
    this.type,
    this.companyTypeId,
    this.parentId,
    this.hasReport,
    this.isVisible,
  });

  Category.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    name = json['name'] != null ? json['name']["value"] : null;
    if (json['children'] != null) {
      children = <Categories>[];
      json['children'].forEach((v) {
        children!.add(Categories.fromJson(v));
      });
    }
    icons = json['icons'] != null ? json['icons']["svg"] : null;
    features = json['features'];
    type = json['type'];
    companyTypeId = json['company_type_id'];
    parentId = json['parent_id'];

    hasReport = json['has_report'];
    isVisible = json['is_visible'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = id;
    if (name != null) {
      data['name'] = {"value": name};
    }
    if (children != null) {
      data['children'] = children!.map((v) => v.toJson()).toList();
    }
    if (icons != null) {
      data['icons'] = {"svg": icons};
    }
    data['features'] = features;
    data['type'] = type;
    data['company_type_id'] = companyTypeId;
    data['parent_id'] = parentId;

    data['has_report'] = hasReport;
    data['is_visible'] = isVisible;
    return data;
  }
}
