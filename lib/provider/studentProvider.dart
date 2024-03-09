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

  setStudentId(var id){
    this.studentId=id;
  }

   fetchStudentlist() async {
    showLoading(getContext());
    await studentRepo.getStudentsList();
    NavigationUtils.goBack(getContext());
  }
    setStudentsList(StudentsListModel model) {
    this.studentsListModel = model;
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
}
