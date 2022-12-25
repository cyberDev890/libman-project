import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:shared_preferences/shared_preferences.dart';

import "package:http/http.dart" as http;
import '../../api/api.dart';
import '../../api/connectedApi.dart';

class DrawerScreen extends StatefulWidget {
  final VoidCallback? signOut;

  DrawerScreen({Key? key, this.signOut}) : super(key: key);
  @override
  State<DrawerScreen> createState() => _DrawerScreenState();
}

class _DrawerScreenState extends State<DrawerScreen> {
  ConnectApi connect = Get.put(ConnectApi());
  signOut() {
    setState(() {
      widget.signOut!();
    });
  }

  String? nama = '';
  String? nis = '';
  String? gambar = '';
  String? kelas = '';
  bool isloading = true;
  getPref() async {
    SharedPreferences preferences = await SharedPreferences.getInstance();
    setState(() {
      nama = preferences.getString("nama_siswa");
      nis = preferences.getString("NIS");
      gambar = preferences.getString("gambar");
      kelas = preferences.getString("kelas");
      isloading = false;
    });
  }

  @override
  void initState() {
    getPref();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: Padding(
        padding: const EdgeInsets.all(10),
        child: ListView(
          children: [
            UserAccountsDrawerHeader(
              decoration: BoxDecoration(
                color: Colors.transparent,
              ),
              accountName: Text("$nama",
                  style: TextStyle(
                    color: Colors.black,
                    fontSize: 20,
                    fontFamily: 'Mulish',
                  )),
              currentAccountPicture: InkWell(
                onTap: () {
                  Get.toNamed('/profile');
                },
                child: isloading
                    ? Center(
                        child: CircularProgressIndicator(),
                      )
                    : CircleAvatar(
                        backgroundColor: Colors.grey[200],
                        child: ClipOval(
                            child: Image.network(
                          API.gambar + '$gambar',
                          width: 100,
                          height: 100,
                          fit: BoxFit.contain,
                        )),
                      ),
              ),
              accountEmail: Text("$nis",
                  style: TextStyle(
                    color: Colors.black,
                    fontSize: 17,
                    fontFamily: 'Mulish',
                  )),
            ),
            DrawerListTile(
              iconData: Icons.admin_panel_settings,
              title: "Pengaturan Privasi ",
              text: '',
              ontilePressed: () {
                Get.toNamed('/profile');
              },
            ),
            DrawerListTile(
              iconData: Icons.apps_outage_rounded,
              title: "Memerlukan tindakan",
              text: '',
              ontilePressed: () {
                Get.toNamed('/history');
              },
            ),
            DrawerListTile(
              iconData: Icons.bookmark_add_outlined,
              title: "Daftar Favorite",
              text: '',
              ontilePressed: () {
                Get.toNamed('/daftar-favorit');
              },
            ),
            DrawerListTile(
              iconData: Icons.support_agent,
              title: "Customer Service",
              text: '',
              ontilePressed: () {
                Get.toNamed('/costumer-service');
              },
            ),
            DrawerListTile(
              iconData: Icons.info_outline,
              title: "Tentang Aplikasi",
              text: '',
              ontilePressed: () {
                Get.toNamed('/tentang-aplikasi');
              },
            ),
            DrawerListTile(
              iconData: Icons.logout,
              title: "Keluar",
              text: '',
              ontilePressed: () {
                signOut();
              },
            ),
          ],
        ),
      ),
    );
  }
}

class DrawerListTile extends StatelessWidget {
  final IconData? iconData;
  final String? title;
  final String? text;
  final VoidCallback? ontilePressed;

  const DrawerListTile(
      {this.iconData, this.title, this.text, this.ontilePressed});
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        ListTile(
          onTap: ontilePressed,
          leading: Icon(iconData),
          dense: true,
          title: Text(
            title!,
            style: TextStyle(fontSize: 14, fontFamily: 'Mulish'),
          ),
          trailing: Text(
            text!,
            style: TextStyle(fontSize: 14, fontFamily: 'Mulish'),
          ),
        ),
        Divider(
          height: 1,
          thickness: 1,
        ),
      ],
    );
  }
}
