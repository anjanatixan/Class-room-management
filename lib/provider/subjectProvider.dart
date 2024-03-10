import 'package:class_room_management/helper/navigation.dart';
import 'package:class_room_management/helper/utils.dart';
import 'package:class_room_management/model/subjectDetailsModel.dart';
import 'package:class_room_management/model/subjectListModel.dart';
import 'package:class_room_management/repo/subjectRepo.dart';
import 'package:flutter/material.dart';

class SubjectProvider with ChangeNotifier {
  SubjectListModel? subjectListModel;
  SubjecDetailsModel? subjectDetailstModel;
  SubjectRepo subjectRepo = SubjectRepo();
  var subjectId;
  var index;
  List subjectlist = [];
  List<Map<String, String>> subjectDetails = [];


  setSubjectIndex(var index){
    this.index=index;
  }

  setSubjectId(var id) {
    this.subjectId = id;
  }

  fetchSubjectlist() async {
    showLoading(getContext());
    await subjectRepo.getSubjectList();
    NavigationUtils.goBack(getContext());
  }

  setSubjectList(SubjectListModel model) {
    this.subjectListModel = model;
    subjectlist=this.subjectListModel!.subjects;
    notifyListeners();
  }

  fetchSubjectDetails() async {
    showLoading(getContext());
    await subjectRepo.getSubjectDetails();
    NavigationUtils.goBack(getContext());
  }

  setSubjectDetails(SubjecDetailsModel model) {
    this.subjectDetailstModel = model;
    notifyListeners();
  }
  
   String getNameById(int id) {
    var matchingItems = subjectlist.where((item) => item.id == id);
    if (matchingItems.isNotEmpty) {
      return matchingItems.first.name;
    }
    notifyListeners();
    return "";
  }

  String getTeacherById(int id) {
    var matchingItems = subjectlist.where((item) => item.id == id);
    if (matchingItems.isNotEmpty) {
      return matchingItems.first.teacher;
    }

    return "";
  }

  String getCreditById(int id) {
    var matchingItems = subjectlist.where((item) => item.id == id);
    if (matchingItems.isNotEmpty) {
      return matchingItems.first.credits.toString();
    }
    notifyListeners();
    return "";
  }

  List<Map<String, String>> getDetailsByIDs(int id) {
    String name = getNameById(id);
    String teacher = getTeacherById(id);
    String credits = getCreditById(id);
    if (name.isNotEmpty && teacher.isNotEmpty) {
      subjectDetails.add({"name": name, "teacher": teacher,"credits":credits});
    }
    notifyListeners();
    return subjectDetails;
  }
}
