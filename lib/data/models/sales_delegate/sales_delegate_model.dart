class GetSalesDelegateModel {
  bool? success;
  String? status;
  String? message;
  List<GetSalesDelegateData>? data;

  GetSalesDelegateModel({this.success, this.status, this.message, this.data});

  GetSalesDelegateModel.fromJson(Map<String, dynamic> json) {
    success = json['success'];
    status = json['status'];
    message = json['message'];
    if (json['data'] != null) {
      data = <GetSalesDelegateData>[];
      json['data'].forEach((v) {
        data!.add(GetSalesDelegateData.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['success'] = success;
    data['status'] = status;
    data['message'] = message;
    if (this.data != null) {
      data['data'] = this.data!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class GetSalesDelegateData {
  int? id;
  String? email;
  String? verifyCode;
  String? state;
  String? waitingReason;
  String? cancelledReason;
  String? rejectedReason;
  String? remainder;

  GetSalesDelegateData({this.id, this.email, this.verifyCode, this.state, this.waitingReason, this.cancelledReason, this.rejectedReason, this.remainder});

  GetSalesDelegateData.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    email = json['email'];
    verifyCode = json['verify_code'];
    state = json['state'];
    waitingReason = json['waiting_reason'];
    cancelledReason = json['cancelled_reason'];
    rejectedReason = json['rejected_reason'];
    remainder = json['remainder'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = id;
    data['email'] = email;
    data['verify_code'] = verifyCode;
    data['state'] = state;
    data['waiting_reason'] = waitingReason;
    data['cancelled_reason'] = cancelledReason;
    data['rejected_reason'] = rejectedReason;
    data['remainder'] = remainder;
    return data;
  }
}
