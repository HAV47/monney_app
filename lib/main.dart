import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:monneyapp/constants/dimentions/theme_color.dart';
import 'package:monneyapp/routes.dart';
import 'package:monneyapp/screen/login_register/welcome_screen.dart';
import 'package:monneyapp/screen/otp/profile_setup.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
      designSize: const Size(360, 690),
      minTextAdapt: true,
      splitScreenMode: true,
      builder: (_, child) {
        return MaterialApp(
          debugShowCheckedModeBanner: false,
          title: 'First Method',
          theme: ThemeData(
            scaffoldBackgroundColor: ThemeColor.white,
            colorScheme: ColorScheme.fromSeed(seedColor: ThemeColor.white),
          ),
          // routes: routes,
          onGenerateRoute: Routes.generateRoute,
          home: const WelcomeScreen(),
        );
      },
    );
  }
}







