import 'package:class_room_management/provider/classRoomProvider.dart';
import 'package:class_room_management/provider/registerationProvider.dart';
import 'package:class_room_management/views/Homepage.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:provider/provider.dart';

import 'helper/navigation.dart';
import 'provider/studentProvider.dart';
import 'provider/subjectProvider.dart';

void main() {
  runApp(MultiProvider(
    providers: [
      ChangeNotifierProvider(create: ((context) => StudentProvider())),
      ChangeNotifierProvider(create: ((context) => SubjectProvider())),
      ChangeNotifierProvider(create: ((context) => ClassRoomProvider())),
      ChangeNotifierProvider(create: ((context) => RegistrationProvider()))
    ],
    child: MyApp(),
  ));
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    SystemChrome.setPreferredOrientations([
      DeviceOrientation.portraitUp,
      DeviceOrientation.portraitDown,
    ]);
    return ScreenUtilInit(
      useInheritedMediaQuery: true,
      designSize: const Size(360, 740),
      builder: (BuildContext context, Widget? child) {
        return MaterialApp(
            navigatorKey: NavigationService.navigatorKey,
            debugShowCheckedModeBanner: false,
            home: HomePage());
      },
    );
  }
}
