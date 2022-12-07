import 'package:get/get.dart';

class ProfileController extends GetxController {
  var isProficPicPathSet = false.obs;
  var profilePicPath = "".obs;

  void setProfileImage(String path) {
    profilePicPath.value = path;
    isProficPicPathSet.value = true;
  }   

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
}
