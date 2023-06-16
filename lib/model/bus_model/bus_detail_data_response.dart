// To parse this JSON data, do
//
//     final busDetailDataResponse = busDetailDataResponseFromJson(jsonString);

import 'dart:convert';

BusDetailDataResponse busDetailDataResponseFromJson(String str) => BusDetailDataResponse.fromJson(json.decode(str));

String busDetailDataResponseToJson(BusDetailDataResponse data) => json.encode(data.toJson());

class BusDetailDataResponse {
  BusDetailDataResponse({
    this.status,
    this.data,
    this.message,
  });

  bool? status;
  BusDetailData? data;
  String? message;

  factory BusDetailDataResponse.fromJson(Map<String, dynamic> json) => BusDetailDataResponse(
    status: json["status"],
    data: BusDetailData.fromJson(json["data"]),
    message: json["message"],
  );

  Map<String, dynamic> toJson() => {
    "status": status,
    "data": data!.toJson(),
    "message": message,
  };
}

class BusDetailData {
  BusDetailData({
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
    this.createdAt,
    this.seatDesign,
    this.availableSeats,
    this.amount
  });

  String? id;
  String? name;
  String? busType;
  String? seatType;
  String? profileImage;
  String? noOfSeat;
  String? amount;
  String? address;
  String? toAddress;
  String? startTime;
  String? endTime;
  String? vehicleNo;
  DateTime? createdAt;
  List<SeatDesign>? seatDesign;
  String? availableSeats;

  factory BusDetailData.fromJson(Map<String, dynamic> json) => BusDetailData(
    id: json["id"],
    amount: json["amount"],
    name: json["name"],
    busType: json["bus_type"],
    seatType: json["seat_type"],
    profileImage: json["profile_image"],
    noOfSeat: json["no_of_seat"],
    address: json["address"],
    toAddress: json["to_address"],
    startTime: json["start_time"],
    endTime: json["end_time"],
    vehicleNo: json["vehicle_no"],
    createdAt: DateTime.parse(json["created_at"]),
    seatDesign: List<SeatDesign>.from(json["seat_design"].map((x) => SeatDesign.fromJson(x))),
    availableSeats: json["available_seats"],
  );

  Map<String, dynamic> toJson() => {
    "id": id,
    "amount": amount,
    "name": name,
    "bus_type": busType,
    "seat_type": seatType,
    "profile_image": profileImage,
    "no_of_seat": noOfSeat,
    "address": address,
    "to_address": toAddress,
    "start_time": startTime,
    "end_time": endTime,
    "vehicle_no": vehicleNo,
    "created_at": createdAt!.toIso8601String(),
    "seat_design": List<dynamic>.from(seatDesign!.map((x) => x.toJson())),
    "available_seats": availableSeats,
  };
}

class SeatDesign {
  SeatDesign({
    this.id,
    this.isSelected,
    this.isBooked
  });

  int? id;
  bool? isSelected;
  bool? isBooked;

  factory SeatDesign.fromJson(Map<String, dynamic> json) => SeatDesign(
    id: json["id"],
    isSelected: json["is_selected"],
    isBooked: false,
  );

  Map<String, dynamic> toJson() => {
    "id": id,
    "is_selected": isSelected,
  };
}
