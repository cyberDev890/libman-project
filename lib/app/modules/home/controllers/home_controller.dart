import 'package:get/get.dart';
import 'package:libman/app/modules/models/model_test.dart';

import '../../api/connectedApi.dart';

class HomeController extends GetxController {
  // var arguments = Get.arguments;

  // Data get userData => arguments[0];
  // String? get userName => userData.namaSiswa;
  // String? get nis => userData.nis;

  final count = 0.obs;
  @override
  void onInit() {
    super.onInit();
  }

  @override
  void onReady() {
    super.onReady();
  }

  @override
  void onClose() {}
  void increment() => count.value++;
}
