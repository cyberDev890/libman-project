import 'package:flutter/material.dart';

import 'package:get/get.dart';

import '../controllers/tentang_aplikasi_controller.dart';

class TentangAplikasiView extends GetView<TentangAplikasiController> {
  const TentangAplikasiView({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          leading: IconButton(
            onPressed: () => Get.back(),
            icon: Icon(Icons.arrow_back_ios_new),
            color: Color(0xffAEAEB2),
          ),
          title: Center(
            child: const Text('Tentang Aplikasi',
                style: TextStyle(
                    color: Colors.black,
                    fontSize: 20,
                    fontFamily: 'Mulish',
                    fontWeight: FontWeight.bold)),
          ),
          elevation: 0,
          backgroundColor: Colors.transparent,
          actions: [
            IconButton(
                onPressed: () {},
                icon: Icon(Icons.search),
                color: Colors.white),
          ],
        ),
        body: Padding(
          padding: const EdgeInsets.all(20),
          child: Column(
            children: [
              Container(
                margin: const EdgeInsets.only(top: 20),
                child: const Image(
                  image: AssetImage('image/gambar/logo2.png'),
                  width: 100,
                  height: 100,
                ),
              ),
              SizedBox(height: MediaQuery.of(context).size.height * 0.03),
              Container(
                child: Text(
                  "Libman School",
                  style: TextStyle(
                      fontSize: 20,
                      fontFamily: 'Mulish',
                      fontWeight: FontWeight.bold),
                ),
              ),
              SizedBox(height: MediaQuery.of(context).size.height * 0.03),
              Expanded(
                  child: ListView(children: [
                Container(
                  child: Text(
                    textAlign: TextAlign.justify,
                    """
                  Libman School merupakan sebuah aplikasi manajemen perpustakaan yang berfungsi untuk memudahkan penggunanya untuk mengatur segala aktivitas di dalam perpustakaan secara cepat dan efisien.  Libman School berasal dari pengertian dari keseluruhan fungsi aplikasi ini, Kata awal “Lib” kami ambil dari kata “Library” yang berarti perpustakaan dan “Man” kami ambildari kata “Management” yang berarti pengelolaan. 
                  Aplikasi ini kami rancang dengan dua jenis versi yaitu mobile dan website, Keduanya memiliki fungsi berbeda namun saling melengkapi. Website digunakan oleh admin untuk melakukan manajemen dan mengolah data dalam perpustakaan, sedangkan Mobile diperuntukan untuk pengguna kalangan umum untuk melakukan transasksi peminjaman dan pengembalian buku.        
                  Selain fitur utama dalam website yang disebutkan di atas, kami juga menyediakan bebagai fitur yang dapat memudahkan dan mempercepat kineja admin dalam mengelola data seperti eksport dan import dari file PDF, Ecel, atau TXT, Scan Barcode cerdas menggunakan kartu perpustakaan dalam melakukan Transaksi, Selain itu admin juga dapat mengedit database secara real time dengan mudah dan cepat. Dalam versi mobile juga memiliki berbagai fitur yang menarik dan mudah digunakan oleh pengguna, seperti fitur pemberithuan memerlukan tindakan yang berfungsi untuk memperlihatkan pengguna mengenai status batas waktu peminjaman agar pengguna tidak melewati batas peminjaman buku. Selain itu juga ada fitur tambah favorite yang berfungsi untuk menambahkan buku ke daftar favorite sebagai pengingat buku yang akan dipinjam di kemudian hari tanpa harus mencarinya kembali.""",
                    style: TextStyle(
                      fontSize: 13,
                      fontFamily: 'Mulish-Regular',
                      color: Colors.grey,
                    ),
                  ),
                ),
              ])),
            ],
          ),
        ));
  }
}
