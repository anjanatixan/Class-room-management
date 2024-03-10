import 'package:class_room_management/helper/navigation.dart';
import 'package:class_room_management/helper/utils.dart';
import 'package:class_room_management/model/registerationDetailsModel.dart';
import 'package:class_room_management/model/registrationModel.dart';
import 'package:class_room_management/repo/registerationRepo.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'studentProvider.dart';
import 'subjectProvider.dart';

class RegistrationProvider with ChangeNotifier {
  RegistrationModel? registrationModel;
  RegistrationDetailsModel? registrationDetailsModel;
  RegisterationRepo registerationRepo = RegisterationRepo();
  var registerationId;
  var subjectId;
  var studentId;

  setRegisterationId(var id) {
    this.registerationId = id;
  }

  setSubjectId(var id) {
    this.subjectId = id;
  }

  setStudentId(var id) {
    this.studentId = id;
  }

  fetchRegisterationlist() async {
    showLoading(getContext());
    await registerationRepo.getRegisterationList();
    NavigationUtils.goBack(getContext());
  }

  setRegisterationList(RegistrationModel model) {
    this.registrationModel = model;
    notifyListeners();
  }

  fetchRegisterationDetails() async {
    showLoading(getContext());
    await registerationRepo.getRegisterationDetails();
    NavigationUtils.goBack(getContext());
  }

  setRegisterationDetails(RegistrationDetailsModel model) async {
    this.registrationDetailsModel = model;
    getContext().read<StudentProvider>().studentDetails.clear();
    await getContext()
        .read<StudentProvider>()
        .getDetailsByIDs(this.registrationDetailsModel!.student);
    getContext().read<SubjectProvider>().subjectDetails.clear();
    await getContext()
        .read<SubjectProvider>()
        .getDetailsByIDs(this.registrationDetailsModel!.subject);
    notifyListeners();
  }

  deleteRegisteration() async {
    showLoading(getContext());
    await registerationRepo.deleteRegisteration();
    NavigationUtils.goBack(getContext());
  }

  newRegisteration() async {
    showLoading(getContext());
    await registerationRepo.newRegisteration();
    NavigationUtils.goBack(getContext());
  }
}
