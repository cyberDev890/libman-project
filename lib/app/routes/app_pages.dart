import 'package:get/get.dart';

import '../modules/costumer_service/views/costumer_service_view.dart';
import '../modules/daftar_buku/views/daftar_buku_view.dart';
import '../modules/daftar_favorit/views/daftar_favorit_view.dart';
import '../modules/detail/views/detail_view.dart';
import '../modules/home/views/home_view.dart';
import '../modules/jenis_buku/bindings/jenis_buku_binding.dart';
import '../modules/jenis_buku/views/jenis_buku_view.dart';
import '../modules/login/views/login_view.dart';
import '../modules/memerlukan_tindakan/views/memerlukan_tindakan.dart';
import '../modules/models/buku.dart';
import '../modules/profile/views/profile_view.dart';
import '../modules/signUp/views/sign_up_view.dart';
import '../modules/splashScreen/views/splash_screen_view.dart';
import '../modules/tentang_aplikasi/views/tentang_aplikasi_view.dart';

import '../modules/welcome/views/welcome_view.dart';
part 'app_routes.dart';

class AppPages {
  AppPages._();

  static const INITIAL = Routes.SPLASH_SCREEN;

  static final routes = [
    GetPage(
      name: _Paths.HOME,
      page: () => HomeView(),
    ),
    GetPage(
      name: _Paths.LOGIN,
      page: () => LoginView(),
    ),
    GetPage(
      name: _Paths.SPLASH_SCREEN,
      page: () => SplashScreenView(),
    ),
    GetPage(
      name: _Paths.WELCOME,
      page: () => WelcomeView(),
    ),
    GetPage(
      name: _Paths.SIGN_UP,
      page: () => SignUpView(),
    ),
    GetPage(
      name: _Paths.PROFILE,
      page: () => ProfileView(),
    ),
    GetPage(
      name: _Paths.DETAIL,
      page: () => DetailView(product: Get.arguments as Product, listData: {}),
    ),
    GetPage(
      name: _Paths.DAFTAR_FAVORIT,
      page: () => DaftarFavoritView(),
    ),
    GetPage(
      name: _Paths.JENIS_BUKU,
      page: () => const JenisBukuView(),
      binding: JenisBukuBinding(),
    ),
    GetPage(
      name: _Paths.MEMERLUKAN_TINDAKAN,
      page: () => const MemerlukantindakanView(),
    ),
    GetPage(
      name: _Paths.TENTANG_APLIKASI,
      page: () => const TentangAplikasiView(),
    ),
    GetPage(
      name: _Paths.COSTUMER_SERVICE,
      page: () => const CostumerServiceView(),
    ),
    GetPage(
      name: _Paths.DAFTAR_BUKU,
      page: () => const DaftarBukuView(),
    ),
  ];
}
