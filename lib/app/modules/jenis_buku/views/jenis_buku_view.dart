import 'package:flutter/material.dart';

import 'package:get/get.dart';

import '../controllers/jenis_buku_controller.dart';

class JenisBukuView extends GetView<JenisBukuController> {
  const JenisBukuView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    List<String> image = [
      "image/daftarBuku/ipa.png",
      "image/daftarBuku/ips.png",
      "image/daftarBuku/mtk.png",
      "image/daftarBuku/olahraga.png",
      "image/daftarBuku/senibudaya.png",
    ];
    List<String> stringImage = [
      "IPA",
      "IPS",
      "MTK",
      "Olahraga",
      "SBK",
    ];
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
          title: const Text('Jenis Buku',
              style: TextStyle(fontFamily: 'Mulish-Regular.ttf')),
          centerTitle: true,
        ),
        body: Column(
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
            Expanded(
              child: GridView.builder(
                gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 3,
                  mainAxisSpacing: 2,
                  crossAxisSpacing: 2,
                ),
                itemCount: image.length,
                shrinkWrap: true,
                physics: const ScrollPhysics(),
                itemBuilder: (BuildContext context, int index) {
                  return GestureDetector(
                    onTap: () {},
                    child: Card(
                      shadowColor: Colors.grey[200],
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: [
                          Hero(
                            tag: image[index],
                            child: Container(
                              margin: EdgeInsets.fromLTRB(10, 0, 10, 0),
                              child: Image.asset(
                                image[index],
                                width: 54.0,
                                height: 54.0,
                                fit: BoxFit.contain,
                              ),
                            ),
                          ),
                          Container(
                            margin: EdgeInsets.fromLTRB(10, 0, 10, 0),
                            child: Text("${stringImage[index]}",
                                textAlign: TextAlign.left,
                                style: TextStyle(
                                    color: Colors.black,
                                    fontSize: 14,
                                    fontWeight: FontWeight.bold,
                                    fontFamily: 'Mulish')),
                          ),
                        ],
                      ),
                    ),
                  );
                },
              ),
            )
          ],
        ));
  }
}
