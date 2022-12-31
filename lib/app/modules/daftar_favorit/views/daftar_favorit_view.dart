import 'dart:convert';

import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:libman/app/modules/api/api.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../../api/connectedApi.dart';

import "package:http/http.dart" as http;

class DaftarFavoritView extends StatefulWidget {
  const DaftarFavoritView({super.key});

  @override
  State<DaftarFavoritView> createState() => _DaftarFavoritViewState();
}

class _DaftarFavoritViewState extends State<DaftarFavoritView> {
  ConnectApi connect = Get.put(ConnectApi());
  String nis = '';
  List data2 = [];

  getPref() async {
    SharedPreferences preferences = await SharedPreferences.getInstance();
    setState(() {
      nis = preferences.getString("NIS")!;
    });
  }

  Future getDataDaftarFavorit() async {
    var response = await http.post(Uri.parse(API.daftarFavorit), body: {
      'NIS': '$nis',
    });
    if (response.statusCode == 200) {
      final data = jsonDecode(response.body);
      setState(() {
        data2 = data;
      });
    }
  }

  @override
  void initState() {
    getDataDaftarFavorit();
    getPref();

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Scaffold(
        appBar: AppBar(
          leading: IconButton(
            onPressed: () {
              Get.back();
            },
            icon: const Icon(
              Icons.arrow_back_ios_new,
              color: Color(0xffAEAEB2),
            ),
          ),
          actions: [
            IconButton(
              onPressed: () {},
              icon: Icon(Icons.more_vert),
              color: Color(0xffAEAEB2),
            ),
          ],
          elevation: 0,
          backgroundColor: Colors.transparent,
          title: Center(
            child: Text('Daftar Favorite',
                style: TextStyle(
                    color: Colors.black,
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                    fontFamily: 'Mulish')),
          ),
        ),
        body: SingleChildScrollView(
            child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.all(10),
              child: Container(
                padding: const EdgeInsets.symmetric(
                  vertical: 6.0,
                  horizontal: 12.0,
                ),
                decoration: BoxDecoration(
                  color: Colors.grey[200],
                  borderRadius: const BorderRadius.all(
                    Radius.circular(20.0),
                  ),
                ),
                child: Row(
                  children: [
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Icon(
                        Icons.search,
                        color: Colors.black,
                      ),
                    ),
                    Expanded(
                      child: TextFormField(
                        initialValue: null,
                        decoration: InputDecoration.collapsed(
                          filled: true,
                          fillColor: Colors.transparent,
                          hintText: "Cari",
                          hintStyle: TextStyle(
                              color: Colors.grey[500], fontFamily: 'Mulish'),
                          hoverColor: Colors.transparent,
                        ),
                        onFieldSubmitted: (value) {},
                      ),
                    ),
                  ],
                ),
              ),
            ),
            Container(
              padding: EdgeInsets.all(10),
              height: size.height * 0.8,
              child: data2.length == 0
                  ? InkWell(
                      onTap: getDataDaftarFavorit,
                      child: Center(
                        child: Text("Data Kosong"),
                      ),
                    )
                  : RefreshIndicator(
                      onRefresh: getDataDaftarFavorit,
                      child: data2.length == 0
                          ? InkWell(
                              onTap: getDataDaftarFavorit,
                              child: Center(
                                child: Text("Tidak ada data",
                                    style: TextStyle(
                                        color:
                                            Color.fromARGB(255, 183, 172, 172),
                                        fontSize: 16,
                                        fontWeight: FontWeight.bold,
                                        fontFamily: 'Mulish')),
                              ),
                            )
                          : ListView.builder(
                              itemCount: data2.length,
                              shrinkWrap: true,
                              itemBuilder: (context, index) {
                                return GestureDetector(
                                    onTap: () {
                                      // Get.toNamed('/detail', arguments: products[index]);
                                    },
                                    child: Card(
                                        child: Row(children: [
                                      Container(
                                        width: 100,
                                        child: ClipRRect(
                                          borderRadius: BorderRadius.only(
                                              topLeft: Radius.circular(10),
                                              bottomLeft: Radius.circular(10)),
                                          child: Image.network(
                                            API.gambar + data2[index]['gambar'],
                                            fit: BoxFit.contain,
                                          ),
                                        ),
                                      ),
                                      Padding(
                                        padding: const EdgeInsets.all(10.0),
                                        child: Column(
                                          crossAxisAlignment:
                                              CrossAxisAlignment.start,
                                          children: <Widget>[
                                            Container(
                                              height: 25,
                                              child: Text( 
                                                  data2[index]['nama_buku'],
                                                  style: TextStyle(
                                                      color: Colors.black,
                                                      fontSize: 17,
                                                      fontWeight:
                                                          FontWeight.bold,
                                                      fontFamily: 'Mulish')),
                                            ),
                                            SizedBox(
                                              height: 10,
                                            ),
                                            Row(
                                              children: [
                                                Container(
                                                  height: 20,
                                                  margin: EdgeInsets.only(
                                                      bottom: 5),
                                                  child: const Icon(
                                                    Icons.circle_sharp,
                                                    color: Color(0xffE5E5EA),
                                                    size: 20,
                                                  ),
                                                ),
                                                SizedBox(
                                                  width: 11,
                                                ),
                                                Container(
                                                  height: 20,
                                                  margin: EdgeInsets.fromLTRB(
                                                      0, 0, 15, 0),
                                                  child: Text(
                                                      "Semester " +
                                                          data2[index]
                                                              ['semester'],
                                                      style: TextStyle(
                                                          color: Colors.black,
                                                          fontSize: 14,
                                                          fontFamily:
                                                              'Mulish-Regular.ttf')),
                                                )
                                              ],
                                            ),
                                            SizedBox(
                                              height: 10,
                                            ),
                                          ],
                                        ),
                                      )
                                    ])));
                              }),
                    ),
            ),
          ],
        )));
  }
}
