// To parse this JSON data, do
//
//     final fromAndToLocationSarchResponse = fromAndToLocationSarchResponseFromJson(jsonString);

import 'dart:convert';

FromAndToLocationSarchResponse fromAndToLocationSarchResponseFromJson(String str) => FromAndToLocationSarchResponse.fromJson(json.decode(str));

String fromAndToLocationSarchResponseToJson(FromAndToLocationSarchResponse data) => json.encode(data.toJson());

class FromAndToLocationSarchResponse {
  FromAndToLocationSarchResponse({
    this.status,
    this.data,
    this.message,
  });

  bool? status;
  List<LocationSearchList>? data;
  String? message;

  factory FromAndToLocationSarchResponse.fromJson(Map<String, dynamic> json) => FromAndToLocationSarchResponse(
    status: json["status"],
    data: List<LocationSearchList>.from(json["data"].map((x) => LocationSearchList.fromJson(x))),
    message: json["message"],
  );

  Map<String, dynamic> toJson() => {
    "status": status,
    "data": List<dynamic>.from(data!.map((x) => x.toJson())),
    "message": message,
  };
}

class LocationSearchList {
  LocationSearchList({
    this.id,
    this.name,
    this.stateName,
  });

  String? id;
  String? name;
  String? stateName;

  factory LocationSearchList.fromJson(Map<String, dynamic> json) => LocationSearchList(
    id: json["id"],
    name: json["name"],
    stateName: json["state_name"],
  );

  Map<String, dynamic> toJson() => {
    "id": id,
    "name": name,
    "state_name": stateName,
  };
}
