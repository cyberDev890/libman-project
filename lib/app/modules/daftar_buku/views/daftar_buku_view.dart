import 'package:flutter/material.dart';

import 'package:get/get.dart';
import '../../models/Product.dart';

import '../controllers/daftar_buku_controller.dart';

class DaftarBukuView extends GetView<DaftarBukuController> {
  const DaftarBukuView({Key? key}) : super(key: key);
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
          backgroundColor: Color(0xff0041C4),
          title: Center(
            child: Text('Daftar Buku',
                style: TextStyle(
                    letterSpacing: 0.5,
                    color: Colors.white,
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
              child: ListView.builder(
                  itemCount: products.length,
                  shrinkWrap: true,
                  itemBuilder: (context, index) {
                    return GestureDetector(
                        onTap: () {
                          Get.toNamed('/detail', arguments: products[index]);
                        },
                        child: Card(
                            child: Row(children: [
                          Container(
                            width: 100,
                            child: ClipRRect(
                              borderRadius: BorderRadius.only(
                                  topLeft: Radius.circular(10),
                                  bottomLeft: Radius.circular(10)),
                              child: Image.asset(
                                products[index].image!,
                                fit: BoxFit.contain,
                              ),
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.all(10.0),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: <Widget>[
                                Container(
                                  height: 25,
                                  child: Text(products[index].title!,
                                      style: TextStyle(
                                          color: Colors.black,
                                          fontSize: 17,
                                          fontWeight: FontWeight.bold,
                                          fontFamily: 'Mulish')),
                                ),
                                SizedBox(
                                  height: 10,
                                ),
                                Row(
                                  children: [
                                    Container(
                                      height: 20,
                                      margin: EdgeInsets.only(bottom: 5),
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
                                      margin: EdgeInsets.fromLTRB(0, 0, 15, 0),
                                      child: Text(products[index].semester!,
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
                                TextButton(
                                  style: TextButton.styleFrom(
                                      backgroundColor: Color(0xffFDD6D6)),
                                  onPressed: () {},
                                  child: Text(
                                    "Belum Tersedia",
                                    style: TextStyle(
                                        color: Color(0xff46B094),
                                        fontSize: 14,
                                        fontFamily: 'Mulish-Regular.ttf'),
                                  ),
                                )
                              ],
                            ),
                          )
                        ])));
                  }),
            ),
          ],
        )));
  }
}
