import 'package:class_room_management/helper/navigation.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';

class RegisterationDetails extends StatefulWidget {
  const RegisterationDetails({super.key});

  @override
  State<RegisterationDetails> createState() => _RegisterationDetailsState();
}

class _RegisterationDetailsState extends State<RegisterationDetails> {
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
                return 
           CupertinoAlertDialog(
      title: Text('Delete'),
      content: Text('Do you want to delete?'),
      actions: <Widget>[
        CupertinoDialogAction(
          child: Text('No',style: GoogleFonts.poppins(
                  textStyle: TextStyle(
                    fontSize: 10.sp,
                    color: Colors.blue,
                    fontWeight: FontWeight.w400,
                  ),
                ),),
          onPressed: () {
            Navigator.of(context).pop(false); // Return false when canceled
          },
        ),
        CupertinoDialogAction(
          child: Text('Yes',style: GoogleFonts.poppins(
                  textStyle: TextStyle(
                    fontSize: 10.sp,
                    color: Colors.blue,
                    fontWeight: FontWeight.w400,
                  ),
                ),),
          onPressed: () {
            Navigator.of(context).pop(true); // Return true when deleted
          },
          isDestructiveAction: true, // Highlight the action as destructive
        ),
      ],
    );
          },
        );},
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
          Padding(
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
                            "Students",
                            style: GoogleFonts.poppins(
                                textStyle: TextStyle(
                                    fontSize: 12.sp,
                                    color: Colors.black,
                                    fontWeight: FontWeight.w400)),
                          ),
                          Text(
                            "Students",
                            style: GoogleFonts.poppins(
                                textStyle: TextStyle(
                                    fontSize: 10.sp,
                                    color: Colors.black,
                                    fontWeight: FontWeight.w400)),
                          ),
                          Text(
                            "Students",
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
                      "Age: 22",
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
          ),
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
                            "Students",
                            style: GoogleFonts.poppins(
                                textStyle: TextStyle(
                                    fontSize: 12.sp,
                                    color: Colors.black,
                                    fontWeight: FontWeight.w400)),
                          ),
                          Text(
                            "Students",
                            style: GoogleFonts.poppins(
                                textStyle: TextStyle(
                                    fontSize: 10.sp,
                                    color: Colors.black,
                                    fontWeight: FontWeight.w400)),
                          ),
                          Text(
                            "Students",
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
                      "Credit: 22",
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
          ),
        ],
      ),
    );
  }
}
