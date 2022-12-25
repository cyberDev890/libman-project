import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:shared_preferences/shared_preferences.dart';
import '../../api/api.dart';
import '../controllers/home_controller.dart';
import './drawerScreen.dart';
import 'navbar.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

class HomeView extends StatefulWidget {
  final VoidCallback? signOut;
  HomeView({Key? key, this.signOut}) : super(key: key);
  @override
  State<HomeView> createState() => _HomeViewState();
}

class _HomeViewState extends State<HomeView> {
  final scaffoldKey = GlobalKey<ScaffoldState>();
  HomeController homeController = Get.put(HomeController());
  String? nis = '';
  List history = [];
  List tindakan = [];
  getPref() async {
    SharedPreferences preferences = await SharedPreferences.getInstance();
    setState(() {
      nis = preferences.getString("NIS");
    });
  }

  Future getHistory() async {
    var response = await http.post(Uri.parse(API.history), body: {
      'NIS': nis,
    });

    final dataHistory = json.decode(response.body);
    setState(() {
      history = dataHistory;
    });
  }

  Future getTindakan() async {
    var response =
        await http.post(Uri.parse(API.tindakan), body: {'NIS': '$nis'});
    if (response.statusCode == 200) {
      final dataTindakan = jsonDecode(response.body);
      setState(() {
        tindakan = dataTindakan;
      });
    }
  }

  Future onRefresh() async {
    getHistory();
    getTindakan();
  }

