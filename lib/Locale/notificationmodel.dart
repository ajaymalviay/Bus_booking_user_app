/// error : false
/// message : "Notification Retrieved Successfully"
/// total : "1"
/// data : [{"id":"2","title":"test","message":"test","type":"default","type_id":"0","image":"https://developmentalphawizz.com/bus_booking/uploads/media/2022/Toss_KA_boss_Logo.png","date_sent":"2022-07-18 12:52:17"}]

class Notificationmodel {
  Notificationmodel({
      bool? error, 
      String? message, 
      String? total, 
      List<Data>? data,}){
    _error = error;
    _message = message;
    _total = total;
    _data = data;
}

  Notificationmodel.fromJson(dynamic json) {
    _error = json['error'];
    _message = json['message'];
    _total = json['total'];
    if (json['data'] != null) {
      _data = [];
      json['data'].forEach((v) {
        _data?.add(Data.fromJson(v));
      });
    }
  }
  bool? _error;
  String? _message;
  String? _total;
  List<Data>? _data;
Notificationmodel copyWith({  bool? error,
  String? message,
  String? total,
  List<Data>? data,
}) => Notificationmodel(  error: error ?? _error,
  message: message ?? _message,
  total: total ?? _total,
  data: data ?? _data,
);
  bool? get error => _error;
  String? get message => _message;
  String? get total => _total;
  List<Data>? get data => _data;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['error'] = _error;
    map['message'] = _message;
    map['total'] = _total;
    if (_data != null) {
      map['data'] = _data?.map((v) => v.toJson()).toList();
    }
    return map;
  }

}

/// id : "2"
/// title : "test"
/// message : "test"
/// type : "default"
/// type_id : "0"
/// image : "https://developmentalphawizz.com/bus_booking/uploads/media/2022/Toss_KA_boss_Logo.png"
/// date_sent : "2022-07-18 12:52:17"

class Data {
  Data({
      String? id, 
      String? title, 
      String? message, 
      String? type, 
      String? typeId, 
      String? image, 
      String? dateSent,}){
    _id = id;
    _title = title;
    _message = message;
    _type = type;
    _typeId = typeId;
    _image = image;
    _dateSent = dateSent;
}

  Data.fromJson(dynamic json) {
    _id = json['id'];
    _title = json['title'];
    _message = json['message'];
    _type = json['type'];
    _typeId = json['type_id'];
    _image = json['image'];
    _dateSent = json['date_sent'];
  }
  String? _id;
  String? _title;
  String? _message;
  String? _type;
  String? _typeId;
  String? _image;
  String? _dateSent;
Data copyWith({  String? id,
  String? title,
  String? message,
  String? type,
  String? typeId,
  String? image,
  String? dateSent,
}) => Data(  id: id ?? _id,
  title: title ?? _title,
  message: message ?? _message,
  type: type ?? _type,
  typeId: typeId ?? _typeId,
  image: image ?? _image,
  dateSent: dateSent ?? _dateSent,
);
  String? get id => _id;
  String? get title => _title;
  String? get message => _message;
  String? get type => _type;
  String? get typeId => _typeId;
  String? get image => _image;
  String? get dateSent => _dateSent;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['id'] = _id;
    map['title'] = _title;
    map['message'] = _message;
    map['type'] = _type;
    map['type_id'] = _typeId;
    map['image'] = _image;
    map['date_sent'] = _dateSent;
    return map;
  }

}