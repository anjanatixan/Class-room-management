import 'package:class_room_management/helper/navigation.dart';
import 'package:class_room_management/helper/utils.dart';
import 'package:class_room_management/model/studntsListModel.dart';
import 'package:class_room_management/repo/studentRepo.dart';
import 'package:flutter/material.dart';

import '../model/studentDetailsModel.dart';

class StudentProvider with ChangeNotifier {
  StudentsListModel? studentsListModel;
  StudentDetailstModel? studentDetailstModel;
  StudentRepo studentRepo = StudentRepo();
  var studentId;
  List studentlist = [];
  List<Map<String, String>> studentDetails = [];

  setStudentId(var id) {
    this.studentId = id;
  }

  fetchStudentlist() async {
    showLoading(getContext());
    await studentRepo.getStudentsList();
    NavigationUtils.goBack(getContext());
  }

  setStudentsList(StudentsListModel model) {
    this.studentsListModel = model;
    studentlist = this.studentsListModel!.students;
    notifyListeners();
  }

  fetchStudentDetails() async {
    showLoading(getContext());
    await studentRepo.getStudentDetails();
    NavigationUtils.goBack(getContext());
  }

  setStudentsDetails(StudentDetailstModel model) {
    this.studentDetailstModel = model;
    notifyListeners();
  }

  String getNameById(int id) {
    var matchingItems = studentlist.where((item) => item.id == id);
    if (matchingItems.isNotEmpty) {
      return matchingItems.first.name;
    }
    notifyListeners();
    return "";
  }

  String getEmailById(int id) {
    var matchingItems = studentlist.where((item) => item.id == id);
    if (matchingItems.isNotEmpty) {
      return matchingItems.first.email;
    }

    return "";
  }

  String getAgeById(int id) {
    var matchingItems = studentlist.where((item) => item.id == id);
    if (matchingItems.isNotEmpty) {
      return matchingItems.first.age.toString();
    }

    return "";
  }

  List<Map<String, String>> getDetailsByIDs(int id) {
    String name = getNameById(id);
    String email = getEmailById(id);
    String age = getAgeById(id);
    if (name.isNotEmpty && email.isNotEmpty && age.isNotEmpty) {
      studentDetails.add({"name": name, "email": email, "age": age});
    }
    notifyListeners();
    return studentDetails;
  }
}
