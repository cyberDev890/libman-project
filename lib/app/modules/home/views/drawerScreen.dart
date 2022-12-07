import 'package:flutter/material.dart';
import 'package:get/get.dart';

class DrawerScreen extends StatefulWidget {
  final String? nama;
  final String? nis;
  DrawerScreen({Key? key, this.nama, this.nis}) : super(key: key);
  @override
  State<DrawerScreen> createState() => _DrawerScreenState();
}

class _DrawerScreenState extends State<DrawerScreen> {
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
              accountName: Text(widget.nama.toString(),
                  style: TextStyle(
                    color: Colors.black,
                    fontSize: 17,
                    fontFamily: 'Mulish',
                  )),
              currentAccountPicture: CircleAvatar(),
              accountEmail: Text(widget.nis.toString(),
                  style: TextStyle(
                    color: Colors.black,
                    fontSize: 17,
                    fontFamily: 'Mulish',
                  )),
            ),
            DrawerListTile(
              iconData: Icons.admin_panel_settings,
              title: "Pengaturan Privasi",
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
                Get.offAllNamed('/login');
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
