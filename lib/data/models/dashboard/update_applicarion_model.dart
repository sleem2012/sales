class UpdateApplicationModel {
  int? id;
  int? assignerId;
  int? adminId;
  String? state;

  UpdateApplicationModel({this.id, this.assignerId, this.adminId, this.state});

  UpdateApplicationModel.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    assignerId = json['assigner_id'];
    adminId = json['admin_id'];
    state = json['state'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = id;
   if(assignerId!=null) data['assigner_id'] = assignerId;
    if(adminId!=null)  data['admin_id'] = adminId;
    if(state!=null) data['state'] = state;
    return data;
  }
}
