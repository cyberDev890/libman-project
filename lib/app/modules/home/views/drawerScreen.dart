import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:shared_preferences/shared_preferences.dart';

class DrawerScreen extends StatefulWidget {
  final VoidCallback? signOut;

  DrawerScreen({Key? key, this.signOut}) : super(key: key);
  @override
  State<DrawerScreen> createState() => _DrawerScreenState();
}

class _DrawerScreenState extends State<DrawerScreen> {
  signOut() {
    setState(() {
      widget.signOut!();
    });
  }

  String? nama = '';
  String? nis = '';
  String? gambar = '';
  String? kelas = '';
  getPref() async {
    SharedPreferences preferences = await SharedPreferences.getInstance();
    setState(() {
      nama = preferences.getString("nama_siswa");
      nis = preferences.getString("NIS");
      gambar = preferences.getString("gambar");
      kelas = preferences.getString("kelas");
    });
  }

//buatkan refresh image setelah edit profile di profile screen  //
 
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
                child: CircleAvatar(
                  backgroundColor: Colors.grey[200],
                  child: ClipOval(
                      child: Image.network(
                    "https://10.0.2.2/testing/$gambar",
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
              text: '7',
              ontilePressed: () {
                Get.toNamed('/history');
              },
            ),
            DrawerListTile(
              iconData: Icons.bookmark_add_outlined,
              title: "Daftar Favorite",
              text: '7',
              ontilePressed: () {
                Get.toNamed('/daftar-favorit');
              },
            ),
            DrawerListTile(
              iconData: Icons.history,
              title: "History",
              text: '7',
              ontilePressed: () {
                Get.toNamed('/history');
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
