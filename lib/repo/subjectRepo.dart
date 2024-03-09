import 'dart:convert';
import 'dart:developer';

import 'package:class_room_management/apiServices/urls.dart';
import 'package:class_room_management/apiServices/webService.dart';
import 'package:class_room_management/helper/utils.dart';
import 'package:class_room_management/model/subjectDetailsModel.dart';
import 'package:class_room_management/model/subjectListModel.dart';
import 'package:class_room_management/provider/subjectProvider.dart';
import 'package:provider/provider.dart';
import 'package:shared_preferences/shared_preferences.dart';

class SubjectRepo {
  ApiService _service = ApiService();

  Future<String> getSubjectList() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    var apiKey = prefs.getString("apiKey");
    Map<String, String> headers = {
      "Content-Type": "application/json",
    };

    final response = await _service.getResponse(
        Urls.SUBJECT_LIST + "api_key=${apiKey}", headers);

    if (response.statusCode == 200) {
      Map<String, dynamic> responseBody = jsonDecode(response.body);
      SubjectListModel model = SubjectListModel.fromJson(responseBody);
      getContext().read<SubjectProvider>().setSubjectList(model);
      log("message" + responseBody.toString());
    } else {}
    return "";
  }

  Future<String> getSubjectDetails() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    var apiKey = prefs.getString("apiKey");
    Map<String, String> headers = {
      "Content-Type": "application/json",
    };

    final response = await _service.getResponse(
        Urls.SUBJECT_DETAILS +
            getContext().read<SubjectProvider>().subjectId.toString() +
            "?api_key=${apiKey}",
        headers);

    if (response.statusCode == 200) {
      Map<String, dynamic> responseBody = jsonDecode(response.body);
      SubjecDetailsModel model = SubjecDetailsModel.fromJson(responseBody);
      getContext().read<SubjectProvider>().setSubjectDetails(model);
      log("message" + responseBody.toString());
    } else {}
    return "";
  }
}
