import 'package:flutter/material.dart';

import 'package:get/get.dart';

import '../../login/controllers/login_controller.dart';
import '../controllers/sign_up_controller.dart';

class SignUpView extends GetView<SignUpController> {
  final addC = Get.find<SignUpController>();
  final usersC = Get.put(LoginController());
  @override
  Widget build(BuildContext context) {
    return signup(addC: addC, usersC: usersC);
  }
}

class signup extends StatefulWidget {
  const signup({
    Key? key,
    required this.addC,
    required this.usersC,
  }) : super(key: key);

  final SignUpController addC;
  final LoginController usersC;

  @override
  State<signup> createState() => _signupState();
}

class _signupState extends State<signup> {
  bool ishiddenpassword = true;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20),
        child: ListView(
          children: [
            SizedBox(
              height: MediaQuery.of(context).size.height * 0.05,
            ),
            Container(
              alignment: Alignment.topLeft,
              child: Text(
                'Back',
                style: TextStyle(
                    fontSize: 17,
                    fontFamily: 'Mulish',
                    fontWeight: FontWeight.bold,
                    color: Color(0xFF0B48BB)),
              ),
            ),
            SizedBox(
              height: MediaQuery.of(context).size.height * 0.06,
            ),
            Container(
              alignment: Alignment.center,
              child: Text(
                'Daftar',
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
            Container(
              child: Text(
                'Nama',
                style: TextStyle(
                    fontSize: 17, fontFamily: 'Mulish', color: Colors.black),
              ),
            ),
            SizedBox(
              height: MediaQuery.of(context).size.height * 0.005,
            ),
            Container(
                height: 51,
                width: 307,
                child: TextField(
                  controller: widget.addC.nameC,
                  textInputAction: TextInputAction.next,
                  autocorrect: false,
                  decoration: InputDecoration(
                    border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(8)),
                    hintText: "Masukan nama anda ",
                    hintStyle: TextStyle(
                      color: Colors.grey,
                    ),
                  ),
                )),
            SizedBox(
              height: MediaQuery.of(context).size.height * 0.020,
            ),
            Container(
              child: Text(
                'NIS',
                style: TextStyle(
                    fontSize: 17, fontFamily: 'Mulish', color: Colors.black),
              ),
            ),
            SizedBox(
              height: MediaQuery.of(context).size.height * 0.005,
            ),
            Container(
                height: 51,
                width: 307,
                child: TextField(
                  controller: widget.addC.passwordC,
                  textInputAction: TextInputAction.next,
                  autocorrect: false,
                  decoration: InputDecoration(
                    border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(8)),
                    hintText: "Masukan NIS anda ",
                    hintStyle: TextStyle(
                      color: Colors.grey,
                    ),
                  ),
                )),
            SizedBox(
              height: MediaQuery.of(context).size.height * 0.020,
            ),
            Container(
              child: Text(
                'Password',
                style: TextStyle(
                    fontSize: 17, fontFamily: 'Mulish', color: Colors.black),
              ),
            ),
            SizedBox(
              height: MediaQuery .of(context).size.height * 0.005,
            ),
            Container(
              height: 51,
              width: 307,
              child: TextField(
                controller: widget.addC.repasswordC,
                textInputAction: TextInputAction.next,
                autocorrect: false,
                obscureText: ishiddenpassword,
                decoration: InputDecoration(
                  suffixIcon: InkWell(
                      onTap: togglePassword, child: Icon(Icons.visibility)),
                  border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(8)),
                  hintText: "Masukan Password anda ",
                  hintStyle: TextStyle(
                    color: Colors.grey,
                  ),
                ),
                onEditingComplete: () => widget.usersC.add(
                  widget.addC.nameC.text,
                  widget.addC.passwordC.text,
                  widget.addC.repasswordC.text,
                ),
              ),
            ),
            SizedBox(
              height: MediaQuery.of(context).size.height * 0.05,
            ),
            ElevatedButton(
              onPressed: () => widget.usersC.add(
                widget.addC.nameC.text,
                widget.addC.passwordC.text,
                widget.addC.repasswordC.text,
              ),
              child: Text(
                "Daftar",
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

  void togglePassword() {
    setState(() {
      ishiddenpassword = !ishiddenpassword;
    });
  }
}
