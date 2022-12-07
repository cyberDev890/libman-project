import 'package:get/get.dart';

import '../controllers/daftar_favorit_controller.dart';

class DaftarFavoritBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<DaftarFavoritController>(
      () => DaftarFavoritController(),
    );
  }
}
