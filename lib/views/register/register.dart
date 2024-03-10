import 'package:class_room_management/helper/navigation.dart';
import 'package:class_room_management/helper/utils.dart';
import 'package:class_room_management/provider/registerationProvider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

import 'newRegisteration.dart';
import 'registerationDetails.dart';

class Registeration extends StatefulWidget {
  const Registeration({super.key});

  @override
  State<Registeration> createState() => _RegisterationState();
}

class _RegisterationState extends State<Registeration> {
  @override
  void initState() {
    Future.delayed(Duration(seconds: 0), () async {
      await getContext().read<RegistrationProvider>().fetchRegisterationlist();
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
            NavigationUtils.goNext(context, NewRegisteration());
          },
          child: Container(
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(10.r),
              color: Color.fromARGB(255, 219, 231, 245),
            ),
            child: Padding(
              padding: const EdgeInsets.all(10.0),
              child: Text(
                "New Registeration",
                style: GoogleFonts.poppins(
                  textStyle: TextStyle(
                    fontSize: 10.sp,
                    color: Color(0xff007AFF),
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
                fontWeight: FontWeight.w700,
              ),
            ),
            textAlign: TextAlign.center,
          ),
          SizedBox(
            height: 10.h,
          ),
          Consumer<RegistrationProvider>(builder: (context, provider, child) {
            return provider.registrationModel != null
                ? provider.registrationModel!.registrations.length != 0
                    ? ListView.builder(
                        itemCount:
                            provider.registrationModel!.registrations.length,
                        shrinkWrap: true,
                        itemBuilder: (context, index) {
                          return Padding(
                            padding: const EdgeInsets.symmetric(
                                horizontal: 12, vertical: 8),
                            child: InkWell(
                              onTap: () async {
                                await getContext()
                                    .read<RegistrationProvider>()
                                    .setRegisterationId(provider
                                        .registrationModel!
                                        .registrations[index]
                                        .id);
                                NavigationUtils.goNext(
                                    context, RegisterationDetails());
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
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceBetween,
                                    children: [
                                      Text(
                                        "Registeration id: #${provider.registrationModel!.registrations[index].id}",
                                        style: GoogleFonts.poppins(
                                          textStyle: TextStyle(
                                            fontSize: 12.sp,
                                            color: Colors.black,
                                            fontWeight: FontWeight.w400,
                                          ),
                                        ),
                                      ),
                                      InkWell(
                                          onTap: () {
                                            NavigationUtils.goNext(context,
                                                RegisterationDetails());
                                          },
                                          child: Icon(
                                            Icons.arrow_forward_ios_rounded,
                                            size: 18.sp,
                                          )),
                                    ],
                                  ),
                                ),
                              ),
                            ),
                          );
                        })
                    : Container(
                        height: 300.h,
                        child: Center(
                          child: Text("No data",
                              style: GoogleFonts.poppins(
                                textStyle: TextStyle(
                                  fontSize: 12.sp,
                                  color: Colors.black,
                                  fontWeight: FontWeight.w400,
                                ),
                              )),
                        ),
                      )
                : Container();
          })
        ],
      ),
    );
  }
}
