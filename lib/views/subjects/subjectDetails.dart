import 'package:class_room_management/helper/navigation.dart';
import 'package:class_room_management/helper/utils.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

import '../../provider/subjectProvider.dart';

class SubjectDetails extends StatefulWidget {
  const SubjectDetails({super.key});

  @override
  State<SubjectDetails> createState() => _SubjectDetailsState();
}

class _SubjectDetailsState extends State<SubjectDetails> {
  @override
  void initState() {
    Future.delayed(Duration(seconds: 0), () async {
      await getContext().read<SubjectProvider>().fetchSubjectDetails();
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
      body: Consumer<SubjectProvider>(
        builder: (context,provider,child) {
          return provider.subjectDetailstModel!=null?
          ListView(
            children: [
              Text(
                "Subject Detail",
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
                    backgroundImage: AssetImage("assets/images/subjectpic.png"),
                  ),
                  SizedBox(
                    height: 15.h,
                  ),
                  Text(
                    provider.subjectDetailstModel!.name,
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
                    provider.subjectDetailstModel!.teacher,
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
                    "credit :${provider.subjectDetailstModel!.credits}",
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
