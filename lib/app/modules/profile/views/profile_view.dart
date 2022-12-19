import 'dart:convert';
import 'dart:io';

import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';
import 'package:libman/app/modules/api/api.dart';
import 'package:libman/app/modules/profile/controllers/profile_field.dart';
import 'package:libman/app/modules/signUp/controllers/sign_up_field.dart';
import 'package:http/http.dart' as http;
import 'package:shared_preferences/shared_preferences.dart';
import '../controllers/profile_controller.dart';

class ProfileView extends GetView<ProfileController> {
  @override
  Widget build(BuildContext context) {
    return profile();
  }
}

class profile extends StatefulWidget {
  profile({super.key});

  @override
  State<profile> createState() => _profileState();
}

class _profileState extends State<profile> {
  File? pickedImageFile;
  String? pickedImageFileName, imagedata;
  ProfileController profileController = Get.put(ProfileController());

  Future<void> getImage(ImageSource source) async {
    final pickedImage =
        await ImagePicker().pickImage(source: source, imageQuality: 100);
    pickedImageFile = File(pickedImage!.path);
    pickedImageFileName = pickedImageFile!.path.split('/').last;
    imagedata = base64Encode(pickedImageFile!.readAsBytesSync());
    profileController.setProfileImage(pickedImageFile!.path);
    print(imagedata);
    print(pickedImageFile);
    print(pickedImageFileName);
  }

  Future uploadImage() async {
    try {
      var url = Uri.parse(API.profile);
      var request = await http.post(url, body: {
        'NIS': profileController.nisC.text,
        'nama_siswa': profileController.namaC.text,
        'notelp': profileController.noTelp.text,
        'data': imagedata,
        'name': pickedImageFileName,
      });
      var respon = json.decode(request.body);
      print(respon);
      if (respon['success'] == "true") {
        Get.snackbar(
          "Success",
          "Upload Success",
          duration: Duration(seconds: 1),
        );
      } else {
        Get.snackbar(
          "Eror",
          "Upload Gagal",
          duration: Duration(seconds: 1),
        );
      }
    } catch (e) {
      print(e);
    }
  }

  Widget bottomSheet(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Container(
      width: double.infinity,
      height: size.height * 0.2,
      child: Column(children: [
        TextButton.icon(
          onPressed: () {
            getImage(ImageSource.camera);
            print("Camera");
          },
          icon: Icon(Icons.camera),
          label: Text('Camera'),
        ),
        TextButton.icon(
          onPressed: () {
            getImage(ImageSource.gallery);
            print("Gallery");
          },
          icon: Icon(Icons.image),
          label: Text('Gallery'),
        ),
      ]),
    );
  }

  String? nama = '';
  String? nis = '';
  String? gambar = '';
  String? kelas = '';
  String? telp = '';
  getPref() async {
    SharedPreferences preferences = await SharedPreferences.getInstance();
    setState(() {
      nama = preferences.getString("nama_siswa");
      nis = preferences.getString("NIS");
      gambar = preferences.getString("gambar");
      kelas = preferences.getString("kelas");
      telp = preferences.getString("notelp");
    });
  }

  @override
  void initState() {
    getPref();

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          icon: Icon(
            Icons.arrow_back_ios_new,
            color: Color(0xffAEAEB2),
          ),
          onPressed: () {
            Get.back();
          },
        ),
        title: Text(
          'Profil',
          style: TextStyle(
            color: Colors.black,
            fontFamily: 'Mulish-Regular.ttf',
          ),
        ),
        centerTitle: true,
        backgroundColor: Colors.transparent,
        elevation: 0.0,
      ),
      body: SingleChildScrollView(
        child: Center(
          child: Padding(
            padding: const EdgeInsets.all(10),
            child: Column(
              children: [
                Stack(
                  children: [
                    Obx(() => CircleAvatar(
                          backgroundColor: Colors.transparent,
                          backgroundImage:
                              profileController.isProficPicPathSet.value == true
                                  ? FileImage(File(profileController
                                      .profilePicPath.value)) as ImageProvider
                                  : NetworkImage(
                                      'https://10.0.2.2/testing/$gambar'),
                          radius: 80,
                        )),
                    Positioned(
                      bottom: 0,
                      right: 0,
                      child: Container(
                        height: 40,
                        width: 40,
                        decoration: BoxDecoration(
                          shape: BoxShape.circle,
                          color: Colors.white,
                        ),
                        child: IconButton(
                          icon: Icon(
                            Icons.camera_alt,
                            color: Color(0xffAEAEB2),
                          ),
                          onPressed: () {
                            showModalBottomSheet(
                                context: context,
                                builder: (context) => bottomSheet(context));
                          },
                        ),
                      ),
                    ),
                  ],
                ),
                const SizedBox(
                  height: 20.0,
                ),
                TLtextfieldProfile(
                    controller: profileController.nisC,
                    label: "NIS",
                    hint: "$nis",
                    keyboardTipe: TextInputType.number),
                const SizedBox(
                  height: 20.0,
                ),
                TLtextfield(
                    controller: profileController.namaC,
                    label: "Nama",
                    hint: "$nama",
                    keyboardTipe: TextInputType.text),
                const SizedBox(
                  height: 20.0,
                ),
                TLtextfield(
                    controller: profileController.noTelp,
                    label: "No Telepon",
                    hint: "$telp",
                    keyboardTipe: TextInputType.text),
                const SizedBox(
                  height: 20.0,
                ),
                const SizedBox(
                  height: 20.0,
                ),
                Container(
                  height: 52,
                  width: 320,
                  child: ElevatedButton(
                    onPressed: () {
                      uploadImage();
                    },
                    child: Text(
                      "Simpan",
                      style: TextStyle(fontFamily: 'Mulish', fontSize: 17),
                    ),
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Color(0xFF0041C4),
                      fixedSize: Size(307, 52),
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(8)),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
