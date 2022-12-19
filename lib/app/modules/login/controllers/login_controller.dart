import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../../api/connectedApi.dart';

class LoginController extends GetxController {
  late TextEditingController nisC;
  late TextEditingController passwordC;

  @override
  void onInit() {
    super.onInit();
    nisC = TextEditingController();
    passwordC = TextEditingController();
    // getPref();
  }

  @override
  void onClose() {
    super.onClose();
    nisC = TextEditingController();
    passwordC = TextEditingController();
  }
}
