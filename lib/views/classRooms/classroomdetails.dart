import 'package:class_room_management/helper/navigation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';

import 'addSubject.dart';

class ClassRoomDetails extends StatefulWidget {
  const ClassRoomDetails({Key? key}) : super(key: key);

  @override
  State<ClassRoomDetails> createState() => _ClassRoomDetailsState();
}

class _ClassRoomDetailsState extends State<ClassRoomDetails> {
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
          ),
        ),
      ),
      body: Column(
        children: [
          Text(
            "Class Rooms",
            style: GoogleFonts.poppins(
              textStyle: TextStyle(
                fontSize: 16.sp,
                color: Colors.black,
                fontWeight: FontWeight.w700,
              ),
            ),
            textAlign: TextAlign.center,
          ),
          SizedBox(
            height: 10.h,
          ),
          Padding(
            padding: const EdgeInsets.all(14.0),
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
                      "Add subject",
                      style: GoogleFonts.poppins(
                        textStyle: TextStyle(
                          fontSize: 12.sp,
                          color: Colors.black,
                          fontWeight: FontWeight.w400,
                        ),
                      ),
                    ),
                    InkWell(
                      onTap: (){
                        NavigationUtils.goNext(context, AddSubject());
                      },
                      child: Container(
                        width: 60.w,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(10.r),
                          color: Colors.green.shade300,
                        ),
                        child: Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Text(
                            "Add",
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
                  ],
                ),
              ),
            ),
          ),
           SizedBox(
            height: 40.h,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
             
              Expanded(
                child: Column(
                  children: List.generate(8, (index) {
                    return Padding(
                      padding: const EdgeInsets.all(10.0),
                      child: Image.asset("assets/images/leftChair.jpg"),
                    ); 
                  }),
                ),
              ),
              
              Expanded(
                flex: 1,
                child: Container(
                  color: Colors.grey.shade200,
                  height: 350.h, // Adjust the height as needed
                  alignment: Alignment.center,
                  
                ),
              ),
              // Icons on the right side
              Expanded(
                child: Column(
                  children: List.generate(8, (index) {
                    return Padding(
                      padding: const EdgeInsets.all(10.0),
                      child: Image.asset("assets/images/rightChair.jpg"),
                    ); // Example icon
                  }),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
