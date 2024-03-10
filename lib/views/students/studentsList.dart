import 'package:class_room_management/helper/navigation.dart';
import 'package:class_room_management/helper/utils.dart';
import 'package:class_room_management/provider/studentProvider.dart';
import 'package:class_room_management/views/students/studentDetails.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

import '../../provider/registerationProvider.dart';

class StudentsList extends StatefulWidget {
  final bool flag;
  const StudentsList({super.key, required this.flag});

  @override
  State<StudentsList> createState() => _StudentsListState();
}

class _StudentsListState extends State<StudentsList> {
  @override
  void initState() {
    Future.delayed(Duration(seconds: 0), () async {
      getContext().read<StudentProvider>().fetchStudentlist();
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
      body: ListView(
        children: [
          Text(
            "Students",
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
          Consumer<StudentProvider>(builder: (context, provider, child) {
            return provider.studentsListModel != null
                ? ListView.builder(
                    shrinkWrap: true,
                    itemCount: provider.studentsListModel!.students.length,
                    physics: NeverScrollableScrollPhysics(),
                    itemBuilder: ((context, index) {
                      return Padding(
                        padding: const EdgeInsets.symmetric(
                            horizontal: 12, vertical: 8),
                        child: InkWell(
                          onTap: () async {
                            if (widget.flag == true) {
                              await getContext()
                                  .read<StudentProvider>()
                                  .setStudentId(provider
                                      .studentsListModel!.students[index].id);
                              NavigationUtils.goNext(context, StudentDetails());
                            } else {
                              await getContext().read<RegistrationProvider>().setStudentId(provider
                                      .studentsListModel!.students[index].id);
                                 getContext().read<StudentProvider>().studentDetails.clear();
                                      await getContext().read<StudentProvider>().getDetailsByIDs(provider
                                      .studentsListModel!.students[index].id);
                              NavigationUtils.goBack(context);
                            }
                          },
                          child: Container(
                            height: 50.h,
                            decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(10.r),
                                color: Colors.grey.shade200),
                            child: Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  Container(
                                    child: Column(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      mainAxisAlignment:
                                          MainAxisAlignment.center,
                                      children: [
                                        Text(
                                          provider.studentsListModel!
                                              .students[index].name,
                                          style: GoogleFonts.poppins(
                                              textStyle: TextStyle(
                                                  fontSize: 12.sp,
                                                  color: Colors.black,
                                                  fontWeight: FontWeight.w400)),
                                        ),
                                        Text(
                                          provider.studentsListModel!
                                              .students[index].email,
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
                                    "Age: ${provider.studentsListModel!.students[index].age}",
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
                      );
                    }))
                : Container();
          })
        ],
      ),
    );
  }
}
