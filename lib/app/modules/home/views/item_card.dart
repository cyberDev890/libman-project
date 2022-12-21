import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:shared_preferences/shared_preferences.dart';

import '../../api/api.dart';
import '../../models/buku.dart';

class ItemCard extends StatefulWidget {
  final Product product;

  ItemCard({
    Key? key,
    required this.product,
  }) : super(key: key);

  @override
  State<ItemCard> createState() => _ItemCardState();
}

class _ItemCardState extends State<ItemCard> {
  // String? nis = '0001';

  // getPref() async {
  //   SharedPreferences preferences = await SharedPreferences.getInstance();
  //   setState(() {
  //     nis = preferences.getString("NIS");
  //   });
  // }

  // List data1 = [];

  // Future getData() async {
  //   var response = await http.get(Uri.parse(API.history + '0909'));
  //   var data = json.decode(response.body);
  //   setState(() {
  //     data1 = data;
  //   });
  // }

  // @override
  // void initState() {
  //   getPref();
  //   getData();
  //   super.initState();
  // }

  @override
  Widget build(BuildContext context) {
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
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            Expanded(
              child: Container(
                child: Stack(
                  fit: StackFit.expand,
                  children: [
                    ClipRRect(
                      borderRadius: BorderRadius.circular(8),
                      child: Image.asset(
                        widget.product.image!,
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
                  widget.product.title!,
                  style: TextStyle(
                    fontFamily: 'Mulish-SemiBold.ttf',
                    fontSize: 16,
                  ),
                )),
            Container(
                margin: EdgeInsets.only(left: 10, bottom: 0),
                child: Text(
                  widget.product.semester!,
                  style: TextStyle(
                    color: Color(0xff8A8A8E),
                    fontFamily: 'Mulish',
                    fontSize: 12,
                  ),
                )),
            Row(
              crossAxisAlignment: CrossAxisAlignment.end,
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                Container(
                  margin: EdgeInsets.fromLTRB(7, 0, 10, 0),
                  child: Image(image: AssetImage('image/gambar/iconsStar.png')),
                ),
                Container(
                  padding: EdgeInsets.only(),
                  margin: EdgeInsets.fromLTRB(3, 0, 10, 0),
                  child: Text(
                    '20/11/2023',
                    style: TextStyle(
                      color: Color(0xff8A8A8E),
                      fontWeight: FontWeight.bold,
                      fontSize: 12,
                      fontFamily: 'Mulish',
                    ),
                  ),
                ),
                Container(
                  margin: EdgeInsets.fromLTRB(20, 0, 6, 0),
                  child: Image(image: AssetImage('image/gambar/Logobuku.png')),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
