// To parse this JSON data, do
//
//     final registrationDetailsModel = registrationDetailsModelFromJson(jsonString);

import 'dart:convert';

RegistrationDetailsModel registrationDetailsModelFromJson(String str) => RegistrationDetailsModel.fromJson(json.decode(str));

String registrationDetailsModelToJson(RegistrationDetailsModel data) => json.encode(data.toJson());

class RegistrationDetailsModel {
    int id;
    int student;
    int subject;

    RegistrationDetailsModel({
        required this.id,
        required this.student,
        required this.subject,
    });

    factory RegistrationDetailsModel.fromJson(Map<String, dynamic> json) => RegistrationDetailsModel(
        id: json["id"],
        student: json["student"],
        subject: json["subject"],
    );

    Map<String, dynamic> toJson() => {
        "id": id,
        "student": student,
        "subject": subject,
    };
}
