class CategoryModel {
  bool? success;
  String? status;
  String? message;
  List<CategoryData>? categoryData;

  CategoryModel({this.success, this.status, this.message, this.categoryData});

  CategoryModel.fromJson(Map<String, dynamic> json) {
    success = json['success'];
    status = json['status'];
    message = json['message'];
    if (json['data'] != null) {
      categoryData = <CategoryData>[];
      json['data'].forEach((v) {
        categoryData!.add(CategoryData.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['success'] = success;
    data['status'] = status;
    data['message'] = message;
    if (categoryData != null) {
      data['data'] = categoryData!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class CategoryData {
  int? id;
  Name? name;
  List<Children>? children;
  Iconss? icons;
  bool? isService;
  bool? isCartVisible;
  bool? hasClientVendorShipping;
  bool? isVisible;

  CategoryData(
      {this.id,
        this.name,
        this.children,
        this.icons,
        this.isService,
        this.isCartVisible,
        this.hasClientVendorShipping,
        this.isVisible,});

  CategoryData.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    name = json['name'] != null ? Name.fromJson(json['name']) : null;
    if (json['children'] != null) {
      children = <Children>[];
      json['children'].forEach((v) {
        children!.add(Children.fromJson(v));
      });
    }
    icons = json['icons'] != null ? Iconss.fromJson(json['icons']) : null;
    isService = json['is_service'];
    isCartVisible = json['is_cart_visible'];
    hasClientVendorShipping = json['has_client_vendor_shipping'];
    isVisible = json['is_visible'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = id;
    if (name != null) {
      data['name'] = name!.toJson();
    }
    if (children != null) {
      data['children'] = children!.map((v) => v.toJson()).toList();
    }
    if (icons != null) {
      data['icons'] = icons!.toJson();
    }
    data['is_service'] = isService;
    data['is_cart_visible'] = isCartVisible;
    data['has_client_vendor_shipping'] = hasClientVendorShipping;
    data['is_visible'] = isVisible;
    return data;
  }
}

class Name {
  String? key;
  String? value;

  Name({this.key, this.value});

  Name.fromJson(Map<String, dynamic> json) {
    key = json['key'];
    value = json['value'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['key'] = key;
    data['value'] = value;
    return data;
  }
}

class Children {
  int? id;
  Name? name;
  List<Children>? children;
  Iconss? icons;
  bool? isService;
  bool? isCartVisible;
  bool? hasClientVendorShipping;
  bool? isVisible;

  Children(
      {this.id,
        this.name,
        this.children,
        this.icons,
        this.isService,
        this.isCartVisible,
        this.hasClientVendorShipping,
        this.isVisible,});

  Children.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    name = json['name'] != null ? Name.fromJson(json['name']) : null;
    if (json['children'] != null) {
      children = <Children>[];
      json['children'].forEach((v) {
        children!.add(Children.fromJson(v));
      });
    }
    icons = json['icons'] != null ? Iconss.fromJson(json['icons']) : null;
    isService = json['is_service'];
    isCartVisible = json['is_cart_visible'];
    hasClientVendorShipping = json['has_client_vendor_shipping'];
    isVisible = json['is_visible'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = id;
    if (name != null) {
      data['name'] = name!.toJson();
    }
    if (children != null) {
      data['children'] = children!.map((v) => v.toJson()).toList();
    }
    if (icons != null) {
      data['icons'] = icons!.toJson();
    }
    data['is_service'] = isService;
    data['is_cart_visible'] = isCartVisible;
    data['has_client_vendor_shipping'] = hasClientVendorShipping;
    data['is_visible'] = isVisible;
    return data;
  }
}

class Iconss {
  String? svg;

  Iconss({this.svg});

  Iconss.fromJson(Map<String, dynamic> json) {
    svg = json['svg'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['svg'] = svg;
    return data;
  }
}
