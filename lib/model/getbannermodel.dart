/// error : false
/// message : "Banners Found"
/// data : [{"image":"https://developmentalphawizz.com/bus_booking/uploads/643ab1871d253.jpg"}]

class Getbannermodel {
  Getbannermodel({
      bool? error, 
      String? message, 
      List<Data>? data,}){
    _error = error;
    _message = message;
    _data = data;
}

  Getbannermodel.fromJson(dynamic json) {
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
Getbannermodel copyWith({  bool? error,
  String? message,
  List<Data>? data,
}) => Getbannermodel(  error: error ?? _error,
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

/// image : "https://developmentalphawizz.com/bus_booking/uploads/643ab1871d253.jpg"

class Data {
  Data({
      String? image,}){
    _image = image;
}

  Data.fromJson(dynamic json) {
    _image = json['image'];
  }
  String? _image;
Data copyWith({  String? image,
}) => Data(  image: image ?? _image,
);
  String? get image => _image;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['image'] = _image;
    return map;
  }

}