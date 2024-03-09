// To parse this JSON data, do
//
//     final classRoomsModel = classRoomsModelFromJson(jsonString);

import 'dart:convert';

ClassRoomsModel classRoomsModelFromJson(String str) => ClassRoomsModel.fromJson(json.decode(str));

String classRoomsModelToJson(ClassRoomsModel data) => json.encode(data.toJson());

class ClassRoomsModel {
    List<Classroom> classrooms;

    ClassRoomsModel({
        required this.classrooms,
    });

    factory ClassRoomsModel.fromJson(Map<String, dynamic> json) => ClassRoomsModel(
        classrooms: List<Classroom>.from(json["classrooms"].map((x) => Classroom.fromJson(x))),
    );

    Map<String, dynamic> toJson() => {
        "classrooms": List<dynamic>.from(classrooms.map((x) => x.toJson())),
    };
}

class Classroom {
    int id;
    String layout;
    String name;
    int size;

    Classroom({
        required this.id,
        required this.layout,
        required this.name,
        required this.size,
    });

    factory Classroom.fromJson(Map<String, dynamic> json) => Classroom(
        id: json["id"],
        layout: json["layout"],
        name: json["name"],
        size: json["size"],
    );

    Map<String, dynamic> toJson() => {
        "id": id,
        "layout": layout,
        "name": name,
        "size": size,
    };
}
