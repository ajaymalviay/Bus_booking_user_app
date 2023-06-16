/// error : false
/// message : "Registered Successfully"
/// data : [{"id":"12","username":"Atul gautam","email":"atul@gmail.com","mobile":"8989895621"}]

class RegistationModel {
  RegistationModel({
      bool? error, 
      String? message, 
      List<Data>? data,}){
    _error = error;
    _message = message;
    _data = data;
}

  RegistationModel.fromJson(dynamic json) {
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
RegistationModel copyWith({  bool? error,
  String? message,
  List<Data>? data,
}) => RegistationModel(  error: error ?? _error,
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

/// id : "12"
/// username : "Atul gautam"
/// email : "atul@gmail.com"
/// mobile : "8989895621"

class Data {
  Data({
      String? id, 
      String? username, 
      String? email, 
      String? mobile,}){
    _id = id;
    _username = username;
    _email = email;
    _mobile = mobile;
}

  Data.fromJson(dynamic json) {
    _id = json['id'];
    _username = json['username'];
    _email = json['email'];
    _mobile = json['mobile'];
  }
  String? _id;
  String? _username;
  String? _email;
  String? _mobile;
Data copyWith({  String? id,
  String? username,
  String? email,
  String? mobile,
}) => Data(  id: id ?? _id,
  username: username ?? _username,
  email: email ?? _email,
  mobile: mobile ?? _mobile,
);
  String? get id => _id;
  String? get username => _username;
  String? get email => _email;
  String? get mobile => _mobile;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['id'] = _id;
    map['username'] = _username;
    map['email'] = _email;
    map['mobile'] = _mobile;
    return map;
  }

}