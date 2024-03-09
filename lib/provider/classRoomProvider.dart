import 'package:class_room_management/helper/navigation.dart';
import 'package:class_room_management/helper/utils.dart';
import 'package:class_room_management/model/classroomsDetailsModel.dart';
import 'package:class_room_management/model/classroomsModel.dart';
import 'package:class_room_management/repo/classRoomsRepo.dart';
import 'package:flutter/material.dart';

class ClassRoomProvider with ChangeNotifier {
  ClassRoomsModel? classRoomsModel;
  ClassRoomsDetailsModel? classRoomsDetailsModel;
  ClassRoomRepo classRoomRepo = ClassRoomRepo();
  var roomId;
  var roomName;

  setRoomId(var id) {
    this.roomId = id;
  }
   setRoomname(var id) {
    this.roomName = id;
  }

  fetchClassRoomlist() async {
    showLoading(getContext());
    await classRoomRepo.getClassRoomList();
    NavigationUtils.goBack(getContext());
  }

  setClassRoomList(ClassRoomsModel model) {
    this.classRoomsModel = model;
    notifyListeners();
  }

  fetchClassRoomDetails() async {
    showLoading(getContext());
    await classRoomRepo.getClassRoomDetails();
    NavigationUtils.goBack(getContext());
  }

  setClassRoomDetails(ClassRoomsDetailsModel model) {
    this.classRoomsDetailsModel = model;
    notifyListeners();
  }


    updateRoom() async {
    showLoading(getContext());
    await classRoomRepo.updateClassRoom();
    NavigationUtils.goBack(getContext());
  }
}
