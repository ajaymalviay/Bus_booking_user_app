/// error : false
/// message : "Profile Update Succesfully"
/// data : [{"image":"https://developmentalphawizz.com/bus_booking/assets/no-image.png","image_sm":"https://developmentalphawizz.com/bus_booking/assets/no-image.png","bank_pass":"https://developmentalphawizz.com/bus_booking/assets/no-image.png"}]

class Updateprofilemodel {
  Updateprofilemodel({
      bool? error, 
      String? message, 
      List<Data>? data,}){
    _error = error;
    _message = message;
    _data = data;
}

  Updateprofilemodel.fromJson(dynamic json) {
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
Updateprofilemodel copyWith({  bool? error,
  String? message,
  List<Data>? data,
}) => Updateprofilemodel(  error: error ?? _error,
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

/// image : "https://developmentalphawizz.com/bus_booking/assets/no-image.png"
/// image_sm : "https://developmentalphawizz.com/bus_booking/assets/no-image.png"
/// bank_pass : "https://developmentalphawizz.com/bus_booking/assets/no-image.png"

class Data {
  Data({
      String? image, 
      String? imageSm, 
      String? bankPass,}){
    _image = image;
    _imageSm = imageSm;
    _bankPass = bankPass;
}

  Data.fromJson(dynamic json) {
    _image = json['image'];
    _imageSm = json['image_sm'];
    _bankPass = json['bank_pass'];
  }
  String? _image;
  String? _imageSm;
  String? _bankPass;
Data copyWith({  String? image,
  String? imageSm,
  String? bankPass,
}) => Data(  image: image ?? _image,
  imageSm: imageSm ?? _imageSm,
  bankPass: bankPass ?? _bankPass,
);
  String? get image => _image;
  String? get imageSm => _imageSm;
  String? get bankPass => _bankPass;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['image'] = _image;
    map['image_sm'] = _imageSm;
    map['bank_pass'] = _bankPass;
    return map;
  }

}