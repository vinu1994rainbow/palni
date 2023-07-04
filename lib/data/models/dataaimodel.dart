// To parse this JSON data, do
//
//     final dataApiModel = dataApiModelFromJson(jsonString);

import 'dart:convert';

List<DataApiModel> dataApiModelFromJson(String str) => List<DataApiModel>.from(json.decode(str).map((x) => DataApiModel.fromJson(x)));
class DataApiModel {
  String name;
  List<DataApiModel> childlayers;
  DataApiModel({
    required this.name,
    required this.childlayers,

  });
  factory DataApiModel.fromJson(Map<String, dynamic> json) => DataApiModel(
    name: json["name"],

    childlayers: List<DataApiModel>.from(json["childlayers"].map((x) => DataApiModel.fromJson(x))),

  );

  Map<String, dynamic> toJson() => {
    "name": name,
    "childlayers": List<DataApiModel>.from(childlayers.map((x) => x.toJson())),
  };
}
