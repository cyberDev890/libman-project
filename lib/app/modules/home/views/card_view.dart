import 'package:flutter/material.dart';

import '../../models/buku.dart';

class cardView extends StatefulWidget {
  final Product product1;
  const cardView({super.key, required this.product1});

  @override
  State<cardView> createState() => _cardViewState();
}

class _cardViewState extends State<cardView> {
  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(10),
      ),
      child: Column(
        children: [
          Container(
            padding: EdgeInsets.all(10),
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Container(
                  // margin: EdgeInsets.only(top: 5, left: 12),
                  child: Text(widget.product1.title!,
                      style: TextStyle(
                          color: Colors.black,
                          fontSize: 17,
                          fontWeight: FontWeight.bold,
                          fontFamily: 'Mulish')),
                ),
                Container(
                  margin: EdgeInsets.fromLTRB(100, 0, 0, 0),
                  child: const Icon(
                    Icons.circle_sharp,
                    color: Color(0xffE5E5EA),
                    size: 20,
                  ),
                ),
                Container(
                  // margin: EdgeInsets.fromLTRB(0, 9, 15, 10),
                  child: Text(widget.product1.semester!,
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
            height: MediaQuery.of(context).size.height * 0.030,
            child: Center(
              child: Text("Status : Kembalikan sebelum (25 / 12 / 2022)",
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
          )
        ],
      ),
    );
  }
}
