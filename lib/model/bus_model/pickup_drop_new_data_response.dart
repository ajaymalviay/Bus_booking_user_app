// To parse this JSON data, do
//
//     final pickupDropNewDataResponse = pickupDropNewDataResponseFromJson(jsonString);

import 'dart:convert';

BusSeatBookingNewDataResponse pickupDropNewDataResponseFromJson(String str) => BusSeatBookingNewDataResponse.fromJson(json.decode(str));

String pickupDropNewDataResponseToJson(BusSeatBookingNewDataResponse data) => json.encode(data.toJson());

class BusSeatBookingNewDataResponse {
  BusSeatBookingNewDataResponse({
    this.status,
    this.data,
    this.message,
  });

  bool? status;
  BusSeatBookingNewData? data;
  String? message;

  factory BusSeatBookingNewDataResponse.fromJson(Map<String, dynamic> json) => BusSeatBookingNewDataResponse(
    status: json["status"],
    data: BusSeatBookingNewData.fromJson(json["data"]),
    message: json["message"],
  );

  Map<String, dynamic> toJson() => {
    "status": status,
    "data": data!.toJson(),
    "message": message,
  };
}

class BusSeatBookingNewData {
  BusSeatBookingNewData({
    this.id,
    this.name,
    this.busType,
    this.seatType,
    this.profileImage,
    this.noOfSeat,
    this.amount,
    this.address,
    this.toAddress,
    this.startTime,
    this.endTime,
    this.vehicleNo,
    this.createdAt,
    this.seatDesign,
    this.availableSeats,
    this.fromAndToCity
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
  String? fromAndToCity;
  DateTime? createdAt;
  List<List<Seat>>? seatDesign;
  String? availableSeats;

  factory BusSeatBookingNewData.fromJson(Map<String, dynamic> json) => BusSeatBookingNewData(
    id: json["id"],
    fromAndToCity: json["json_data"],
    name: json["name"],
    busType: json["bus_type"],
    seatType: json["seat_type"],
    profileImage: json["profile_image"],
    noOfSeat: json["no_of_seat"],
    amount: json["amount"],
    address: json["address"],
    toAddress: json["to_address"],
    startTime: json["start_time"],
    endTime: json["end_time"],
    vehicleNo: json["vehicle_no"],
    createdAt: DateTime.parse(json["created_at"]),
    seatDesign: List<List<Seat>>.from(json["seat_design"].map((x) => List<Seat>.from(x.map((x) => Seat.fromJson(x))))),
    availableSeats: json["available_seats"],
  );

  Map<String, dynamic> toJson() => {
    "id": id,
    "json_data": fromAndToCity,
    "name": name,
    "bus_type": busType,
    "seat_type": seatType,
    "profile_image": profileImage,
    "no_of_seat": noOfSeat,
    "amount": amount,
    "address": address,
    "to_address": toAddress,
    "start_time": startTime,
    "end_time": endTime,
    "vehicle_no": vehicleNo,
    "created_at": createdAt!.toIso8601String(),
    "seat_design": List<dynamic>.from(seatDesign!.map((x) => List<dynamic>.from(x.map((x) => x.toJson())))),
    "available_seats": availableSeats,
  };
}

class Seat {
  Seat({
    this.id,
    this.isSelected,
    this.isBooked,
  });

  int? id;
  bool? isSelected;
  bool? isBooked;

  factory Seat.fromJson(Map<String, dynamic> json) => Seat(
    id: json["id"],
    isSelected: json["is_selected"],
    isBooked: false,
  );

  Map<String, dynamic> toJson() => {
    "id": id,
    "is_selected": isSelected,
  };
}
