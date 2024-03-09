// To parse this JSON data, do
//
//     final classRoomsDetailsModel = classRoomsDetailsModelFromJson(jsonString);

import 'dart:convert';

ClassRoomsDetailsModel classRoomsDetailsModelFromJson(String str) => ClassRoomsDetailsModel.fromJson(json.decode(str));

String classRoomsDetailsModelToJson(ClassRoomsDetailsModel data) => json.encode(data.toJson());

class ClassRoomsDetailsModel {
    int id;
    String layout;
    String name;
    int size;
    String subject;

    ClassRoomsDetailsModel({
        required this.id,
        required this.layout,
        required this.name,
        required this.size,
        required this.subject,
    });

    factory ClassRoomsDetailsModel.fromJson(Map<String, dynamic> json) => ClassRoomsDetailsModel(
        id: json["id"],
        layout: json["layout"],
        name: json["name"],
        size: json["size"],
        subject: json["subject"],
    );

    Map<String, dynamic> toJson() => {
        "id": id,
        "layout": layout,
        "name": name,
        "size": size,
        "subject": subject,
    };
}
