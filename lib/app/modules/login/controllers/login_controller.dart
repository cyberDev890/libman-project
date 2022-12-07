import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:shared_preferences/shared_preferences.dart';

class LoginController extends GetxController {
  late TextEditingController nisC;
  late TextEditingController passwordC;

  savpref(String status) async {
    SharedPreferences pref = await SharedPreferences.getInstance();
    pref.setString('status', status).obs;
  }

  var status;
  getPref() async {
    SharedPreferences pref = await SharedPreferences.getInstance();
    status = pref.getString('status').obs;
  }

  @override
  void onInit() {
    getPref();
    super.onInit();
    nisC = TextEditingController();
    passwordC = TextEditingController();
  }

  @override
  void onClose() {
    nisC.dispose();
    super.onClose();
  }
}
