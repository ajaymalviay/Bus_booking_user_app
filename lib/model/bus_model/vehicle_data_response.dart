// To parse this JSON data, do
//
//     final vehicleDataResponse = vehicleDataResponseFromJson(jsonString);

import 'dart:convert';

VehicleDataResponse vehicleDataResponseFromJson(String str) => VehicleDataResponse.fromJson(json.decode(str));

String vehicleDataResponseToJson(VehicleDataResponse data) => json.encode(data.toJson());

class VehicleDataResponse {
  bool? status;
  VehicleData? data;
  String? message;

  VehicleDataResponse({
    this.status,
    this.data,
    this.message,
  });

  factory VehicleDataResponse.fromJson(Map<String, dynamic> json) => VehicleDataResponse(
    status: json["status"],
    data: VehicleData.fromJson(json["data"]),
    message: json["message"],
  );

  Map<String, dynamic> toJson() => {
    "status": status,
    "data": data!.toJson(),
    "message": message,
  };
}

class VehicleData {
  String? id;
  String? name;
  String? busType;
  String? seatType;
  String? type;
  String? profileImage;
  String? noOfSeat;
  String? amount;
  String? status;
  String? address;
  String? toAddress;
  String? startTime;
  String? endTime;
  String? vehicleNo;
  String? jsonData;
  DateTime? createdAt;
  List<VehicleSeatDesign>? seatDesign;
  String? availableSeats;

  VehicleData({
    this.id,
    this.name,
    this.busType,
    this.seatType,
    this.type,
    this.profileImage,
    this.noOfSeat,
    this.amount,
    this.status,
    this.address,
    this.toAddress,
    this.startTime,
    this.endTime,
    this.vehicleNo,
    this.jsonData,
    this.createdAt,
    this.seatDesign,
    this.availableSeats,
  });

  factory VehicleData.fromJson(Map<String, dynamic> json) => VehicleData(
    id: json["id"],
    name: json["name"],
    busType: json["bus_type"],
    seatType: json["seat_type"],
    type: json["type"],
    profileImage: json["profile_image"],
    noOfSeat: json["no_of_seat"],
    amount: json["amount"],
    status: json["status"],
    address: json["address"],
    toAddress: json["to_address"],
    startTime: json["start_time"],
    endTime: json["end_time"],
    vehicleNo: json["vehicle_no"],
    jsonData: json["json_data"],
    createdAt: DateTime.parse(json["created_at"]),
    seatDesign: List<VehicleSeatDesign>.from(json["seat_design"].map((x) => VehicleSeatDesign.fromJson(x))),
    availableSeats: json["available_seats"],
  );

  Map<String, dynamic> toJson() => {
    "id": id,
    "name": name,
    "bus_type": busType,
    "seat_type": seatType,
    "type": type,
    "profile_image": profileImage,
    "no_of_seat": noOfSeat,
    "amount": amount,
    "status": status,
    "address": address,
    "to_address": toAddress,
    "start_time": startTime,
    "end_time": endTime,
    "vehicle_no": vehicleNo,
    "json_data": jsonData,
    "created_at": createdAt!.toIso8601String(),
    "seat_design": List<dynamic>.from(seatDesign!.map((x) => x.toJson())),
    "available_seats": availableSeats,
  };
}

class VehicleSeatDesign {
  int? id;
  bool? isSelected;
  bool? isBooked;

  VehicleSeatDesign({
    this.id,
    this.isSelected,
    this.isBooked
  });

  factory VehicleSeatDesign.fromJson(Map<String, dynamic> json) => VehicleSeatDesign(
    id: json["id"],
    isSelected: json["is_selected"],
    isBooked: false,
  );

  Map<String, dynamic> toJson() => {
    "id": id,
    "is_selected": isSelected,
  };
}
