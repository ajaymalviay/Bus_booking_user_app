/// status : "1"
/// msg : "Service providers"
/// setting : {"id":"1","data":"<h2>Privacy Policy</h2>","discription":"<p>SOD is best service provider application. </p>"}

class GetPrivacyPoliceModel {
  GetPrivacyPoliceModel({
      String? status, 
      String? msg, 
      Setting? setting,}){
    _status = status;
    _msg = msg;
    _setting = setting;
}

  GetPrivacyPoliceModel.fromJson(dynamic json) {
    _status = json['status'];
    _msg = json['msg'];
    _setting = json['setting'] != null ? Setting.fromJson(json['setting']) : null;
  }
  String? _status;
  String? _msg;
  Setting? _setting;
GetPrivacyPoliceModel copyWith({  String? status,
  String? msg,
  Setting? setting,
}) => GetPrivacyPoliceModel(  status: status ?? _status,
  msg: msg ?? _msg,
  setting: setting ?? _setting,
);
  String? get status => _status;
  String? get msg => _msg;
  Setting? get setting => _setting;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['status'] = _status;
    map['msg'] = _msg;
    if (_setting != null) {
      map['setting'] = _setting?.toJson();
    }
    return map;
  }

}

/// id : "1"
/// data : "<h2>Privacy Policy</h2>"
/// discription : "<p>SOD is best service provider application. </p>"

class Setting {
  Setting({
      String? id, 
      String? data, 
      String? discription,}){
    _id = id;
    _data = data;
    _discription = discription;
}

  Setting.fromJson(dynamic json) {
    _id = json['id'];
    _data = json['data'];
    _discription = json['discription'];
  }
  String? _id;
  String? _data;
  String? _discription;
Setting copyWith({  String? id,
  String? data,
  String? discription,
}) => Setting(  id: id ?? _id,
  data: data ?? _data,
  discription: discription ?? _discription,
);
  String? get id => _id;
  String? get data => _data;
  String? get discription => _discription;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['id'] = _id;
    map['data'] = _data;
    map['discription'] = _discription;
    return map;
  }

}