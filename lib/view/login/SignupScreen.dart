
import 'package:flutter/material.dart';
import 'package:flutter_exam/view/login/LoginScreen.dart';
import 'package:get/get.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class SignupScreen extends StatelessWidget {
  const SignupScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          children: [
            SizedBox(height: 200.h),
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 15.h),
              child: TextFormField(
           //     controller: loginController.textname,
                decoration: InputDecoration(
                  hintText: 'Enter your name',
                  prefixIcon: Icon(Icons.person, color: Colors.grey),
                  border: OutlineInputBorder(borderRadius: BorderRadius.circular(20.r)),
                ),
              ),
            ),
            SizedBox(height: 20.h),
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 15.h),
              child: TextFormField(
             //   controller: loginController.textemail,
                decoration: InputDecoration(
                  hintText: 'Enter your email Id',
                  prefixIcon: Icon(Icons.email, color: Colors.grey),
                  border: OutlineInputBorder(borderRadius: BorderRadius.circular(20.r)),
                ),
              ),
            ),
            SizedBox(height: 20.h),
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 15.h),
              child: TextFormField(
         //       controller: loginController.textpassword,
                obscureText: true,
                decoration: InputDecoration(
                  hintText: 'Enter your password',
                  prefixIcon: Icon(Icons.lock, color: Colors.grey),
                  border: OutlineInputBorder(borderRadius: BorderRadius.circular(20.r)),
                ),
              ),
            ),
            SizedBox(height: 20.h),
            Padding(
              padding:  EdgeInsets.only(left: 10.h,right: 10.h),
              child: GestureDetector(
                onTap: () async {
                      //        await loginController.signup(); // Call the signup function
                },
                child: Container(
                  height: 50.h,
                  decoration: BoxDecoration(color: Color(0xfff83758), borderRadius: BorderRadius.circular(20.r)),
                  child: Center(
                    child: Text('Sign Up', style: TextStyle(color: Colors.white, fontSize: 15.h)),
                  ),
                ),
              ),
            ),

            SizedBox(height: 20.h),
            Center(child: Text('Or', style: TextStyle(color: Colors.black, fontSize: 15.h))),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text("Already have an account?", style: TextStyle(color: Colors.grey)),
                TextButton(
                  onPressed: () {
                    Get.to(() => LoginScreen());
                  },
                  child: Text("Login", style: TextStyle(color: Color(0xfff83758))),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
