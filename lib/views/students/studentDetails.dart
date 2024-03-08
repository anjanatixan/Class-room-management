import 'package:class_room_management/helper/navigation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';

class StudentDetails extends StatefulWidget {
  const StudentDetails({super.key});

  @override
  State<StudentDetails> createState() => _StudentDetailsState();
}

class _StudentDetailsState extends State<StudentDetails> {
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
            "Student Detail",
            style: GoogleFonts.poppins(
                textStyle: TextStyle(
                    fontSize: 16.sp,
                    color: Colors.black,
                    fontWeight: FontWeight.w700)),
            textAlign: TextAlign.center,
          ),
          SizedBox(
            height: 10.h,
          ),
          Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              SizedBox(
                height: 100.h,
              ),
              CircleAvatar(
                radius: 50.r,
              ),
              SizedBox(
                height: 15.h,
              ),
              Text(
                "Students",
                style: GoogleFonts.poppins(
                    textStyle: TextStyle(
                        fontSize: 13.sp,
                        color: Colors.black,
                        fontWeight: FontWeight.w400)),
              ),
              SizedBox(
                height: 2.h,
              ),
              Text(
                "Age : 22",
                style: GoogleFonts.poppins(
                    textStyle: TextStyle(
                        fontSize: 11.sp,
                        color: Colors.black,
                        fontWeight: FontWeight.w400)),
              ),
              SizedBox(
                height: 2.h,
              ),
              Text(
                "as@mail.com",
                style: GoogleFonts.poppins(
                    textStyle: TextStyle(
                        fontSize: 11.sp,
                        color: Colors.black,
                        fontWeight: FontWeight.w400)),
              )
            ],
          )
        ],
      ),
    );
  }
}
