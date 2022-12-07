import 'package:get/get.dart';

import '../controllers/tentang_aplikasi_controller.dart';

class TentangAplikasiBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<TentangAplikasiController>(
      () => TentangAplikasiController(),
    );
  }
}
