import 'dart:convert';
import 'dart:developer';
import 'package:class_room_management/apiServices/urls.dart';
import 'package:class_room_management/apiServices/webService.dart';
import 'package:class_room_management/helper/utils.dart';
import 'package:class_room_management/model/studentDetailsModel.dart';
import 'package:class_room_management/model/studntsListModel.dart';
import 'package:class_room_management/provider/studentProvider.dart';
import 'package:provider/provider.dart';
import 'package:shared_preferences/shared_preferences.dart';

class StudentRepo {
  ApiService _service = ApiService();

  Future<String> getStudentsList() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    var apiKey = prefs.getString("apiKey");
    Map<String, String> headers = {
      "Content-Type": "application/json",
    };

    final response = await _service.getResponse(
        Urls.STUDENT_LIST + "api_key=${apiKey}", headers);

    if (response.statusCode == 200) {
      Map<String, dynamic> responseBody = jsonDecode(response.body);
      StudentsListModel model = StudentsListModel.fromJson(responseBody);
      getContext().read<StudentProvider>().setStudentsList(model);
      log("message" + responseBody.toString());
    } else {}
    return "";
  }

  Future<String> getStudentDetails() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    var apiKey = prefs.getString("apiKey");
    Map<String, String> headers = {
      "Content-Type": "application/json",
    };

    final response = await _service.getResponse(
        Urls.STUDENT_DETAILS +
            getContext().read<StudentProvider>().studentId.toString() +
            "?api_key=${apiKey}",
        headers);

    if (response.statusCode == 200) {
      Map<String, dynamic> responseBody = jsonDecode(response.body);
      StudentDetailstModel model = StudentDetailstModel.fromJson(responseBody);
      getContext().read<StudentProvider>().setStudentsDetails(model);
      log("message" + responseBody.toString());
    } else {}
    return "";
  }
}
