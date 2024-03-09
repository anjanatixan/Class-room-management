import 'package:class_room_management/helper/navigation.dart';
import 'package:class_room_management/helper/utils.dart';
import 'package:class_room_management/provider/classRoomProvider.dart';
import 'package:class_room_management/provider/subjectProvider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

import 'addSubject.dart';
import 'updateSeat.dart';

class UpdateSubject extends StatefulWidget {
  const UpdateSubject({super.key});

  @override
  State<UpdateSubject> createState() => _UpdateSubjectState();
}

class _UpdateSubjectState extends State<UpdateSubject> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      bottomNavigationBar: Padding(
        padding: const EdgeInsets.all(20.0),
        child: InkWell(
          onTap: () async{
              await getContext().read<ClassRoomProvider>().updateRoom();
            NavigationUtils.goNextFinishAll(context, UpdateSeats());
          },
          child: Container(
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(2.r),
              color: Color(0xffAAC9BF),
            ),
            child: Padding(
              padding: const EdgeInsets.all(10.0),
              child: Text(
                "Subject Updated",
                style: GoogleFonts.poppins(
                  textStyle: TextStyle(
                    fontSize: 10.sp,
                    color: Colors.green,
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
          ),
        ),
      ),
      body: Column(
        children: [
          Consumer<ClassRoomProvider>(builder: (context, provider, child) {
            return Text(
              provider.roomName.toString(),
              style: GoogleFonts.poppins(
                textStyle: TextStyle(
                  fontSize: 15.sp,
                  color: Colors.black,
                  fontWeight: FontWeight.w500,
                ),
              ),
              textAlign: TextAlign.center,
            );
          }),
          SizedBox(
            height: 10.h,
          ),
          Consumer<SubjectProvider>(builder: (context, provider, child) {
            return Padding(
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
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text(
                            provider
                                .subjectListModel!
                                .subjects[
                                    getContext().read<SubjectProvider>().index]
                                .name,
                            style: GoogleFonts.poppins(
                                textStyle: TextStyle(
                                    fontSize: 12.sp,
                                    color: Colors.black,
                                    fontWeight: FontWeight.w400)),
                          ),
                          Text(
                            provider
                                .subjectListModel!
                                .subjects[
                                    getContext().read<SubjectProvider>().index]
                                .teacher,
                            style: GoogleFonts.poppins(
                                textStyle: TextStyle(
                                    fontSize: 10.sp,
                                    color: Colors.black,
                                    fontWeight: FontWeight.w400)),
                          )
                        ],
                      ),
                      InkWell(
                        onTap: () {
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
                              "Change",
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
            );
          }),
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
