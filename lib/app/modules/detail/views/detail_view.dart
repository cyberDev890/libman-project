import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:rflutter_alert/rflutter_alert.dart';

import '../../models/buku.dart';
import '../controllers/detail_controller.dart';

class DetailView extends GetView<DetailController> {
  const DetailView({Key? key, required this.product, required this.listData})
      : super(key: key);
  final Product product;
  final Map listData;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.transparent,
          elevation: 0,
          leading: IconButton(
            icon: Icon(
              Icons.arrow_back_ios_new,
              color: Colors.black,
            ),
            onPressed: () {
              Get.back();
            },
          ),
        ),
        body: SingleChildScrollView(
          child: Padding(
              padding: const EdgeInsets.all(10),
              child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Container(
                      height: 280,
                      width: 200,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(10),
                        color: Colors.white,
                      ),
                      child: Hero(
                        tag: product.image!,
                        child: ClipRRect(
                          borderRadius: BorderRadius.circular(10),
                          child: Image.asset(
                            product.image!,
                            fit: BoxFit.contain,
                          ),
                        ),
                      ),
                    ),
                    SizedBox(height: MediaQuery.of(context).size.height * 0.02),
                    Container(
                      height: 30,
                      child: Text(
                        listData['nama_buku'],
                        style: TextStyle(
                            letterSpacing: 0.5,
                            fontSize: 20,
                            fontWeight: FontWeight.bold,
                            fontFamily: 'Mulish-Regular.ttf'),
                      ),
                    ),
                    SizedBox(height: MediaQuery.of(context).size.height * 0.02),
                    Row(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Container(
                          child: const Icon(
                            Icons.auto_stories_outlined,
                            size: 20,
                          ),
                        ),
                        const SizedBox(
                          width: 15,
                        ),
                        Container(
                          child: Text(
                            listData['jumlah'],
                            style: TextStyle(
                                color: Color(0xff8A8A8E),
                                letterSpacing: 0.5,
                                fontSize: 14,
                                fontFamily: 'Mulish-Regular.ttf'),
                          ),
                        ),
                        const SizedBox(
                          width: 15,
                        ),
                        Container(
                            height: 20,
                            child: VerticalDivider(
                              color: Color(0xff8A8A8E),
                              thickness: 2,
                            )),
                        const SizedBox(
                          width: 15,
                        ),
                        Container(
                          child: Text(
                            "Semester" + listData['semester'],
                            style: TextStyle(
                                color: Color(0xff8A8A8E),
                                letterSpacing: 0.5,
                                fontSize: 14,
                                fontFamily: 'Mulish-Regular.ttf'),
                          ),
                        ),
                        const SizedBox(
                          width: 15,
                        ),
                        Container(
                            height: 20,
                            child: VerticalDivider(
                              color: Color(0xff8A8A8E),
                              thickness: 2,
                            )),
                        const SizedBox(
                          width: 10,
                        ),
                        Container(
                          width: 125,
                          child: Text(
                            "Kelas " + listData['tingkatan'],
                            style: TextStyle(
                                color: Color(0xff8A8A8E),
                                fontSize: 14,
                                fontFamily: 'Mulish-Regular.ttf'),
                          ),
                        ),
                      ],
                    ),
                    Divider(
                      color: Color(0xffE5E5EA),
                      thickness: 2,
                    ),
                    SizedBox(height: MediaQuery.of(context).size.height * 0.02),
                    Container(
                      height: MediaQuery.of(context).size.height * 0.030,
                      child: Text(
                        listData['nama_buku'],
                        style: TextStyle(
                            fontSize: 16, fontFamily: 'Mulish-Regular.ttf'),
                      ),
                    ),
                    SizedBox(height: MediaQuery.of(context).size.height * 0.01),
                    Container(
                      child: Text(
                        product.description!,
                        style: TextStyle(
                          fontSize: 14,
                          fontFamily: 'Mulish-Regular.ttf',
                          color: Color(0xff8A8A8E),
                        ),
                      ),
                    ),
                    SizedBox(height: MediaQuery.of(context).size.height * 0.02),
                    Divider(
                      color: Color(0xffE5E5EA),
                      thickness: 2,
                    ),
                    SizedBox(height: MediaQuery.of(context).size.height * 0.10),
                    ListTile(
                      onTap: () {
                        Alert(
                          context: context,
                          type: AlertType.success,
                          title: "Berhasil !",
                          desc: "Buku telah ditambahkan ke favorite",
                          buttons: [
                            DialogButton(
                              child: Text(
                                textAlign: TextAlign.center,
                                "Tetap di halaman",
                                style: TextStyle(
                                    color: Color(0xffB2B2B6),
                                    fontSize: 17,
                                    fontFamily: 'Mulish-Regular.ttf'),
                              ),
                              onPressed: () => Get.back(),
                              color: Colors.white,
                            ),
                            DialogButton(
                              child: Text(
                                textAlign: TextAlign.center,
                                "Lihat Daftar Favorite",
                                style: TextStyle(
                                    color: Colors.white,
                                    fontSize: 17,
                                    fontFamily: 'Mulish-Regular.ttf'),
                              ),
                              onPressed: () => Get.toNamed('/daftar-favorit'),
                              color: Color(0xff00C443),
                            ),
                          ],
                        ).show();
                      },
                      leading: CircleAvatar(
                        radius: 20,
                        backgroundColor: Color(0xffE5E5EA),
                        child: Icon(
                          Icons.data_saver_on,
                          color: Color(0xff0B48BB),
                          size: 40,
                        ),
                      ),
                      title: Text(
                        'Tambahkan ke Favorite',
                        style: TextStyle(
                          fontSize: 14,
                          fontFamily: 'Mulish-Regular.ttf',
                          color: Color(0xff0B48BB),
                        ),
                      ),
                      subtitle: Text(
                        'Untuk menjadikannya daftar keinginan dikemudian hari',
                        style: TextStyle(
                          fontSize: 12,
                          fontFamily: 'Mulish-Regular.ttf',
                          color: Color(0xff8A8A8E),
                        ),
                      ),
                    ),
                  ])),
        ));
  }
}
