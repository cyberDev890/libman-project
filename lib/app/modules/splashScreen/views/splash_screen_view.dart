import 'dart:async';

import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:libman/app/modules/login/views/login_view.dart';

import '../controllers/splash_screen_controller.dart';

class SplashScreenView extends GetView<SplashScreenController> {
  @override
  Widget build(BuildContext context) {
    return splashScreen();
  }
}

class splashScreen extends StatefulWidget {
  const splashScreen({super.key});

  @override
  State<splashScreen> createState() => _splashScreenState();
}

class _splashScreenState extends State<splashScreen> {
  fungsion() {
    var duration = Duration(seconds: 3);
    return Timer(duration, () {
      Get.offAll(LoginView());
    });
  }

  @override
  void initState() {
    fungsion();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xFF0041C4),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Container(
              child: Image(image: AssetImage('image/logo.png')),
            ),
            SizedBox(
              height: 20,
            ),
            Container(
              child: RichText(
                text: TextSpan(
                  children: [
                    TextSpan(
                      text: "Libman School",
                      style: TextStyle(
                        fontSize: 36,
                        fontFamily: 'Mulish',
                        fontWeight: FontWeight.bold,
                        color: Colors.white,
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
