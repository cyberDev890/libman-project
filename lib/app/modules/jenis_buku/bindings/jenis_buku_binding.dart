import 'package:get/get.dart';

import '../controllers/jenis_buku_controller.dart';

class JenisBukuBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<JenisBukuController>(
      () => JenisBukuController(),
    );
  }
}
