import 'package:flutter/material.dart';

class DrawerScreen extends StatefulWidget {
  @override
  State<DrawerScreen> createState() => _DrawerScreenState();
}

class _DrawerScreenState extends State<DrawerScreen> {
  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: ListView(
        children: <Widget>[
          UserAccountsDrawerHeader(
            decoration: BoxDecoration(
              color: Colors.transparent,
            ),
            accountName: Text("Rayhan Febriansyah",
                style: TextStyle(
                  color: Colors.black,
                  fontSize: 17,
                  fontFamily: 'Mulish',
                )),
            currentAccountPicture: CircleAvatar(),
            accountEmail: Text("8899",
                style: TextStyle(
                  color: Colors.black,
                  fontSize: 17,
                  fontFamily: 'Mulish',
                )),
          ),
          DrawerListTile(
            iconData: Icons.admin_panel_settings,
            title: "Pengaturan Privasi",
            text: '7',
            ontilePressed: () {},
          ),
          DrawerListTile(
            iconData: Icons.apps_outage_rounded,
            title: "Memerlukan tindakan",
            text: '7',
            ontilePressed: () {},
          ),
          DrawerListTile(
            iconData: Icons.bookmark_add_outlined,
            title: "Daftar Favorite",
            text: '7',
            ontilePressed: () {},
          ),
          DrawerListTile(
            iconData: Icons.history,
            title: "history",
            text: '7',
            ontilePressed: () {},
          ),
          DrawerListTile(
            iconData: Icons.support_agent,
            title: "Customer Service",
            text: '7',
            ontilePressed: () {},
          ),
          DrawerListTile(
            iconData: Icons.info_outline,
            title: "Tentang Aplikasi",
            text: '7',
            ontilePressed: () {},
          ),
          DrawerListTile(
            iconData: Icons.logout,
            title: "Keluar",
            text: '7',
            ontilePressed: () {},
          ),
        ],
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
