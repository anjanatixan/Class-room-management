import 'package:class_room_management/helper/navigation.dart';
import 'package:class_room_management/provider/registerationProvider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

import '../../helper/utils.dart';
import '../../provider/subjectProvider.dart';
import 'subjectDetails.dart';

class SubjectsList extends StatefulWidget {
  final bool flag;
  const SubjectsList({super.key, required this.flag});

  @override
  State<SubjectsList> createState() => _SubjectsListState();
}

class _SubjectsListState extends State<SubjectsList> {
  @override
  void initState() {
    Future.delayed(Duration(seconds: 0), () async {
      await getContext().read<SubjectProvider>().fetchSubjectlist();
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
            "Subjects",
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
          Consumer<SubjectProvider>(builder: (context, provider, child) {
            return provider.subjectListModel != null
                ? ListView.builder(
                    shrinkWrap: true,
                    itemCount: provider.subjectListModel!.subjects.length,
                    physics: NeverScrollableScrollPhysics(),
                    itemBuilder: ((context, index) {
                      return Padding(
                        padding: const EdgeInsets.symmetric(
                            horizontal: 12, vertical: 8),
                        child: InkWell(
                          onTap: () async {
                            if (widget.flag == true) {
                              await getContext()
                                  .read<SubjectProvider>()
                                  .setSubjectId(provider
                                      .subjectListModel!.subjects[index].id);
                              NavigationUtils.goNext(context, SubjectDetails());
                            } else {
                              await getContext().read<RegistrationProvider>().setSubjectId(provider
                                      .subjectListModel!.subjects[index].id);
                                      getContext().read<SubjectProvider>().subjectDetails.clear();
                                      await getContext().read<SubjectProvider>().getDetailsByIDs(provider
                                      .subjectListModel!.subjects[index].id);
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
                                          provider.subjectListModel!
                                              .subjects[index].name,
                                          style: GoogleFonts.poppins(
                                              textStyle: TextStyle(
                                                  fontSize: 12.sp,
                                                  color: Colors.black,
                                                  fontWeight: FontWeight.w400)),
                                        ),
                                        Text(
                                          provider.subjectListModel!
                                              .subjects[index].teacher,
                                          style: GoogleFonts.poppins(
                                              textStyle: TextStyle(
                                                  fontSize: 10.sp,
                                                  color: Colors.black,
                                                  fontWeight: FontWeight.w400)),
                                        )
                                      ],
                                    ),
                                  ),
                                  Container(
                                    child: Column(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.center,
                                      mainAxisAlignment:
                                          MainAxisAlignment.center,
                                      children: [
                                        Text(
                                          provider.subjectListModel!
                                              .subjects[index].credits
                                              .toString(),
                                          style: GoogleFonts.poppins(
                                              textStyle: TextStyle(
                                                  fontSize: 12.sp,
                                                  color: Colors.black,
                                                  fontWeight: FontWeight.w400)),
                                        ),
                                        Text(
                                          "Credits",
                                          style: GoogleFonts.poppins(
                                              textStyle: TextStyle(
                                                  fontSize: 10.sp,
                                                  color: Colors.black,
                                                  fontWeight: FontWeight.w400)),
                                        )
                                      ],
                                    ),
                                  ),
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
