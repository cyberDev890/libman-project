import 'package:flutter/material.dart';

import 'package:get/get.dart';

import '../controllers/costumer_service_controller.dart';

class CostumerServiceView extends GetView<CostumerServiceController> {
  const CostumerServiceView({Key? key}) : super(key: key);
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
            child: const Text('Customer Service',
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
Jika mengalami kendala dalam penggunaan aplikasi
anda dapat menghubungi beberapa CS berikut :

No :
+62 856 9555 0432 ( GG Project Company )

Website :
www.ggproject.com

Email :
ggproject@gmail.com

                  """,
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
