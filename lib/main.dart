import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_exam/view/splash/SplashScreen.dart';
import 'package:get/get.dart'; // Optional if you're using GetX
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'view/login/LoginScreen.dart'; // Adjust based on your file structure

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  await Firebase.initializeApp();

  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
      builder: (context, child) {

        return GetMaterialApp(
          debugShowCheckedModeBanner: false,
          home: SplashScreen(),
        );
      },
    );
  }
}
