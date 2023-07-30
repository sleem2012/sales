// ignore_for_file: public_member_api_docs, sort_constructors_first
class AddFamousModel {
  String? email;
  String? coupon;
  int? type;

  AddFamousModel({
    this.email,
    this.coupon,
    this.type,
  });

  AddFamousModel.fromJson(Map<String, dynamic> json) {
    email = json['email'];
    coupon = json['coupon'];
    type = json['type'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['email'] = email;
    data['coupon'] = coupon;
    data['type'] = type;
    return data;
  }

  AddFamousModel copyWith({
    String? email,
    String? coupon,
    int? type,
  }) {
    return AddFamousModel(
      email: email ?? this.email,
      coupon: coupon ?? this.coupon,
      type: type ?? this.type,
    );
  }

  @override
  bool operator ==(covariant AddFamousModel other) {
    if (identical(this, other)) return true;
  
    return 
      other.email == email &&
      other.coupon == coupon &&
      other.type == type;
  }

  @override
  int get hashCode => email.hashCode ^ coupon.hashCode ^ type.hashCode;
}
