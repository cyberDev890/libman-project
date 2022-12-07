import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:libman/app/modules/signUp/controllers/sign_up_field.dart';
import '../../api/connectedApi.dart';
import '../controllers/sign_up_controller.dart';

class SignUpView extends GetView<SignUpController> {
  @override
  Widget build(BuildContext context) {
    return signup();
  }
}

class signup extends StatefulWidget {
  const signup({
    Key? key,
  }) : super(key: key);
  @override
  State<signup> createState() => _signupState();
}

class _signupState extends State<signup> {
  bool ishiddenpassword = true;
  SignUpController signUp = Get.put(SignUpController());
  ConnectApi logindata = Get.put(ConnectApi());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20),
      child: ListView(
        padding: EdgeInsets.only(bottom: 20),
        children: [
          SizedBox(
            height: MediaQuery.of(context).size.height * 0.02,
          ),
          Container(
            alignment: Alignment.topLeft,
            child: TextButton(
                onPressed: () => Get.back(),
                child: Text(
                  'Back',
                  style: TextStyle(
                      fontSize: 17,
                      fontFamily: 'Mulish',
                      fontWeight: FontWeight.bold,
                      color: Color(0xFF0B48BB)),
                )),
          ),
          SizedBox(
            height: MediaQuery.of(context).size.height * 0.05,
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
                  fontSize: 14, fontFamily: 'Mulish', color: Color(0xFF8A8A8E)),
            ),
          ),
          Container(
            alignment: Alignment.center,
            child: Text(
              'untuk melanjutkan ke halaman berikutnya',
              style: TextStyle(
                  fontSize: 14, fontFamily: 'Mulish', color: Color(0xFF8A8A8E)),
            ),
          ),
          SizedBox(
            height: MediaQuery.of(context).size.height * 0.05,
          ),
          TLtextfield(
              label: 'Nama',
              hint: 'Masukkan Nama Lengkap anda',
              controller: signUp.namaC,
              keyboardTipe: TextInputType.name),
          SizedBox(
            height: MediaQuery.of(context).size.height * 0.020,
          ),
          TLtextfield(
              label: 'NIS',
              maxLenght: 4,
              hint: 'Masukkan NIS anda',
              controller: signUp.nisC,
              keyboardTipe: TextInputType.number),
          SizedBox(
            height: MediaQuery.of(context).size.height * 0.020,
          ),
          Container(
              height: 60,
              width: 307,
              child: DropdownButtonFormField(
                decoration: InputDecoration(
                  label: Text('Tingkatan'),
                  border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(8)),
                  hintText: "Masukan Tingkatan anda ",
                  hintStyle: TextStyle(
                    color: Colors.grey,
                  ),
                ),
                items: [
                  DropdownMenuItem(
                    child: Text("VII"),
                    value: "VII",
                  ),
                  DropdownMenuItem(
                    child: Text("VIII"),
                    value: "VIII",
                  ),
                  DropdownMenuItem(
                    child: Text("IX"),
                    value: "IX",
                  ),
                ],
                onChanged: (value) {
                  signUp.tingkatan.text = value.toString();
                },
              )),
          SizedBox(
            height: MediaQuery.of(context).size.height * 0.020,
          ),
          Container(
              height: 60,
              width: 307,
              child: DropdownButtonFormField(
                decoration: InputDecoration(
                  label: Text('Kelas'),
                  border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(8)),
                  hintText: "Masukan Kelas anda ",
                  hintStyle: TextStyle(
                    color: Colors.grey,
                  ),
                ),
                items: [
                  DropdownMenuItem(
                    child: Text("A"),
                    value: "A",
                  ),
                  DropdownMenuItem(
                    child: Text("B"),
                    value: "B",
                  ),
                  DropdownMenuItem(
                    child: Text("C"),
                    value: "C",
                  ),
                  DropdownMenuItem(
                    child: Text("D"),
                    value: "D",
                  ),
                  DropdownMenuItem(
                    child: Text("F"),
                    value: "F",
                  ),
                  DropdownMenuItem(
                    child: Text("G"),
                    value: "G",
                  ),
                ],
                onChanged: (value) {
                  signUp.kelas.text = value.toString();
                },
              )),
          SizedBox(
            height: MediaQuery.of(context).size.height * 0.020,
          ),
          TLtextfield(
              maxLenght: 13,
              label: 'No Telepon',
              hint: 'Masukan nomor telepon anda',
              controller: signUp.noTelp,
              keyboardTipe: TextInputType.number),
          SizedBox(
            height: MediaQuery.of(context).size.height * 0.020,
          ),
          Container(
              height: 60,
              width: 307,
              child: DropdownButtonFormField(
                decoration: InputDecoration(
                  label: Text('Jenis kelamin'),
                  border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(8)),
                  hintText: "Masukan Kelas anda ",
                  hintStyle: TextStyle(
                    color: Colors.grey,
                  ),
                ),
                items: [
                  DropdownMenuItem(
                    child: Text("L"),
                    value: "L",
                  ),
                  DropdownMenuItem(
                    child: Text("P"),
                    value: "P",
                  ),
                ],
                onChanged: (value) {
                  signUp.jenisKelamin.text = value.toString();
                },
              )),
          SizedBox(
            height: MediaQuery.of(context).size.height * 0.020,
          ),
          TLpassword(
              label: 'Password',
              hint: 'Masukkan password anda',
              controller: signUp.passwordC,
              keyboardTipe: TextInputType.visiblePassword),
          SizedBox(
            height: MediaQuery.of(context).size.height * 0.020,
          ),
          TLpassword(
              label: 'Konfirmasi Password',
              hint: 'Masukkan password anda',
              controller: signUp.password2C,
              keyboardTipe: TextInputType.visiblePassword),
          SizedBox(
            height: MediaQuery.of(context).size.height * 0.03,
          ),
          ElevatedButton(
            onPressed: () {
              if (signUp.namaC.text.isEmpty) {
                Get.snackbar("Error", "Nama tidak boleh kosong");
              } else if (signUp.nisC.text.isEmpty) {
                Get.snackbar("Error", "NIS tidak boleh kosong");
              } else if (signUp.jenisKelamin.text.isEmpty) {
                Get.snackbar("Error", "Jenis kelamin tidak boleh kosong");
              } else if (signUp.tingkatan.text.isEmpty) {
                Get.snackbar("Error", "Tingkatan tidak boleh kosong");
              } else if (signUp.kelas.text.isEmpty) {
                Get.snackbar("Error", "Kelas tidak boleh kosong");
              } else if (signUp.noTelp.text.isEmpty) {
                Get.snackbar("Error", "No Telepon tidak boleh kosong");
              } else if (signUp.passwordC.text.isEmpty) {
                Get.snackbar("Error", "Password tidak boleh kosong");
              } else if (signUp.password2C.text.isEmpty) {
                Get.snackbar("Error", "Konfirmasi Password tidak boleh kosong");
              } else if (signUp.passwordC.text != signUp.password2C.text) {
                Get.snackbar("Error", "Password tidak sama");
              } else if (signUp.passwordC.text.isEmpty &&
                  signUp.password2C.text.isEmpty &&
                  signUp.namaC.text.isEmpty &&
                  signUp.nisC.text.isEmpty &&
                  signUp.jenisKelamin.text.isEmpty &&
                  signUp.tingkatan.text.isEmpty &&
                  signUp.kelas.text.isEmpty &&
                  signUp.noTelp.text.isEmpty) {
                Get.snackbar("Error", "data tidak boleh kosong");
              } else {
                logindata.register();
              }
            },
            child: Text(
              "Daftar",
              style: TextStyle(fontFamily: 'Mulish', fontSize: 17),
            ),
            style: ElevatedButton.styleFrom(
              backgroundColor: Color(0xFF0041C4),
              fixedSize: Size(307, 52),
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(8)),
            ),
          ),
        ],
      ),
    ));
  }
}
