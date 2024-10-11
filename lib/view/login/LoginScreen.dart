import 'package:flutter/material.dart';
import 'package:flutter_exam/firebase/firebaseauth.dart';
import 'package:flutter_exam/view/home/HomeScreen.dart'; // Create this HomeScreen
import 'package:flutter_exam/view/login/SignupScreen.dart';
import 'package:get/get.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:google_sign_in/google_sign_in.dart';

class LoginScreen extends StatelessWidget {
  const LoginScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final FirebaseAuth _auth = FirebaseAuth.instance;
    final TextEditingController emailController = TextEditingController();
    final TextEditingController passwordController = TextEditingController();
    final AuthService _authService = AuthService();

    Future<void> _login() async {
      try {
        UserCredential userCredential = await _auth.signInWithEmailAndPassword(
          email: emailController.text.trim(),
          password: passwordController.text.trim(),
        );
        Get.off(() => HomePage()); // Navigate to HomeScreen
      } on FirebaseAuthException catch (e) {
        String message = 'Error occurred';
        if (e.code == 'user-not-found') {
          message = 'No user found for that email.';
        } else if (e.code == 'wrong-password') {
          message = 'Wrong password provided for that user.';
        }
        Get.snackbar('Error', message);
      }
    }

    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          children: [
            SizedBox(height: 250.h),
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 15.h),
              child: TextFormField(
                controller: emailController,
                decoration: InputDecoration(
                  hintText: 'Email Id',
                  prefixIcon: Icon(Icons.email, color: Colors.grey),
                  border: OutlineInputBorder(borderRadius: BorderRadius.circular(20.r)),
                ),
              ),
            ),
            SizedBox(height: 20.h),
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 15.h),
              child: TextFormField(
                controller: passwordController,
                obscureText: true,
                decoration: InputDecoration(
                  hintText: 'Password',
                  prefixIcon: Icon(Icons.lock, color: Colors.grey),
                  border: OutlineInputBorder(borderRadius: BorderRadius.circular(20.r)),
                ),
              ),
            ),
            Padding(
              padding: EdgeInsets.only(top: 8.h, left: 200.h),
              child: Text('Forget Password?', style: TextStyle(color: Colors.black, fontSize: 10.h)),
            ),
            SizedBox(height: 20.h),
            Padding(
              padding: EdgeInsets.only(left: 10.h, right: 10.h),
              child: GestureDetector(
                onTap: _login,
                child: Container(
                  height: 50.h,
                  decoration: BoxDecoration(color: Color(0xfff83758), borderRadius: BorderRadius.circular(20.r)),
                  child: Center(
                    child: Text('Log In', style: TextStyle(color: Colors.white, fontSize: 15.h)),
                  ),
                ),
              ),
            ),
            SizedBox(height: 20.h),
            Center(child: Text('Or', style: TextStyle(color: Colors.black, fontSize: 15.h))),
            SizedBox(height: 10.h),
            GestureDetector(
              onTap: () async {
                await _authService.signInWithGoogle();
                Get.to(() => HomePage()); // Navigate to HomeScreen
              },
              child: Container(
                height: 50.h,
                margin: EdgeInsets.symmetric(horizontal: 20.h),
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(20.r),
                  border: Border.all(color: Colors.grey),
                ),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Image.asset('assets/logogoogle.png', height: 30.h, width: 30.h),
                    SizedBox(width: 10.w),
                    Text('Sign In with Google', style: TextStyle(color: Colors.black, fontSize: 15.h)),
                  ],
                ),
              ),
            ),
            SizedBox(height: 20.h),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text("Don't have an account?", style: TextStyle(color: Colors.grey)),
                TextButton(
                  onPressed: () {
                    Get.to(() => SignupScreen());
                  },
                  child: Text("Sign Up", style: TextStyle(color: Color(0xfff83758))),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
