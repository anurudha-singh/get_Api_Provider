// To parse this JSON data, do
//
//     final userModel = userModelFromJson(jsonString);

import 'dart:convert';

List<UserModel> userModelFromJson(String str) => List<UserModel>.from(json.decode(str).map((x) => UserModel.fromJson(x)));

String userModelToJson(List<UserModel> data) => json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class UserModel {
  UserModel({
    required this.id,
    required this.roleName,
    required this.description,
  });

  int id;
  String roleName;
  String description;

  factory UserModel.fromJson(Map<String, dynamic> json) =>
      UserModel(
        id: json["id"],
        roleName: json["roleName"],
        description: json["description"],
      );

  Map<String, dynamic> toJson() =>
      {
        "id": id,
        "roleName": roleName,
        "description": description,
      };
}