import 'package:class_room_management/helper/navigation.dart';
import 'package:class_room_management/helper/utils.dart';
import 'package:class_room_management/provider/studentProvider.dart';
import 'package:class_room_management/provider/subjectProvider.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

import '../../provider/registerationProvider.dart';

class RegisterationDetails extends StatefulWidget {
  const RegisterationDetails({super.key});

  @override
  State<RegisterationDetails> createState() => _RegisterationDetailsState();
}

class _RegisterationDetailsState extends State<RegisterationDetails> {
  @override
  void initState() {
    Future.delayed(Duration(seconds: 0), () async {
      await getContext()
          .read<RegistrationProvider>()
          .fetchRegisterationDetails();
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      bottomNavigationBar: Padding(
        padding: const EdgeInsets.all(30.0),
        child: InkWell(
          onTap: () {
            showCupertinoDialog(
              context: context,
              builder: (BuildContext context) {
                return CupertinoAlertDialog(
                  title: Text('Delete'),
                  content: Text('Do you want to delete?'),
                  actions: <Widget>[
                    CupertinoDialogAction(
                      child: Text(
                        'No',
                        style: GoogleFonts.poppins(
                          textStyle: TextStyle(
                            fontSize: 10.sp,
                            color: Colors.blue,
                            fontWeight: FontWeight.w400,
                          ),
                        ),
                      ),
                      onPressed: () async {
                        Navigator.of(context).pop(false);
                      },
                    ),
                    CupertinoDialogAction(
                      child: Text(
                        'Yes',
                        style: GoogleFonts.poppins(
                          textStyle: TextStyle(
                            fontSize: 10.sp,
                            color: Colors.blue,
                            fontWeight: FontWeight.w400,
                          ),
                        ),
                      ),
                      onPressed: () async {
                        await getContext()
                            .read<RegistrationProvider>()
                            .deleteRegisteration();
                        Navigator.of(context)
                            .pop(true); // Return true when deleted
                      },
                      isDestructiveAction:
                          true, // Highlight the action as destructive
                    ),
                  ],
                );
              },
            );
          },
          child: Container(
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(10.r),
              color: Colors.red,
            ),
            child: Padding(
              padding: const EdgeInsets.all(10.0),
              child: Text(
                "Delete Registeration",
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
            "Registeration",
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
            height: 10.h,
          ),
          Consumer<StudentProvider>(builder: (context, provider, child) {
            return provider.studentDetails.length != 0
                ? Padding(
                    padding: const EdgeInsets.all(12.0),
                    child: Container(
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(10.r),
                          color: Colors.grey.shade200),
                      child: Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Container(
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  Text(
                                    "Student Details",
                                    style: GoogleFonts.poppins(
                                        textStyle: TextStyle(
                                            fontSize: 12.sp,
                                            color: Colors.black,
                                            fontWeight: FontWeight.w400)),
                                  ),
                                  Text(
                                    provider.studentDetails[0]["name"]
                                        .toString(),
                                    style: GoogleFonts.poppins(
                                        textStyle: TextStyle(
                                            fontSize: 10.sp,
                                            color: Colors.black,
                                            fontWeight: FontWeight.w400)),
                                  ),
                                  Text(
                                    provider.studentDetails[0]["email"]
                                        .toString(),
                                    style: GoogleFonts.poppins(
                                        textStyle: TextStyle(
                                            fontSize: 10.sp,
                                            color: Colors.black,
                                            fontWeight: FontWeight.w400)),
                                  )
                                ],
                              ),
                            ),
                            Text(
                              "Age: ${provider.studentDetails[0]["age"]}",
                              style: GoogleFonts.poppins(
                                  textStyle: TextStyle(
                                      fontSize: 12.sp,
                                      color: Colors.black,
                                      fontWeight: FontWeight.w500)),
                            )
                          ],
                        ),
                      ),
                    ),
                  )
                : Container();
          }),
           Consumer<SubjectProvider>(builder: (context, provider, child) {
              return provider.subjectDetails.length!=0?
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 5),
                child: Container(
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(10.r),
                      color: Colors.grey.shade200),
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Container(
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Text(
                                "Subject Details",
                                style: GoogleFonts.poppins(
                                    textStyle: TextStyle(
                                        fontSize: 12.sp,
                                        color: Colors.black,
                                        fontWeight: FontWeight.w400)),
                              ),
                              Text(
                                provider.subjectDetails[0]["name"].toString(),
                                style: GoogleFonts.poppins(
                                    textStyle: TextStyle(
                                        fontSize: 10.sp,
                                        color: Colors.black,
                                        fontWeight: FontWeight.w400)),
                              ),
                              Text(
                               provider.subjectDetails[0]["teacher"].toString(),
                                style: GoogleFonts.poppins(
                                    textStyle: TextStyle(
                                        fontSize: 10.sp,
                                        color: Colors.black,
                                        fontWeight: FontWeight.w400)),
                              )
                            ],
                          ),
                        ),
                        Text(
                          "Credit: ${provider.subjectDetails[0]["credits"].toString()}",
                          style: GoogleFonts.poppins(
                              textStyle: TextStyle(
                                  fontSize: 12.sp,
                                  color: Colors.black,
                                  fontWeight: FontWeight.w500)),
                        )
                      ],
                    ),
                  ),
                ),
              ):Container();
            }
          ),
        ],
      ),
    );
  }
}
