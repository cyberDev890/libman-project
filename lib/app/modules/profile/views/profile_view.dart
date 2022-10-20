import 'package:flutter/material.dart';

import 'package:get/get.dart';

import '../controllers/profile_controller.dart';

class ProfileView extends GetView<ProfileController> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Profil',
          style: TextStyle(
            color: Colors.black,
            fontFamily: 'Mulish',
          ),
        ),
        centerTitle: true,
        backgroundColor: Colors.transparent,
        elevation: 0,
      ),
      body: Center(
        child: Column(
          children: [
            Container(
              height: 132,
              width: 132,
              color: Colors.blue,
            ),
            Container(
              child: Text(
                'Nama',
                style: TextStyle(
                    fontSize: 17, fontFamily: 'Mulish', color: Colors.black),
              ),
            ),
            Container(
              child: Text(
                'Nama',
                style: TextStyle(
                    fontSize: 17, fontFamily: 'Mulish', color: Colors.grey),
              ),
            ),
            Container(
              height: 51,
              width: 307,
              child: TextFormField(
                decoration: InputDecoration(
                  label: Text(
                    'Nama',
                    style: TextStyle(
                        fontSize: 17,
                        fontFamily: 'Mulish',
                        color: Colors.black),
                  ),
                  border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(8)),
                  hintText: "Masukan Nama anda ",
                  hintStyle: TextStyle(
                    color: Colors.grey,
                  ),
                ),
              ),
            ),
            Container(
              height: 51,
              width: 307,
              child: TextFormField(
                decoration: InputDecoration(
                  label: Text(
                    'NIS',
                    style: TextStyle(
                        fontSize: 17,
                        fontFamily: 'Mulish',
                        color: Colors.black),
                  ),
                  border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(8)),
                  hintText: "Masukan NIS anda ",
                  hintStyle: TextStyle(
                    color: Colors.grey,
                  ),
                ),
              ),
            ),
            Container(
              height: 51,
              width: 307,
              child: TextFormField(
                decoration: InputDecoration(
                  label: Text(
                    'Password',
                    style: TextStyle(
                        fontSize: 17,
                        fontFamily: 'Mulish',
                        color: Colors.black),
                  ),
                  border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(8)),
                  hintText: "Masukan Password anda ",
                  hintStyle: TextStyle(
                    color: Colors.grey,
                  ),
                ),
              ),
            ),
            ElevatedButton(
              onPressed: () {
                Get.toNamed('/home');
              },
              child: Text(
                "Simpan",
                style: TextStyle(fontFamily: 'Mulish', fontSize: 17),
              ),
              style: ElevatedButton.styleFrom(
                primary: Color(0xFF0041C4),
                fixedSize: Size(307, 52),
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(8)),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
