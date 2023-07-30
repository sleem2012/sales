class CreateVendorModel {
  int? id;
  String? email;
  String? state;
  String? waitingReason;
  String? cancelledReason;
  String? rejectedReason;
  String? remainder;
  String? commercialId;
  String? entityId;
  String? company_type;
  String? owner;
  String? company;
  String? phone;
  int? city_id;

  CreateVendorModel(
      {this.email,
      this.state,
      this.waitingReason,
      this.company_type,
      this.cancelledReason,
      this.rejectedReason,
      this.remainder,
      this.id,
      this.commercialId,
      this.entityId,
      this.phone,
      this.company,
      this.owner,
      this.city_id,});

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};

    if (email != null) {
      data['email'] = email;
    }
    if (id != null) {
      data['id'] = id;
    }

    if (state != null) {
      data['state'] = state;
    }
    if (state != null) {
      data['company_type'] = company_type;
    }
    if (waitingReason != null) {
      data['waiting_reason'] = waitingReason;
    }
    if (cancelledReason != null) {
      data['cancelled_reason'] = cancelledReason;
    }
    if (rejectedReason != null) {
      data['rejected_reason'] = rejectedReason;
    }
    if (remainder != null) {
      data['remainder'] = remainder;
    }
    if (commercialId != null) {
      data['commercial_id'] = commercialId;
    }
    if (entityId != null) {
      data['entity_id'] = entityId;
    }
    if (company != null) {
      data['company_name'] = company;
    }
    if (owner != null) {
      data['owner'] = owner;
    }
    if (phone != null) {
      data['phone'] = phone;
    }
    if (city_id != null) {
      data['city_id'] = city_id;
    }
    return data;
  }

  CreateVendorModel copyWith({
    String? email,
    String? company_type,
    int? id,
    String? state,
    String? waitingReason,
    String? cancelledReason,
    String? rejectedReason,
    String? remainder,
    String? commercialId,
    String? entityId,
    String? owner,
    String? company,
    String? phone,
    int? city_id,

  }) {
    return CreateVendorModel(
      email: email ?? this.email,
      commercialId: commercialId ?? this.commercialId,
      entityId: entityId ?? this.entityId,
      state: state ?? this.state,
      waitingReason: waitingReason ?? this.waitingReason,
      cancelledReason: cancelledReason ?? this.cancelledReason,
      rejectedReason: rejectedReason ?? this.rejectedReason,
      remainder: remainder ?? this.remainder,
      id: id ?? this.id,
      company_type: company_type ?? this.company_type,
      company: company ?? this.company,
      phone: phone ?? this.phone,
      city_id: city_id ?? this.city_id,
      owner: owner ?? this.owner,

    );
  }
}
