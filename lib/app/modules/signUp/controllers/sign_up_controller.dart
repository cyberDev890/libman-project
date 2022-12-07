import 'package:flutter/material.dart';
import 'package:get/get.dart';

class SignUpController extends GetxController {
  late TextEditingController namaC;
  late TextEditingController nisC;
  late TextEditingController tingkatan;
  late TextEditingController kelas;
  late TextEditingController noTelp;
  late TextEditingController passwordC;
  late TextEditingController password2C;
  late TextEditingController jenisKelamin;
  late TextEditingController gambarSiswa;

  @override
  void onInit() {
    super.onInit();
    namaC = TextEditingController();
    nisC = TextEditingController();
    tingkatan = TextEditingController();
    kelas = TextEditingController();
    noTelp = TextEditingController();
    passwordC = TextEditingController();
    password2C = TextEditingController();
    gambarSiswa = TextEditingController();
    jenisKelamin = TextEditingController();
  }

  @override
  void onClose() {
    namaC = TextEditingController();
    nisC = TextEditingController(); 
    tingkatan = TextEditingController();
    kelas = TextEditingController();
    noTelp = TextEditingController();
    passwordC = TextEditingController();
    password2C = TextEditingController();
    gambarSiswa = TextEditingController();
    jenisKelamin = TextEditingController();
  }
}
