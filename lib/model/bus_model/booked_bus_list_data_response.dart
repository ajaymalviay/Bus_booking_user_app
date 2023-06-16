// To parse this JSON data, do
//
//     final bookedListDataResponse = bookedListDataResponseFromJson(jsonString);

import 'dart:convert';

BookedListDataResponse bookedListDataResponseFromJson(String str) => BookedListDataResponse.fromJson(json.decode(str));

String bookedListDataResponseToJson(BookedListDataResponse data) => json.encode(data.toJson());

class BookedListDataResponse {
  BookedListDataResponse({
    this.status,
    this.data,
    this.message,
  });

  bool? status;
  List<BookedListData>? data;
  String? message;

  factory BookedListDataResponse.fromJson(Map<String, dynamic> json) => BookedListDataResponse(
    status: json["status"],
    data: List<BookedListData>.from(json["data"].map((x) => BookedListData.fromJson(x))),
    message: json["message"],
  );

  Map<String, dynamic> toJson() => {
    "status": status,
    "data": List<dynamic>.from(data!.map((x) => x.toJson())),
    "message": message,
  };
}

class BookedListData {
  BookedListData({
    this.id,
    this.userId,
    this.busId,
    this.transactionId,
    this.pickupAddress,
    this.gstAmount,
    this.total,
    this.dropAddress,
    this.amount,
    this.status,
    this.bookingDate,
    this.createdAt,
    this.updatedAt,
    this.fromCity,
    this.toCity,
    this.passengerDetails,
    this.type
  });

  String? id;
  String? type;
  String? userId;
  String? busId;
  String? transactionId;
  String? pickupAddress;
  String? gstAmount;
  String? total;
  String? dropAddress;
  String? amount;
  String? status;
  DateTime? bookingDate;
  DateTime? createdAt;
  DateTime? updatedAt;
  String? fromCity;
  String? toCity;
  List<PassengerDetail>? passengerDetails;

  factory BookedListData.fromJson(Map<String, dynamic> json) => BookedListData(
    id: json["id"],
    type: json["type"],
    userId: json["user_id"],
    busId: json["bus_id"],
    transactionId: json["transaction_id"],
    pickupAddress: json["pickup_address"],
    gstAmount: json["gst_amount"],
    total: json["total"],
    dropAddress: json["drop_address"],
    amount: json["amount"],
    status: json["status"],
    bookingDate: DateTime.parse(json["booking_date"]),
    createdAt: DateTime.parse(json["created_at"]),
    updatedAt: DateTime.parse(json["updated_at"]),
    fromCity: json["fromCity"],
    toCity: json["toCity"],
    passengerDetails: List<PassengerDetail>.from(json["passenger_details"].map((x) => PassengerDetail.fromJson(x))),
  );

  Map<String, dynamic> toJson() => {
    "id": id,
    "user_id": userId,
    "bus_id": busId,
    "transaction_id": transactionId,
    "pickup_address": pickupAddress,
    "gst_amount": gstAmount,
    "total": total,
    "drop_address": dropAddress,
    "amount": amount,
    "status": status,
    "booking_date": "${bookingDate!.year.toString().padLeft(4, '0')}-${bookingDate!.month.toString().padLeft(2, '0')}-${bookingDate!.day.toString().padLeft(2, '0')}",
    "created_at": createdAt!.toIso8601String(),
    "updated_at": updatedAt!.toIso8601String(),
    "fromCity": fromCity,
    "toCity": toCity,
    "passenger_details": List<dynamic>.from(passengerDetails!.map((x) => x.toJson())),
  };
}

class PassengerDetail {
  PassengerDetail({
    this.id,
    this.bookingId,
    this.name,
    this.gender,
    this.age,
    this.seatNo,
    this.createdAt,
    this.updatedAt,
  });

  String? id;
  String? bookingId;
  String? name;
  String? gender;
  String? age;
  String? seatNo;
  DateTime? createdAt;
  DateTime? updatedAt;

  factory PassengerDetail.fromJson(Map<String, dynamic> json) => PassengerDetail(
    id: json["id"],
    bookingId: json["booking_id"],
    name: json["name"],
    gender: json["gender"],
    age: json["age"],
    seatNo: json["seat_no"],
    createdAt: DateTime.parse(json["created_at"]),
    updatedAt: DateTime.parse(json["updated_at"]),
  );

  Map<String, dynamic> toJson() => {
    "id": id,
    "booking_id": bookingId,
    "name": name,
    "gender": gender,
    "age": age,
    "seat_no": seatNo,
    "created_at": createdAt!.toIso8601String(),
    "updated_at": updatedAt!.toIso8601String(),
  };
}
