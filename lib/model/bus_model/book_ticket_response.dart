// To parse this JSON data, do
//
//     final bookTicketDataResponse = bookTicketDataResponseFromJson(jsonString);

import 'dart:convert';

BookTicketDataResponse bookTicketDataResponseFromJson(String str) => BookTicketDataResponse.fromJson(json.decode(str));

String bookTicketDataResponseToJson(BookTicketDataResponse data) => json.encode(data.toJson());

class BookTicketDataResponse {
  BookTicketDataResponse({
    this.status,
    this.data,
    this.message,
  });

  bool? status;
  Data? data;
  String? message;

  factory BookTicketDataResponse.fromJson(Map<String, dynamic> json) => BookTicketDataResponse(
    status: json["status"],
    data: Data.fromJson(json["data"]),
    message: json["message"],
  );

  Map<String, dynamic> toJson() => {
    "status": status,
    "data": data!.toJson(),
    "message": message,
  };
}

class Data {
  Data({
    this.userId,
    this.busId,
    this.transactionId,
    this.pickupAddress,
    this.dropAddress,
    this.amount,
    this.gstAmount,
    this.total,
    this.bookingDate,
    this.passangerDetails,
  });

  String? userId;
  String? busId;
  String? transactionId;
  String? pickupAddress;
  String? dropAddress;
  String? amount;
  String? gstAmount;
  String? total;
  String? bookingDate;
  PassangerDetails? passangerDetails;

  factory Data.fromJson(Map<String, dynamic> json) => Data(
    userId: json["user_id"],
    busId: json["bus_id"],
    transactionId: json["transaction_id"],
    pickupAddress: json["pickup_address"],
    dropAddress: json["drop_address"],
    amount: json["amount"],
    gstAmount: json["gst_amount"],
    total: json["total"],
    bookingDate: json["booking_date"],
    passangerDetails: PassangerDetails.fromJson(json["passanger_details"]),
  );

  Map<String, dynamic> toJson() => {
    "user_id": userId,
    "bus_id": busId,
    "transaction_id": transactionId,
    "pickup_address": pickupAddress,
    "drop_address": dropAddress,
    "amount": amount,
    "gst_amount": gstAmount,
    "total": total,
    "booking_date": bookingDate,
    "passanger_details": passangerDetails!.toJson(),
  };
}

class PassangerDetails {
  PassangerDetails({
    this.bookingId,
    this.name,
    this.gender,
    this.age,
    this.seatNo,
  });

  int? bookingId;
  String? name;
  String? gender;
  String? age;
  String? seatNo;

  factory PassangerDetails.fromJson(Map<String, dynamic> json) => PassangerDetails(
    bookingId: json["booking_id"],
    name: json["name"],
    gender: json["gender"],
    age: json["age"],
    seatNo: json["seat_no"],
  );

  Map<String, dynamic> toJson() => {
    "booking_id": bookingId,
    "name": name,
    "gender": gender,
    "age": age,
    "seat_no": seatNo,
  };
}
