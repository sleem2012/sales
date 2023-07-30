class AddPaymentModel {
  bool? success;
  String? status;
  String? message;
  AddPaymentData? data;

  AddPaymentModel({this.success, this.status, this.message, this.data});

  AddPaymentModel.fromJson(Map<String, dynamic> json) {
    success = json['success'];
    status = json['status'];
    message = json['message'];
    data = json['data'] != null ? AddPaymentData.fromJson(json['data']) : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['success'] = success;
    data['status'] = status;
    data['message'] = message;
    if (this.data != null) {
      data['data'] = this.data!.toJson();
    }
    return data;
  }
}

class AddPaymentData {
  int? id;
  bool? isSelected;
  bool? isVisible;
  List<Values>? values;
  String? url;

  AddPaymentData({this.id, this.isSelected, this.isVisible, this.values, this.url});

  AddPaymentData.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    isSelected = json['is_selected'];
    isVisible = json['is_visible'];
    if (json['values'] != null) {
      values = <Values>[];
      json['values'].forEach((v) {
        values!.add(Values.fromJson(v));
      });
    }
    url = json['url'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = id;
    data['is_selected'] = isSelected;
    data['is_visible'] = isVisible;
    if (values != null) {
      data['values'] = values!.map((v) => v.toJson()).toList();
    }
    data['url'] = url;
    return data;
  }
}

class Values {
  String? key;
  Hint? hint;
  String? value;

  Values({this.key, this.hint, this.value});

  Values.fromJson(Map<String, dynamic> json) {
    key = json['key'];
    hint = json['hint'] != null ? Hint.fromJson(json['hint']) : null;
    value = json['value'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['key'] = key;
    if (hint != null) {
      data['hint'] = hint!.toJson();
    }
    data['value'] = value;
    return data;
  }
}

class Hint {
  String? key;
  String? value;

  Hint({this.key, this.value});

  Hint.fromJson(Map<String, dynamic> json) {
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
