// To parse this JSON data, do
//
//     final studentDetailstModel = studentDetailstModelFromJson(jsonString);

import 'dart:convert';

StudentDetailstModel studentDetailstModelFromJson(String str) => StudentDetailstModel.fromJson(json.decode(str));

String studentDetailstModelToJson(StudentDetailstModel data) => json.encode(data.toJson());

class StudentDetailstModel {
    int age;
    String email;
    int id;
    String name;

    StudentDetailstModel({
        required this.age,
        required this.email,
        required this.id,
        required this.name,
    });

    factory StudentDetailstModel.fromJson(Map<String, dynamic> json) => StudentDetailstModel(
        age: json["age"],
        email: json["email"],
        id: json["id"],
        name: json["name"],
    );

    Map<String, dynamic> toJson() => {
        "age": age,
        "email": email,
        "id": id,
        "name": name,
    };
}
