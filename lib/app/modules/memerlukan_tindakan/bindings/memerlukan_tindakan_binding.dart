import 'package:get/get.dart';

import '../controllers/memerlukan_tindakan_controller.dart';

class  MemerlukantindakanBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut< MemerlukantindakanController>(
      () => MemerlukantindakanController(),
    );
  }
}
