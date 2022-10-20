import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../models/user.dart';
import '../../provider/userP.dart';

class LoginController extends GetxController {
  //TODO: Implement LoginController

 var users = List<User>.empty().obs;

  void snackBarError(String msg) {
    Get.snackbar(
      "ERROR",
      msg,
      duration: Duration(seconds: 2),
    );
  }

  void add(String name, String password, String repassword) {
    if (name != '' && password != ''&& repassword != '' ) {
      if (password.contains("@")) {
        userProvider().postdata(name, password).then((value) {
          users.add(
            User(
              id: value.body['name'].toString(),
              name: name,
              password: password,
              repassword: repassword,
        
            ),
          );
        });
        Get.toNamed('/login');
      } else {
        snackBarError("Masukan email valid");
      }
    } else {
      snackBarError("Semua data harus diisi");
    }
  }

  User userById(String id) {
    return users.firstWhere((element) => element.id == id);
  }

  void edit(String id, String name, String password, String repassword) {
    if (name != '' && password != ''&& repassword != '') {
      if (password.contains("@")) {
        userProvider().editdata(id, name, password).then((_) {
          final user = userById(id);
          user.name = name;
          user.password = password;
          user.repassword = repassword;
       
          users.refresh();
        });
      
        Get.back();
      } else {
        snackBarError("Masukan email valid");
      }
    } else {
      snackBarError("Semua data harus diisi");
    }
  }

  Future<bool> delete(String id) async {
    bool _deleted = false;
    await Get.defaultDialog(
      title: "DELETE",
      middleText: "Apakah kamu yakin untuk menghapus data user ini?",
      textConfirm: "Ya",
      confirmTextColor: Colors.white,
      onConfirm: () {
        userProvider().deletedata(id).then((_) {
          users.removeWhere((element) => element.id == id);
          _deleted = true;
        });

        Get.back();
      },
      textCancel: "Tidak",
    );
    return _deleted;
  }
}
