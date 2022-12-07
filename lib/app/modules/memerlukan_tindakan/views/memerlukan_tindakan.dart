import 'package:flutter/material.dart';

import 'package:get/get.dart';

import '../../models/Product.dart';
import '../controllers/memerlukan_tindakan_controller.dart';

class MemerlukantindakanView extends GetView<MemerlukantindakanController> {
  const  MemerlukantindakanView({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          leading: IconButton(
            onPressed: () => Get.back(),
            icon: Icon(Icons.arrow_back_ios_new),
          ),
          actions: [
            IconButton(
              onPressed: () {},
              icon: Icon(Icons.more_vert),
            ),
          ],
          backgroundColor: Color(0xff0041C4),
          title: const Text('Memerlukan Tindakan',
              style: TextStyle(fontFamily: 'Mulish-Regular.ttf')),
          centerTitle: true,
        ),
        body: Column(
          children: [
            Padding(
              padding: EdgeInsets.all(10),
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
            Expanded(
              child: Container(
                padding: EdgeInsets.all(10),
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
                            Container(
                              padding: EdgeInsets.all(10),
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
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
                                    height: MediaQuery.of(context).size.height *
                                        0.01,
                                  ),
                                  Container(
                                    padding: EdgeInsets.all(5),
                                    child: Row(
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
                                          width: MediaQuery.of(context)
                                                  .size
                                                  .width *
                                              0.03,
                                        ),
                                        Container(
                                          margin:
                                              EdgeInsets.fromLTRB(0, 0, 15, 0),
                                          child: Text(products[index].semester!,
                                              style: TextStyle(
                                                  color: Colors.black,
                                                  fontSize: 14,
                                                  fontFamily:
                                                      'Mulish-Regular.ttf')),
                                        )
                                      ],
                                    ),
                                  ),
                                  SizedBox(
                                    height: MediaQuery.of(context).size.height *
                                        0.01,
                                  ),
                                  Container(
                                    height: MediaQuery.of(context).size.height *
                                        0.04,
                                    width: 242,
                                    child: Center(
                                      child: Text(
                                          "Status : Kembalikan sebelum (25 / 12 / 2022)",
                                          style: TextStyle(
                                              color: Colors.black,
                                              fontSize: 11,
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
                            )
                          ])));
                    }),
              ),
            ),
          ],
        ));
  }
}
