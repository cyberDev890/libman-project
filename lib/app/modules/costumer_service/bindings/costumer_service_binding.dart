import 'package:get/get.dart';

import '../controllers/costumer_service_controller.dart';

class CostumerServiceBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<CostumerServiceController>(
      () => CostumerServiceController(),
    );
  }
}
