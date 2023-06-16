import 'dart:convert';

/// error : false
/// message : "User Data Get Successfully"
/// data : [{"id":"8","status":"1","trans_limit":"10","online":"Water Bill Recharge","d2h":"Water Bill Recharge","image":"uploads/media/2023/Water_Bill.png","convenience_fee":"2"},{"id":"9","status":"1","trans_limit":"2","online":"Gas Bill","d2h":"Gas Bill","image":"uploads/media/2023/Gas_Bill.png","convenience_fee":"10"},{"id":"10","status":"1","trans_limit":"4","online":"DTH Bill","d2h":"DTH Bill","image":"uploads/media/2023/DTH.png","convenience_fee":"20"},{"id":"11","status":"1","trans_limit":"2","online":"Mobile Recharge","d2h":"Mobile Recharge","image":"uploads/media/2023/Recharge.png","convenience_fee":"30"},{"id":"12","status":"1","trans_limit":"1","online":"Electricity","d2h":"Electricity","image":"uploads/media/2023/Electricity.png","convenience_fee":"10"}]



List<RechrgeModel>? RechrgeModelFromJson(String str) => List<RechrgeModel>.from(json.decode(str).map((x) => RechrgeModel.fromJson(x)));
String RechrgeModelToJson(List<RechrgeModel> data) => json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class RechrgeModel {
  RechrgeModel({
      bool? error, 
      String? message, 
      List<Data>? data,}){
    _error = error;
    _message = message;
    _data = data;
}

  RechrgeModel.fromJson(dynamic json) {
    _error = json['error'];
    _message = json['message'];
    if (json['data'] != null) {
      _data = [];
      json['data'].forEach((v) {
        _data?.add(Data.fromJson(v));
      });
    }
  }
  bool? _error;
  String? _message;
  List<Data>? _data;
RechrgeModel copyWith({  bool? error,
  String? message,
  List<Data>? data,
}) => RechrgeModel(  error: error ?? _error,
  message: message ?? _message,
  data: data ?? _data,
);
  bool? get error => _error;
  String? get message => _message;
  List<Data>? get data => _data;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['error'] = _error;
    map['message'] = _message;
    if (_data != null) {
      map['data'] = _data?.map((v) => v.toJson()).toList();
    }
    return map;
  }

}

/// id : "8"
/// status : "1"
/// trans_limit : "10"
/// online : "Water Bill Recharge"
/// d2h : "Water Bill Recharge"
/// image : "uploads/media/2023/Water_Bill.png"
/// convenience_fee : "2"

class Data {
  Data({
      String? id, 
      String? status, 
      String? transLimit, 
      String? online, 
      String? d2h, 
      String? image, 
      String? convenienceFee,}){
    _id = id;
    _status = status;
    _transLimit = transLimit;
    _online = online;
    _d2h = d2h;
    _image = image;
    _convenienceFee = convenienceFee;
}

  Data.fromJson(dynamic json) {
    _id = json['id'];
    _status = json['status'];
    _transLimit = json['trans_limit'];
    _online = json['online'];
    _d2h = json['d2h'];
    _image = json['image'];
    _convenienceFee = json['convenience_fee'];
  }
  String? _id;
  String? _status;
  String? _transLimit;
  String? _online;
  String? _d2h;
  String? _image;
  String? _convenienceFee;
Data copyWith({  String? id,
  String? status,
  String? transLimit,
  String? online,
  String? d2h,
  String? image,
  String? convenienceFee,
}) => Data(  id: id ?? _id,
  status: status ?? _status,
  transLimit: transLimit ?? _transLimit,
  online: online ?? _online,
  d2h: d2h ?? _d2h,
  image: image ?? _image,
  convenienceFee: convenienceFee ?? _convenienceFee,
);
  String? get id => _id;
  String? get status => _status;
  String? get transLimit => _transLimit;
  String? get online => _online;
  String? get d2h => _d2h;
  String? get image => _image;
  String? get convenienceFee => _convenienceFee;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['id'] = _id;
    map['status'] = _status;
    map['trans_limit'] = _transLimit;
    map['online'] = _online;
    map['d2h'] = _d2h;
    map['image'] = _image;
    map['convenience_fee'] = _convenienceFee;
    return map;
  }

}