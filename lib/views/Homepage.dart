import 'package:class_room_management/helper/navigation.dart';
import 'package:class_room_management/helper/utils.dart';
import 'package:class_room_management/views/students/studentsList.dart';
import 'package:class_room_management/views/subjects/subjectsList.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';

import 'classRooms/ClassRooms.dart';
import 'register/register.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  bool isMenuClicked = false;

  void toggleMenu() {
    setState(() {
      isMenuClicked = !isMenuClicked;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ListView(
        children: [
          Padding(
            padding: const EdgeInsets.all(12.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Container(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        "Hello,",
                        style: GoogleFonts.poppins(
                            textStyle: TextStyle(
                                fontSize: 18.sp,
                                color: Colors.black,
                                fontWeight: FontWeight.w600)),
                      ),
                      Text(
                        "Good Morning",
                        style: GoogleFonts.poppins(
                            textStyle: TextStyle(
                                fontSize: 13.sp,
                                color: Colors.black,
                                fontWeight: FontWeight.w400)),
                      )
                    ],
                  ),
                ),
                IconButton(
                    onPressed: () {
                      toggleMenu();
                    },
                    icon: isMenuClicked == false
                        ? Icon(
                            Icons.menu,
                            size: 25.sp,
                          )
                        : Image.asset(
                            "assets/images/menu.jpg",
                            height: 18.h,
                          ))
              ],
            ),
          ),
          SizedBox(
            height: 20.h,
          ),
          isMenuClicked == false
              ? Column(
                  children: [
                    Padding(
                      padding: const EdgeInsets.all(20.0),
                      child: Row(
                        children: [
                          Expanded(
                            child: InkWell(
                              onTap: (){
                                NavigationUtils.goNext(context, StudentsList());
                              },
                              child: Container(
                                  height: 180.h,
                                  decoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(10.r),
                                      color: Color(0xffAAC9BF)),
                                  child: Column(
                                    crossAxisAlignment: CrossAxisAlignment.center,
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    children: [
                                      Image.asset("assets/images/student.png"),
                                      SizedBox(
                                        height: 10.h,
                                      ),
                                      Text(
                                        "Student",
                                        style: GoogleFonts.poppins(
                                            textStyle: TextStyle(
                                                fontSize: 12.sp,
                                                color: Colors.black,
                                                fontWeight: FontWeight.w500)),
                                      )
                                    ],
                                  )),
                            ),
                          ),
                          SizedBox(
                            width: 20.w,
                          ),
                          Expanded(
                            child: InkWell(
                              onTap: (){
                                NavigationUtils.goNext(context, SubjectsList());
                              },
                              child: Container(
                                  height: 180.h,
                                  decoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(10.r),
                                      color: Color(0xffD8EBFD)),
                                  child: Column(
                                    crossAxisAlignment: CrossAxisAlignment.center,
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    children: [
                                      Image.asset("assets/images/subjects.png"),
                                      SizedBox(
                                        height: 8.h,
                                      ),
                                      Text(
                                        "Subjects",
                                        style: GoogleFonts.poppins(
                                            textStyle: TextStyle(
                                                fontSize: 12.sp,
                                                color: Colors.black,
                                                fontWeight: FontWeight.w500)),
                                      )
                                    ],
                                  )),
                            ),
                          )
                        ],
                      ),
                    ),
                    SizedBox(
                      height: 5.h,
                    ),
                    Padding(
                      padding: const EdgeInsets.all(12.0),
                      child: Row(
                        children: [
                          Expanded(
                            child: InkWell(
                              onTap: (){
                                NavigationUtils.goNext(context, ClassRooms());
                              },
                              child: Container(
                                  height: 180.h,
                                  decoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(10.r),
                                      color: Color(0xffFFE0DD)),
                                  child: Column(
                                    crossAxisAlignment: CrossAxisAlignment.center,
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    children: [
                                      Icon(
                                        Icons.meeting_room,
                                        color: Colors.red,
                                        size: 35.sp,
                                      ),
                                      SizedBox(
                                        height: 5.h,
                                      ),
                                      Text(
                                        "Class Rooms",
                                        style: GoogleFonts.poppins(
                                            textStyle: TextStyle(
                                                fontSize: 12.sp,
                                                color: Colors.black,
                                                fontWeight: FontWeight.w400)),
                                      )
                                    ],
                                  )),
                            ),
                          ),
                          SizedBox(
                            width: 20.w,
                          ),
                          Expanded(
                            child: InkWell(
                              onTap: (){
                                NavigationUtils.goNext(context, Registeration());
                              },
                              child: Container(
                                  height: 180.h,
                                  decoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(10.r),
                                      color: Color(0xffFFF3D9)),
                                  child: Column(
                                    crossAxisAlignment: CrossAxisAlignment.center,
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    children: [
                                      Image.asset("assets/images/register.png"),
                                      SizedBox(
                                        height: 5.h,
                                      ),
                                      Text(
                                        "Register",
                                        style: GoogleFonts.poppins(
                                            textStyle: TextStyle(
                                                fontSize: 12.sp,
                                                color: Colors.black,
                                                fontWeight: FontWeight.w500)),
                                      )
                                    ],
                                  )),
                            ),
                          )
                        ],
                      ),
                    )
                  ],
                )
              : Padding(
                  padding: const EdgeInsets.all(12.0),
                  child: Column(
                    children: [
                      InkWell(
                        onTap: (){
                           NavigationUtils.goNext(context, StudentsList());
                        },
                        child: Container(
                          height: 40.h,
                          width: getWidth(context),
                          decoration: BoxDecoration(
                              color: Color(0xffAAC9BF),
                              borderRadius: BorderRadius.circular(10.r)),
                          child: Center(
                            child: Text(
                              "Student",
                              style: GoogleFonts.poppins(
                                  textStyle: TextStyle(
                                      fontSize: 12.sp,
                                      color: Colors.black,
                                      fontWeight: FontWeight.w500)),
                            ),
                          ),
                        ),
                      ),
                      SizedBox(
                        height: 20.h,
                      ),
                      InkWell(
                        onTap: (){
                           NavigationUtils.goNext(context, SubjectsList());
                        },
                        child: Container(
                          height: 40.h,
                          width: getWidth(context),
                          decoration: BoxDecoration(
                              color: Color(0xffD8EBFD),
                              borderRadius: BorderRadius.circular(10.r)),
                          child: Center(
                            child: Text(
                              "Subjects",
                              style: GoogleFonts.poppins(
                                  textStyle: TextStyle(
                                      fontSize: 12.sp,
                                      color: Colors.black,
                                      fontWeight: FontWeight.w500)),
                            ),
                          ),
                        ),
                      ),
                      SizedBox(
                        height: 20.h,
                      ),
                      InkWell(
                        onTap: (){
                          NavigationUtils.goNext(context, ClassRooms());
                        },
                        child: Container(
                          height: 40.h,
                          width: getWidth(context),
                          decoration: BoxDecoration(
                              color: Color(0xffFFE0DD),
                              borderRadius: BorderRadius.circular(10.r)),
                          child: Center(
                            child: Text(
                              "Class Rooms",
                              style: GoogleFonts.poppins(
                                  textStyle: TextStyle(
                                      fontSize: 12.sp,
                                      color: Colors.black,
                                      fontWeight: FontWeight.w500)),
                            ),
                          ),
                        ),
                      ),
                      SizedBox(
                        height: 20.h,
                      ),
                      InkWell(
                        onTap: (){
                           NavigationUtils.goNext(context, Registeration());
                        },
                        child: Container(
                          height: 40.h,
                          width: getWidth(context),
                          decoration: BoxDecoration(
                              color: Color(0xffFFF3D9),
                              borderRadius: BorderRadius.circular(10.r)),
                          child: Center(
                            child: Text(
                              "Register",
                              style: GoogleFonts.poppins(
                                  textStyle: TextStyle(
                                      fontSize: 12.sp,
                                      color: Colors.black,
                                      fontWeight: FontWeight.w500)),
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                )
        ],
      ),
    );
  }
}
