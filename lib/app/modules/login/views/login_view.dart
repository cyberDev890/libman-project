import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:libman/app/modules/api/connectedApi.dart';
import 'package:libman/app/modules/login/controllers/loginField.dart';
import 'package:shared_preferences/shared_preferences.dart';
import '../../api/api.dart';
import '../../home/views/home_view.dart';
import '../../models/model_test.dart';
import '../controllers/login_controller.dart';
import 'package:http/http.dart' as http;

class LoginView extends GetView<LoginController> {
  @override
  Widget build(BuildContext context) {
    return login();
  }
}

class login extends StatefulWidget {
  const login({super.key});

  @override
  State<login> createState() => _loginState();
}

enum loginstatus { notSignIn, signIn }

class _loginState extends State<login> {
  LoginController authController = Get.put(LoginController());
  ConnectApi logindata = Get.put(ConnectApi());
  loginstatus _loginstatus = loginstatus.notSignIn;

  Future loginData() async {
    var url = Uri.parse(API.signIn);
    var responseLogin = await http.post(url, body: {
      'NIS': authController.nisC.text.toString(),
      'password': authController.passwordC.text,
    });
    UserData userData = UserData.fromMap(jsonDecode(responseLogin.body));
    Map<String, dynamic> map = jsonDecode(responseLogin.body);
    String status = map['status'];

    if (status == "Success") {
      String nama = userData.data![0].namaSiswa;
      String nis = userData.data![0].nis;
      String telp = userData.data![0].notelp;
      String tingkatan = userData.data![0].tingkatan;
      String gambar;
      if (userData.data![0].gambar != null) {
        gambar = userData.data![0].gambar;
      } else {
        gambar = 'uploads/image_picker755427705143972387.png';
      }
      setState(() {
        _loginstatus = loginstatus.signIn;
        CircularProgressIndicator();
        savpref(status, nama, nis, gambar, telp, tingkatan);
      });
      authController.nisC.clear();
      authController.passwordC.clear();
      Get.snackbar(
        "Success",
        "Login Success",
        duration: Duration(seconds: 1),
      );
    } else {
      Get.snackbar(
        "Error",
        "Masukkan NIS dan Password yang benar",
        duration: Duration(seconds: 1),
      );
    }
  }

  savpref(String status, String username, String nis, String gambar,
      String telp, String tingkatan) async {
    print('dipanggil');
    SharedPreferences pref = await SharedPreferences.getInstance();
    setState(() {
      pref.setString('status', status);
      pref.setString('nama_siswa', username);
      pref.setString('NIS', nis);
      pref.setString('gambar', gambar);
      pref.setString('notelp', telp);
      pref.setString('tingkatan', tingkatan);
    });
  }

  var status;
  getPref() async {
    SharedPreferences pref = await SharedPreferences.getInstance();
    setState(() {
      status = pref.getString('status');
      _loginstatus =
          status == 'Success' ? loginstatus.signIn : loginstatus.notSignIn;
    });
  }

  signOut() async {
    SharedPreferences pref = await SharedPreferences.getInstance();
    setState(() {
      pref.setString("status", null.toString());
      _loginstatus = loginstatus.notSignIn;
    });
  }

  @override
  void initState() {
    getPref();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    switch (_loginstatus) {
      case loginstatus.notSignIn:
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
                    fontSize: 14,
                    fontFamily: 'Mulish',
                    color: Color(0xFF8A8A8E)),
              ),
            ),
            Container(
              alignment: Alignment.center,
              child: Text(
                'untuk melanjutkan ke halaman berikutnya',
                style: TextStyle(
                    fontSize: 14,
                    fontFamily: 'Mulish',
                    color: Color(0xFF8A8A8E)),
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
                  loginData();
                }
              },
              child: Text(
                "Masuk",
                style: TextStyle(fontFamily: 'Mulish', fontSize: 17),
              ),
              style: ElevatedButton.styleFrom(
                backgroundColor: Color(0xFF0041C4),
                fixedSize: Size(307, 52),
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(8)),
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
                      fontSize: 14,
                      fontFamily: 'Mulish',
                      color: Color(0xFF8A8A8E)),
                ),
                GestureDetector(
                  onTap: () {
                    authController.nisC.clear();
                    authController.passwordC.clear();
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
      case loginstatus.signIn:
        return HomeView(signOut: signOut);
    }
  }
}
