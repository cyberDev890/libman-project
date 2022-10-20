import 'package:flutter/material.dart';
import 'package:get/get.dart';

class SignUpController extends GetxController {
  //TODO: Implement SignUpController

 late TextEditingController nameC;
  late TextEditingController passwordC;
  late TextEditingController repasswordC;


  @override
  void onInit() {
    super.onInit();
    nameC = TextEditingController();
    passwordC = TextEditingController();
    repasswordC = TextEditingController();
   
  }

  @override
  void onClose() {
    nameC.dispose();
    passwordC.dispose();
    repasswordC.dispose();
    super.onClose();
  }
}