  @override
  void initState() {
    getPref();
    getHistory();
    getTindakan();
    onRefresh();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        key: scaffoldKey,
        appBar: appbar(),
        drawer: DrawerScreen(
          signOut: () {
            widget.signOut!();
          },
        ),
        body: SafeArea(
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 10),
            child: Column(children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Container(
                    child: Text('Jenis Buku',
                        style: TextStyle(
                            letterSpacing: 0.2,
                            color: Colors.black,
                            fontSize: 17,
                            fontWeight: FontWeight.bold,
                            fontFamily: 'Mulish')),
                  ),
                  Container(
                    child: TextButton(
                      onPressed: () {
                        Get.toNamed('/jenis-buku');
                      },
                      child: Center(
                        child: Text('Lihat lainnya',
                            style: TextStyle(
                                color: Colors.grey,
                                fontSize: 14,
                                fontWeight: FontWeight.bold,
                                fontFamily: 'Mulish')),
                      ),
                    ),
                  ),
                ],
              ),
              SizedBox(
                height: MediaQuery.of(context).size.height * 0.01,
              ),
              navbar(),
              SizedBox(
                height: MediaQuery.of(context).size.height * 0.01,
              ),
              Container(
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Container(
                      child: Text('Memerlukan Tindakan',
                          style: TextStyle(
                              color: Colors.black,
                              fontSize: 17,
                              fontWeight: FontWeight.bold,
                              fontFamily: 'Mulish')),
                    ),
                    Container(
                      child: TextButton(
                        onPressed: () {
                          Get.toNamed('/history');
                        },
                        child: Center(
                          child: Text('Lihat lainnya',
                              style: TextStyle(
                                  color: Colors.grey,
                                  fontSize: 14,
                                  fontWeight: FontWeight.bold,
                                  fontFamily: 'Mulish')),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              SizedBox(
                height: MediaQuery.of(context).size.height * 0.01,
              ),
              Container(
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10),
                  color: Colors.grey[200],
                ),
                height: 100,
                width: double.infinity,
                child: tindakan.length == 0
                    ? InkWell(
                        onTap: onRefresh,
                        child: Center(
                          child: Text("Tidak ada data",
                              style: TextStyle(
                                  color: Color.fromARGB(255, 183, 172, 172),
                                  fontSize: 16,
                                  fontWeight: FontWeight.bold,
                                  fontFamily: 'Mulish')),
                        ),
                      )
                    : ListView.builder(
                        shrinkWrap: true,
                        itemCount: 1,
                        itemBuilder: (context, index) {
                          return Column(
                            crossAxisAlignment: CrossAxisAlignment.center,
                            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                            children: [
                              Container(
                                padding: EdgeInsets.all(10),
                                child: Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: [
                                    Container(
                                      child: Text(tindakan[0]['nama_buku'],
                                          style: TextStyle(
                                              color: Colors.black,
                                              fontSize: 17,
                                              fontWeight: FontWeight.bold,
                                              fontFamily: 'Mulish')),
                                    ),
                                    const SizedBox(
                                      width: 80.0,
                                    ),
                                    Container(
                                      child: const Icon(
                                        Icons.circle_sharp,
                                        color: Color(0xffE5E5EA),
                                        size: 20,
                                      ),
                                    ),
                                    const SizedBox(
                                      height: 10.0,
                                    ),
                                    Container(
                                      margin: EdgeInsets.only(right: 20),
                                      child: Text(
                                          "Semester " + tindakan[0]['semester'],
                                          style: TextStyle(
                                              color: Colors.grey,
                                              fontSize: 14,
                                              fontWeight: FontWeight.bold,
                                              fontFamily: 'Mulish')),
                                    ),
                                  ],
                                ),
                              ),
                              Container(
                                margin: EdgeInsets.fromLTRB(14, 10, 14, 14),
                                height:
                                    MediaQuery.of(context).size.height * 0.030,
                                child: Center(
                                  child: Text(
                                      "Status : Kembalikan sebelum " +
                                          tindakan[0]['tanggal_pengembalian'],
                                      style: TextStyle(
                                          color: Colors.black,
                                          fontSize: 14,
                                          fontWeight: FontWeight.normal,
                                          fontFamily: 'Mulish')),
                                ),
                                decoration: BoxDecoration(
                                  color: Color(0xffFDD6D6),
                                  borderRadius: BorderRadius.circular(10),
                                ),
                              ),
                            ],
                          );
                        },
                      ),
              ),
              SizedBox(
                height: MediaQuery.of(context).size.height * 0.02,
              ),
              Container(
                height: MediaQuery.of(context).size.height * 0.05,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Container(
                      child: Text('History Peminjaman',
                          style: TextStyle(
                              color: Colors.black,
                              fontSize: 17,
                              fontWeight: FontWeight.bold,
                              fontFamily: 'Mulish')),
                    ),
                  ],
                ),
              ),
              SizedBox(
                height: MediaQuery.of(context).size.height * 0.01,
              ),
              Expanded(
                  child: RefreshIndicator(
                onRefresh: onRefresh,
                child: history.length == 0
                    ? InkWell(
                        onTap: onRefresh,
                        child: Center(
                          child: Text("Tidak ada data",
                              style: TextStyle(
                                  color: Color.fromARGB(255, 204, 191, 191),
                                  fontSize: 16,
                                  fontWeight: FontWeight.bold,
                                  fontFamily: 'Mulish')),
                        ),
                      )
                    : GridView.builder(
                        shrinkWrap: true,
                        padding: EdgeInsets.all(10),
                        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                            crossAxisCount: 2,
                            mainAxisSpacing: 20,
                            crossAxisSpacing: 20,
                            childAspectRatio: 0.65),
                        itemCount: history.length,
                        itemBuilder: (context, index) {
                          return Center(
                            child: Container(
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(8),
                                color: Color(0xffDBFDD6),
                                boxShadow: const [
                                  BoxShadow(
                                    color: Colors.black26,
                                    blurRadius: 6,
                                  ),
                                ],
                              ),
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceAround,
                                children: [
                                  Expanded(
                                    child: Container(
                                      child: Stack(
                                        fit: StackFit.expand,
                                        children: [
                                          ClipRRect(
                                            borderRadius:
                                                BorderRadius.circular(8),
                                            child: Image.network(
                                              API.gambar +
                                                  history[index]['gambar'],
                                              fit: BoxFit.cover,
                                            ),
                                          ),
                                        ],
                                      ),
                                    ),
                                  ),
                                  Container(
                                      margin: EdgeInsets.only(left: 10, top: 3),
                                      child: Text(
                                        history[index]['nama_buku'],
                                        style: TextStyle(
                                          fontFamily: 'Mulish-SemiBold.ttf',
                                          fontSize: 16,
                                        ),
                                      )),
                                  Container(
                                      margin:
                                          EdgeInsets.only(left: 10, bottom: 0),
                                      child: Text(
                                        "Semester " +
                                            history[index]['semester'],
                                        style: TextStyle(
                                          color: Color(0xff8A8A8E),
                                          fontFamily: 'Mulish',
                                          fontSize: 12,
                                        ),
                                      )),
                                  Row(
                                    crossAxisAlignment: CrossAxisAlignment.end,
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceEvenly,
                                    children: [
                                      Container(
                                        margin:
                                            EdgeInsets.fromLTRB(7, 0, 10, 0),
                                        child: Image(
                                            image: AssetImage(
                                                'image/gambar/iconsStar.png')),
                                      ),
                                      Container(
                                        padding: EdgeInsets.only(),
                                        margin:
                                            EdgeInsets.fromLTRB(3, 0, 10, 0),
                                        child: Text(
                                          history[index]
                                              ['tanggal_pengembalian'],
                                          style: TextStyle(
                                            color: Color(0xff8A8A8E),
                                            fontWeight: FontWeight.bold,
                                            fontSize: 12,
                                            fontFamily: 'Mulish',
                                          ),
                                        ),
                                      ),
                                      Container(
                                        margin:
                                            EdgeInsets.fromLTRB(20, 0, 6, 0),
                                        child: Image(
                                            image: AssetImage(
                                                'image/gambar/Logobuku.png')),
                                      ),
                                    ],
                                  ),
                                ],
                              ),
                            ),
                          );
                        },
                      ),
              )),
            ]),
          ),
        ));
  }

  AppBar appbar() {
    return AppBar(
      actions: [
        IconButton(
            onPressed: () {
              Get.toNamed('/profile');
            },
            icon: Icon(
              Icons.account_circle_rounded,
              color: Colors.grey,
              size: 40,
            )),
        SizedBox(width: 20),
      ],
      backgroundColor: Colors.transparent,
      elevation: 0,
      leading: IconButton(
        icon: Icon(
          Icons.menu,
          color: Colors.grey,
          size: 30,
        ),
        onPressed: () {
          if (scaffoldKey.currentState!.isDrawerOpen) {
            scaffoldKey.currentState!.closeDrawer();
            //close drawer, if drawer is open
          } else {
            scaffoldKey.currentState!.openDrawer();
            //open drawer, if drawer is closed
          }
        },
      ),
    );
  }
}
