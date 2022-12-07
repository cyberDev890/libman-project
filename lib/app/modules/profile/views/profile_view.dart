import 'dart:convert';
import 'dart:io';

import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';
import 'package:libman/app/modules/signUp/controllers/sign_up_field.dart';
import 'package:http/http.dart' as http;
import '../controllers/profile_controller.dart';

class ProfileView extends GetView<ProfileController> {
  File? pickedImageFile;
  String? pickedImageFileName, imagedata;
  // String? NIS,nama,password;

  ProfileController profileController = Get.put(ProfileController());
  TextEditingController namaC = TextEditingController();

  Future<void> getImage(ImageSource source) async {
    final pickedImage =
        await ImagePicker().pickImage(source: source, imageQuality: 100);

    pickedImageFile = File(pickedImage!.path);
    pickedImageFileName = pickedImageFile!.path.split('/').last;
    imagedata = base64Encode(pickedImageFile!.readAsBytesSync());
    profileController.setProfileImage(pickedImageFile!.path);

    print("ini pikfile $pickedImageFile");
    print("ini pikfilename $pickedImageFileName");
    print("ini imagedata $imagedata");
  }

// setup(){
//   NISC = TextEditingController(text: NIS);
//   namaC = TextEditingController(text: nama);
//   passwordC = TextEditingController(text: password);
// }
  Future uploadImage() async {
    try {
      String uri = "https://10.0.2.2/testing/profile.php";
      var request = await http.post(Uri.parse(uri), body: {
        'NIS': namaC.text,
        'data': imagedata,
        'name': pickedImageFileName,  
      });
      var respon = json.decode(request.body);
      if (respon['succes'] == "true") {
        namaC.clear();
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
                          backgroundImage: profileController
                                      .isProficPicPathSet.value ==
                                  true
                              ? FileImage(File(
                                      profileController.profilePicPath.value))
                                  as ImageProvider
                              : NetworkImage(
                                  'https://cdn.pixabay.com/photo/2015/10/05/22/37/blank-profile-picture-973460_1280.png'),
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
                Container(
                  child: Text(
                    'Nama',
                    style: TextStyle(
                        fontSize: 17,
                        fontFamily: 'Mulish',
                        color: Colors.black),
                  ),
                ),
                TLtextfield(
                    // controller: namaC,
                    label: "Nama",
                    hint: "",
                    keyboardTipe: TextInputType.name),
                const SizedBox(
                  height: 20.0,
                ),
                TLtextfield(
                    label: "NIS", hint: "", keyboardTipe: TextInputType.number),
                const SizedBox(
                  height: 20.0,
                ),
                TLpassword(
                    label: "Password",
                    hint: "",
                    keyboardTipe: TextInputType.visiblePassword),
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
}
