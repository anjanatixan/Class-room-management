import 'package:class_room_management/helper/navigation.dart';
import 'package:class_room_management/helper/utils.dart';
import 'package:class_room_management/provider/registerationProvider.dart';
import 'package:class_room_management/provider/studentProvider.dart';
import 'package:class_room_management/provider/subjectProvider.dart';
import 'package:class_room_management/views/students/studentsList.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

import '../subjects/subjectsList.dart';

class NewRegisteration extends StatefulWidget {
  const NewRegisteration({super.key});

  @override
  State<NewRegisteration> createState() => _NewRegisterationState();
}

class _NewRegisterationState extends State<NewRegisteration> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0,
        leading: IconButton(
            onPressed: () {
              NavigationUtils.goBack(context);
            },
            icon: Icon(
              Icons.arrow_back_ios_new_rounded,
              color: Colors.black,
              size: 20.sp,
            )),
      ),
      body: ListView(
        children: [
          Text(
            "New Registeration",
            style: GoogleFonts.poppins(
              textStyle: TextStyle(
                fontSize: 16.sp,
                color: Colors.black,
                fontWeight: FontWeight.w600,
              ),
            ),
            textAlign: TextAlign.center,
          ),
          SizedBox(
            height: 20.h,
          ),
          Consumer<StudentProvider>(builder: (context, provider, child) {
            return Padding(
              padding: const EdgeInsets.all(14.0),
              child: InkWell(
                onTap: () {
                  NavigationUtils.goNext(
                      context,
                      StudentsList(
                        flag: false,
                      ));
                },
                child: Container(
                  height: 50.h,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(10.r),
                    color: Colors.grey.shade200,
                  ),
                  child: Padding(
                    padding: const EdgeInsets.all(10.0),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          provider.studentDetails.length == 0
                              ? "Select a student"
                              : provider.studentDetails[0]["name"].toString(),
                          style: GoogleFonts.poppins(
                            textStyle: TextStyle(
                              fontSize: 12.sp,
                              color: Colors.black,
                              fontWeight: FontWeight.w400,
                            ),
                          ),
                        ),
                        Icon(
                          Icons.arrow_forward_ios_rounded,
                          size: 18.sp,
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            );
          }),
          Consumer<SubjectProvider>(builder: (context, provider, child) {
            return Padding(
              padding: const EdgeInsets.symmetric(horizontal: 14, vertical: 10),
              child: InkWell(
                onTap: () {
                  NavigationUtils.goNext(
                      context,
                      SubjectsList(
                        flag: false,
                      ));
                },
                child: Container(
                  height: 50.h,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(10.r),
                    color: Colors.grey.shade200,
                  ),
                  child: Padding(
                    padding: const EdgeInsets.all(10.0),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          provider.subjectDetails.length == 0
                              ? "Select a subject"
                              : provider.subjectDetails[0]["name"].toString(),
                          style: GoogleFonts.poppins(
                            textStyle: TextStyle(
                              fontSize: 12.sp,
                              color: Colors.black,
                              fontWeight: FontWeight.w400,
                            ),
                          ),
                        ),
                        Icon(
                          Icons.arrow_forward_ios_rounded,
                          size: 18.sp,
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            );
          }),
          Padding(
            padding: const EdgeInsets.all(80.0),
            child: InkWell(
              onTap: () async {
                await getContext()
                    .read<RegistrationProvider>()
                    .newRegisteration();
              },
              child: Container(
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10.r),
                  color: Colors.green,
                ),
                child: Padding(
                  padding: const EdgeInsets.all(10.0),
                  child: Text(
                    "Register",
                    style: GoogleFonts.poppins(
                      textStyle: TextStyle(
                        fontSize: 10.sp,
                        color: Colors.white,
                        fontWeight: FontWeight.w400,
                      ),
                    ),
                    textAlign: TextAlign.center,
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
