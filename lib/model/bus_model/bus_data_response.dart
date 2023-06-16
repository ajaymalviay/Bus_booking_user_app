// To parse this JSON data, do
//
//     final busDataResponse = busDataResponseFromJson(jsonString);

import 'dart:convert';

BusDataResponse busDataResponseFromJson(String str) => BusDataResponse.fromJson(json.decode(str));

String busDataResponseToJson(BusDataResponse data) => json.encode(data.toJson());

class BusDataResponse {
  BusDataResponse({
    this.status,
    this.data,
    this.message,
  });

  bool? status;
  List<BusDataList>? data;
  String? message;

  factory BusDataResponse.fromJson(Map<String, dynamic> json) => BusDataResponse(
    status: json["status"],
    data: List<BusDataList>.from(json["data"].map((x) => BusDataList.fromJson(x))),
    message: json["message"],
  );

  Map<String, dynamic> toJson() => {
    "status": status,
    "data": List<BusDataList>.from(data!.map((x) => x.toJson())),
    "message": message,
  };
}

class BusDataList {
  BusDataList({
    this.id,
    this.name,
    this.busType,
    this.seatType,
    this.profileImage,
    this.noOfSeat,
    this.address,
    this.toAddress,
    this.startTime,
    this.endTime,
    this.vehicleNo,
    this.jsonData,
    this.createdAt,
    this.availableSeats,
    this.amount,
    this.type
  });

  String? id;
  String? name;
  String? busType;
  String? seatType;
  String? profileImage;
  String? noOfSeat;
  String? amount;
  String? type;

  String? address;
  String? toAddress;
  String? startTime;
  String? endTime;
  String? vehicleNo;
  String? jsonData;
  DateTime? createdAt;
  String? availableSeats;

  factory BusDataList.fromJson(Map<String, dynamic> json) => BusDataList(
    id: json["id"],
    amount: json["amount"],
    name: json["name"],
    type: json["type"],
    busType: json["bus_type"],
    seatType: json["seat_type"],
    profileImage: json["profile_image"],
    noOfSeat: json["no_of_seat"],
    address: json["address"],
    toAddress: json["to_address"],
    startTime: json["start_time"],
    endTime: json["end_time"],
    vehicleNo: json["vehicle_no"],
    jsonData: json["json_data"],
    createdAt: DateTime.parse(json["created_at"]),
    availableSeats: json["available_seats"],
  );

  Map<String, dynamic> toJson() => {
    "id": id,
    "name": name,
    "type": type,
    "bus_type": busType,
    "seat_type": seatType,
    "profile_image": profileImage,
    "no_of_seat": noOfSeat,
    "address": address,
    "to_address": toAddress,
    "start_time": startTime,
    "end_time": endTime,
    "vehicle_no": vehicleNo,
    "json_data": jsonData,
    "created_at": createdAt!.toIso8601String(),
    "available_seats": availableSeats,
  };
}
