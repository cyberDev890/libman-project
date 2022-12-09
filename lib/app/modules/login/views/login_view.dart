import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:libman/app/modules/api/connectedApi.dart';
import 'package:libman/app/modules/login/controllers/loginField.dart';
import '../controllers/login_controller.dart';

class LoginView extends GetView<LoginController> {
  LoginController authController = Get.put(LoginController());
  ConnectApi logindata = Get.put(ConnectApi());
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
        TFtextfield(
          label: 'NIS',
          hint: 'Masukan NIS',
          controller: authController.nisC,
        ),
        SizedBox(
          height: MediaQuery.of(context).size.height * 0.020,
        ),
        TftextfieldPassword(
          controller: authController.passwordC,
        ),
        SizedBox(
          height: MediaQuery.of(context).size.height * 0.05,
        ),
        ElevatedButton(
          onPressed: () {
            if (authController.nisC.text.isEmpty) {
              Get.snackbar("Error", "NIS tidak boleh kosong");
            } else if (authController.passwordC.text.isEmpty) {
              Get.snackbar("Error", "Password tidak boleh kosong");
            } else if (authController.nisC.text.isEmpty &&
                authController.passwordC.text.isEmpty) {
              Get.snackbar("Error", "NIS dan Password tidak boleh kosong");
            } else {
              logindata.loginData();
            }
          },
          child: Text(
            "Masuk",
            style: TextStyle(fontFamily: 'Mulish', fontSize: 17),
          ),
          style: ElevatedButton.styleFrom(
            backgroundColor: Color(0xFF0041C4),
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
}
