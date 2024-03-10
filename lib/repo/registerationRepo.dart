import 'dart:convert';
import 'dart:developer';

import 'package:class_room_management/apiServices/urls.dart';
import 'package:class_room_management/apiServices/webService.dart';
import 'package:class_room_management/helper/navigation.dart';
import 'package:class_room_management/model/registerationDetailsModel.dart';
import 'package:class_room_management/model/registrationModel.dart';
import 'package:class_room_management/provider/registerationProvider.dart';
import 'package:provider/provider.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../helper/utils.dart';

class RegisterationRepo {
  ApiService _service = ApiService();

  Future<String> getRegisterationList() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    var apiKey = prefs.getString("apiKey");
    Map<String, String> headers = {
      "Content-Type": "application/json",
    };

    final response = await _service.getResponse(
        Urls.REGISTERATION_LIST + "api_key=${apiKey}", headers);

    if (response.statusCode == 200) {
      Map<String, dynamic> responseBody = jsonDecode(response.body);
      RegistrationModel model = RegistrationModel.fromJson(responseBody);
      getContext().read<RegistrationProvider>().setRegisterationList(model);
      log("message" + responseBody.toString());
    } else {}
    return "";
  }

  Future<String> getRegisterationDetails() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    var apiKey = prefs.getString("apiKey");
    Map<String, String> headers = {
      "Content-Type": "application/json",
    };

    final response = await _service.getResponse(
        Urls.REGISTRATION_DETAILS +
            getContext()
                .read<RegistrationProvider>()
                .registerationId
                .toString() +
            "?api_key=${apiKey}",
        headers);

    if (response.statusCode == 200) {
      Map<String, dynamic> responseBody = jsonDecode(response.body);
      RegistrationDetailsModel model =
          RegistrationDetailsModel.fromJson(responseBody);
      getContext().read<RegistrationProvider>().setRegisterationDetails(model);
      log("message" + responseBody.toString());
    } else {}
    return "";
  }

  Future<String> deleteRegisteration() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    var apiKey = prefs.getString("apiKey");
    Map<String, String> headers = {
      "Content-Type": "application/json",
    };

    final response = await _service.deleteResponse(
        Urls.REGISTRATION_DETAILS +
            getContext()
                .read<RegistrationProvider>()
                .registerationId
                .toString() +
            "?api_key=${apiKey}",
        headers);

    if (response.statusCode == 200) {
      Map<String, dynamic> responseBody = jsonDecode(response.body);
      await getContext().read<RegistrationProvider>().fetchRegisterationlist();
      NavigationUtils.goBack(getContext());
      log("message" + responseBody.toString());
    } else {}
    return "";
  }

  Future<String> newRegisteration() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    var apiKey = prefs.getString("apiKey");

    var body = {
      "student": getContext().read<RegistrationProvider>().studentId.toString(),
      "subject": getContext().read<RegistrationProvider>().subjectId.toString(),
    };
    final response = await _service.PostResponse(
        Urls.REGISTERATION_LIST + "api_key=${apiKey}", body);
    
    if (response.statusCode == 200) {
      Map<String, dynamic> responseBody = jsonDecode(response.body);
      await getContext().read<RegistrationProvider>().fetchRegisterationlist();
      NavigationUtils.goBack(getContext());
      log("message" + responseBody.toString());
    } else {}
    return "";
  }
}
