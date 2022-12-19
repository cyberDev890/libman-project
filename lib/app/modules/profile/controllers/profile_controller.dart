import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:shared_preferences/shared_preferences.dart';

class ProfileController extends GetxController {
  var isProficPicPathSet = false.obs;
  var profilePicPath = "".obs;

  void setProfileImage(String path) {
    profilePicPath.value = path;
    isProficPicPathSet.value = true;
  }

  late TextEditingController namaC;
  late TextEditingController nisC;
  late TextEditingController tingkatan;
  late TextEditingController kelasC;
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
    kelasC = TextEditingController();
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
    kelasC = TextEditingController();
    noTelp = TextEditingController();
    passwordC = TextEditingController();
    password2C = TextEditingController();
    gambarSiswa = TextEditingController();
    jenisKelamin = TextEditingController();
  }
}
