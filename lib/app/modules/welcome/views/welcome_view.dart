import 'package:flutter/material.dart';

import 'package:get/get.dart';

import '../controllers/welcome_controller.dart';

class WelcomeView extends GetView<WelcomeController> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          children: [
            Container(
              margin: const EdgeInsets.all(10),
              padding: EdgeInsets.only(top: 50, bottom: 50),
              alignment: Alignment.topLeft,
              child: Text(
                'Back',
                style: TextStyle(
                    fontSize: 17,
                    fontFamily: 'Mulish',
                    color: Color(0xFF0B48BB)),
              ),
            ),
            SizedBox(
              height: MediaQuery.of(context).size.height * 0.1,
            ),
            Container(
              child: Image(image: AssetImage('image/logo2.png')),
            ),
            SizedBox(height: MediaQuery.of(context).size.height * 0.15),
            Container(
              child: Text('Selamat Datang, Budi!',
                  style: TextStyle(
                      fontSize: 24,
                      fontFamily: 'Mulish',
                      fontWeight: FontWeight.bold,
                      color: Colors.black)),
            ),
            SizedBox(height: MediaQuery.of(context).size.height * 0.004),
            Container(
              alignment: Alignment.center,
              child: Text(
                'Akun anda berhasil dibuat',
                style: TextStyle(
                    fontSize: 14,
                    fontFamily: 'Mulish',
                    color: Color(0xFF8A8A8E)),
              ),
            ),
            Container(
              alignment: Alignment.center,
              child: Text(
                'ayo pelajari lebih jauh penggunaan aplikasi ini!',
                style: TextStyle(
                    fontSize: 14,
                    fontFamily: 'Mulish',
                    color: Color(0xFF8A8A8E)),
              ),
            ),
            SizedBox(height: MediaQuery.of(context).size.height * 0.15),
            ElevatedButton(
              onPressed: () {
                Get.snackbar("test", "test",
                    snackPosition: SnackPosition.TOP,
                    animationDuration: Duration(seconds: 1));
              },
              child: Text(
                "Masuk",
                style: TextStyle(fontFamily: 'Mulish', fontSize: 17),
              ),
              style: ElevatedButton.styleFrom(
                primary: Color(0xFF0041C4),
                fixedSize: Size(307, 52),
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(8)),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
