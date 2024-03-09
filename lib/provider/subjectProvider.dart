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
}
