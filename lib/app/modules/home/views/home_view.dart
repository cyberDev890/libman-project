import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:libman/app/modules/home/views/card_view.dart';
import 'package:libman/app/modules/models/Product.dart';
import 'package:libman/app/routes/app_pages.dart';

import '../../api/connectedApi.dart';
import '../controllers/home_controller.dart';
import './drawerScreen.dart';
import 'item_card.dart';
import 'navbar.dart';

class HomeView extends GetView<HomeController> {
  final VoidCallback? signOut;

  HomeView({Key? key, this.signOut}) : super(key: key);
  final scaffoldKey = GlobalKey<ScaffoldState>();
  HomeController homeController = Get.put(HomeController());
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        key: scaffoldKey,
        appBar: appbar(),
        drawer: DrawerScreen(
          signOut: () {
            signOut!();
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
                        Get.toNamed(Routes.JENIS_BUKU);
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
              cardView(),
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
                child: GridView.builder(
                  shrinkWrap: true,
                  padding: EdgeInsets.all(10),
                  gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                      crossAxisCount: 2,
                      mainAxisSpacing: 20,
                      crossAxisSpacing: 20,
                      childAspectRatio: 0.65),
                  itemCount: products.length,
                  itemBuilder: (context, index) {
                    return ItemCard(
                      product: products[index],
                    );
                  },
                ),
              ),
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
