import 'package:class_room_management/helper/navigation.dart';
import 'package:class_room_management/helper/utils.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

import '../../provider/studentProvider.dart';

class StudentDetails extends StatefulWidget {
  const StudentDetails({super.key});

  @override
  State<StudentDetails> createState() => _StudentDetailsState();
}

class _StudentDetailsState extends State<StudentDetails> {
  @override
  void initState() {
    Future.delayed(Duration(seconds: 0), () async {
      await getContext().read<StudentProvider>().fetchStudentDetails();
    });
    super.initState();
  }

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
      body: Consumer<StudentProvider>(
        builder: (context,provider,child) {
          return provider.studentDetailstModel!=null?
          ListView(
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
                    radius: 50.r,backgroundColor: Colors.white,
                    backgroundImage: AssetImage("assets/images/studentpic.png"),
                  ),
                  SizedBox(
                    height: 15.h,
                  ),
                  Text(
                    provider.studentDetailstModel!.name.toString(),
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
                    "Age : ${provider.studentDetailstModel!.age}",
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
                    provider.studentDetailstModel!.email,
                    style: GoogleFonts.poppins(
                        textStyle: TextStyle(
                            fontSize: 11.sp,
                            color: Colors.black,
                            fontWeight: FontWeight.w400)),
                  )
                ],
              )
            ],
          ):Container();
        }
      ),
    );
  }
}
