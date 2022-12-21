import 'dart:convert';

import 'package:get/get.dart';
import 'package:http/http.dart' as http;
import 'package:libman/app/modules/api/api.dart';

import '../login/controllers/login_controller.dart';

import '../signUp/controllers/sign_up_controller.dart';

class ConnectApi {
  LoginController authController = Get.put(LoginController());
  SignUpController signUp = Get.put(SignUpController());


  Future register() async {
    try {
      var url1 = Uri.parse(API.signUp);
      final responseRegister = await http.post(url1, body: {
        'NIS': signUp.nisC.text,
        'nama_siswa': signUp.namaC.text,
        'tingkatan': signUp.tingkatan.text,
        'kelas': signUp.kelas.text,
        'jenis_kelamin': signUp.jenisKelamin.text,
        'notelp': signUp.noTelp.text,
        'password': signUp.passwordC.text,
        'gambar': signUp.gambarSiswa.text,
      });
      print(responseRegister.body);
      var dataRegister = json.decode(responseRegister.body);
      if (dataRegister == "Success") {
        signUp.namaC.clear();
        signUp.nisC.clear();
        signUp.tingkatan.clear();
        signUp.kelas.clear();
        signUp.noTelp.clear();
        signUp.passwordC.clear();
        signUp.password2C.clear();
        Get.snackbar(
          "Success",
          "Register Success",
          duration: Duration(seconds: 1),
        );
        Get.toNamed('/login');
      } else {
        Get.snackbar(
          "Error",
          "NIS sudah terdaftar",
          duration: Duration(seconds: 1),
        );
      }
    } catch (e) {}
  }
}
