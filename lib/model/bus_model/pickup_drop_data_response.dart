// To parse this JSON data, do
//
//     final pickupDropDataResponse = pickupDropDataResponseFromJson(jsonString);

import 'dart:convert';

PickupDropDataResponse pickupDropDataResponseFromJson(String str) => PickupDropDataResponse.fromJson(json.decode(str));

String pickupDropDataResponseToJson(PickupDropDataResponse data) => json.encode(data.toJson());

class PickupDropDataResponse {
  PickupDropDataResponse({
    this.status,
    this.data,
    this.message,
  });

  bool? status;
  PickupDropData? data;
  String? message;

  factory PickupDropDataResponse.fromJson(Map<String, dynamic> json) => PickupDropDataResponse(
    status: json["status"],
    data: PickupDropData.fromJson(json["data"]),
    message: json["message"],
  );

  Map<String, dynamic> toJson() => {
    "status": status,
    "data": data!.toJson(),
    "message": message,
  };
}

class PickupDropData {
  PickupDropData({
    this.pickupPoints,
    this.dropPoints,
  });

  List<PPoint>? pickupPoints;
  List<DPoint>? dropPoints;

  factory PickupDropData.fromJson(Map<String, dynamic> json) => PickupDropData(
    pickupPoints: List<PPoint>.from(json["pickup_points"].map((x) => PPoint.fromJson(x))),
    dropPoints: List<DPoint>.from(json["drop_points"].map((x) => DPoint.fromJson(x))),
  );

  Map<String, dynamic> toJson() => {
    "pickup_points": List<dynamic>.from(pickupPoints!.map((x) => x.toJson())),
    "drop_points": List<dynamic>.from(dropPoints!.map((x) => x.toJson())),
  };
}

class PPoint {
  PPoint({
    this.title,
    this.time,
  });

  String? title;
  String? time;

  factory PPoint.fromJson(Map<String, dynamic> json) => PPoint(
    title: json["title"],
    time: json["time"],
  );

  Map<String, dynamic> toJson() => {
    "title": title,
    "time": time,
  };
}

class DPoint {
  DPoint({
    this.title,
    this.time,
  });

  String? title;
  String? time;

  factory DPoint.fromJson(Map<String, dynamic> json) => DPoint(
    title: json["title"],
    time: json["time"],
  );

  Map<String, dynamic> toJson() => {
    "title": title,
    "time": time,
  };
}
