import 'package:flutter/material.dart';

import 'package:get/get.dart';

import '../controllers/login_controller.dart';

class LoginView extends GetView<LoginController> {
  @override
  Widget build(BuildContext context) {
    return login_();
  }
}

class login_ extends StatefulWidget {
  @override
  State<login_> createState() => _login_State();
}

class _login_State extends State<login_> {
  bool ishiddenpassword = true;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20),
      child: ListView(children: [
        SizedBox(
          height: MediaQuery.of(context).size.height * 0.10,
        ),
        Container(
          alignment: Alignment.center,
          child: Text(
            'Masuk',
            style: TextStyle(
                fontSize: 24,
                fontFamily: 'Mulish',
                fontWeight: FontWeight.bold,
                color: Colors.black),
          ),
        ),
        SizedBox(
          height: MediaQuery.of(context).size.height * 0.05,
        ),
        Container(
          alignment: Alignment.center,
          child: Text(
            'Masukan NIS dan Password ',
            style: TextStyle(
                fontSize: 14, fontFamily: 'Mulish', color: Color(0xFF8A8A8E)),
          ),
        ),
        Container(
          alignment: Alignment.center,
          child: Text(
            'untuk melanjutkan ke halaman berikutnya',
            style: TextStyle(
                fontSize: 14, fontFamily: 'Mulish', color: Color(0xFF8A8A8E)),
          ),
        ),
        SizedBox(
          height: MediaQuery.of(context).size.height * 0.05,
        ),
        Container(
          child: Text(
            'NIS',
            style: TextStyle(
                fontSize: 17, fontFamily: 'Mulish', color: Colors.black),
          ),
        ),
        SizedBox(
          height: MediaQuery.of(context).size.height * 0.005,
        ),
        Container(
            height: 51,
            width: 307,
            child: TextField(
              decoration: InputDecoration(
                border:
                    OutlineInputBorder(borderRadius: BorderRadius.circular(8)),
                hintText: "Masukan NIS anda ",
                hintStyle: TextStyle(
                  color: Colors.grey,
                ),
              ),
            )),
        SizedBox(
          height: MediaQuery.of(context).size.height * 0.020,
        ),
        Container(
          child: Text(
            'Password',
            style: TextStyle(
                fontSize: 17, fontFamily: 'Mulish', color: Colors.black),
          ),
        ),
        SizedBox(
          height: MediaQuery.of(context).size.height * 0.005,
        ),
        Container(
            height: 51,
            width: 307,
            child: TextField(
              obscureText: ishiddenpassword,
              decoration: InputDecoration(
                suffixIcon: InkWell(
                    onTap: togglePassword, child: Icon(Icons.visibility)),
                border:
                    OutlineInputBorder(borderRadius: BorderRadius.circular(8)),
                hintText: "Masukan Password anda ",
                hintStyle: TextStyle(
                  color: Colors.grey,
                ),
              ),
            )),
        SizedBox(
          height: MediaQuery.of(context).size.height * 0.05,
        ),
        ElevatedButton(
          onPressed: () {
            Get.toNamed('/home');
          },
          child: Text(
            "Masuk",
            style: TextStyle(fontFamily: 'Mulish', fontSize: 17),
          ),
          style: ElevatedButton.styleFrom(
            primary: Color(0xFF0041C4),
            fixedSize: Size(307, 52),
            shape:
                RoundedRectangleBorder(borderRadius: BorderRadius.circular(8)),
          ),
        ),
        SizedBox(
          height: MediaQuery.of(context).size.height * 0.010,
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              'Belum punya akun ?',
              style: TextStyle(
                  fontSize: 14, fontFamily: 'Mulish', color: Color(0xFF8A8A8E)),
            ),
            GestureDetector(
              onTap: () {
                Get.toNamed('/sign-up');
              },
              child: Text(
                ' Daftar',
                style: TextStyle(
                  fontSize: 14,
                  fontFamily: 'Mulish',
                  color: Color(0xFF1C76DE),
                ),
              ),
            )
          ],
        ),
      ]),
    ));
  }

  void togglePassword() {
    setState(() {
      ishiddenpassword = !ishiddenpassword;
    });
  }
}
