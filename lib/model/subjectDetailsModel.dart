// To parse this JSON data, do
//
//     final subjecDetailsModel = subjecDetailsModelFromJson(jsonString);

import 'dart:convert';

SubjecDetailsModel subjecDetailsModelFromJson(String str) => SubjecDetailsModel.fromJson(json.decode(str));

String subjecDetailsModelToJson(SubjecDetailsModel data) => json.encode(data.toJson());

class SubjecDetailsModel {
    int credits;
    int id;
    String name;
    String teacher;

    SubjecDetailsModel({
        required this.credits,
        required this.id,
        required this.name,
        required this.teacher,
    });

    factory SubjecDetailsModel.fromJson(Map<String, dynamic> json) => SubjecDetailsModel(
        credits: json["credits"],
        id: json["id"],
        name: json["name"],
        teacher: json["teacher"],
    );

    Map<String, dynamic> toJson() => {
        "credits": credits,
        "id": id,
        "name": name,
        "teacher": teacher,
    };
}
