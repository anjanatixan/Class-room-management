import 'dart:convert';
import 'dart:developer';

import 'package:class_room_management/apiServices/urls.dart';
import 'package:class_room_management/apiServices/webService.dart';
import 'package:class_room_management/helper/utils.dart';
import 'package:class_room_management/model/classroomsDetailsModel.dart';
import 'package:class_room_management/model/classroomsModel.dart';
import 'package:class_room_management/provider/classRoomProvider.dart';
import 'package:class_room_management/provider/subjectProvider.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:shared_preferences/shared_preferences.dart';

class ClassRoomRepo {
  ApiService _service = ApiService();

  Future<String> getClassRoomList() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    var apiKey = prefs.getString("apiKey");
    Map<String, String> headers = {
      "Content-Type": "application/json",
    };

    final response = await _service.getResponse(
        Urls.CLASSROOM_LIST + "api_key=${apiKey}", headers);

    if (response.statusCode == 200) {
      Map<String, dynamic> responseBody = jsonDecode(response.body);
      ClassRoomsModel model = ClassRoomsModel.fromJson(responseBody);
      getContext().read<ClassRoomProvider>().setClassRoomList(model);
      log("message" + responseBody.toString());
    } else {}
    return "";
  }

  Future<String> getClassRoomDetails() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    var apiKey = prefs.getString("apiKey");
    Map<String, String> headers = {
      "Content-Type": "application/json",
    };

    final response = await _service.getResponse(
        Urls.CLASSROOM_DETAILS +
            getContext().read<ClassRoomProvider>().roomId.toString() +
            "?api_key=${apiKey}",
        headers);

    if (response.statusCode == 200) {
      Map<String, dynamic> responseBody = jsonDecode(response.body);
      ClassRoomsDetailsModel model =
          ClassRoomsDetailsModel.fromJson(responseBody);
      getContext().read<ClassRoomProvider>().setClassRoomDetails(model);
      log("message" + responseBody.toString());
    } else {}
    return "";
  }

  Future<String> updateClassRoom() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    var apiKey = prefs.getString("apiKey");
   
var body = {
      "subject": getContext().read<SubjectProvider>().subjectId.toString(),
    };
    final response = await _service.patchResponse(
        Urls.CLASSROOM_DETAILS +
            getContext().read<ClassRoomProvider>().roomId.toString() +
            "?api_key=${apiKey}",
        body);

    if (response.statusCode == 200) {
      Map<String, dynamic> responseBody = jsonDecode(response.body);
     
     showToast(getContext(), "Subject Updated", Colors.green, Colors.white);
      log("message" + responseBody.toString());
    } else {}
    return "";
  }
}
