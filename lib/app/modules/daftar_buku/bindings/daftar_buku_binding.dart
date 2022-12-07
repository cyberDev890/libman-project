import 'package:get/get.dart';

import '../controllers/daftar_buku_controller.dart';

class DaftarBukuBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<DaftarBukuController>(
      () => DaftarBukuController(),
    );
  }
}
