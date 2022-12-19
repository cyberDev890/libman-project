import 'package:get/get.dart';

import '../modules/costumer_service/bindings/costumer_service_binding.dart';
import '../modules/costumer_service/views/costumer_service_view.dart';
import '../modules/daftar_buku/bindings/daftar_buku_binding.dart';
import '../modules/daftar_buku/views/daftar_buku_view.dart';
import '../modules/daftar_favorit/bindings/daftar_favorit_binding.dart';
import '../modules/daftar_favorit/views/daftar_favorit_view.dart';
import '../modules/detail/bindings/detail_binding.dart';
import '../modules/detail/views/detail_view.dart';
import '../modules/home/bindings/home_binding.dart';
import '../modules/home/views/home_view.dart';
import '../modules/jenis_buku/bindings/jenis_buku_binding.dart';
import '../modules/jenis_buku/views/jenis_buku_view.dart';
import '../modules/login/bindings/login_binding.dart';
import '../modules/login/views/login_view.dart';
import '../modules/memerlukan_tindakan/bindings/memerlukan_tindakan_binding.dart';
import '../modules/memerlukan_tindakan/views/memerlukan_tindakan.dart';
import '../modules/models/Product.dart';
import '../modules/profile/bindings/profile_binding.dart';
import '../modules/profile/views/profile_view.dart';
import '../modules/signUp/bindings/sign_up_binding.dart';
import '../modules/signUp/views/sign_up_view.dart';
import '../modules/splashScreen/bindings/splash_screen_binding.dart';
import '../modules/splashScreen/views/splash_screen_view.dart';
import '../modules/tentang_aplikasi/bindings/tentang_aplikasi_binding.dart';
import '../modules/tentang_aplikasi/views/tentang_aplikasi_view.dart';
import '../modules/welcome/bindings/welcome_binding.dart';
import '../modules/welcome/views/welcome_view.dart';
part 'app_routes.dart';

class AppPages {
  AppPages._();

  static const INITIAL = Routes.SPLASH_SCREEN;

  static final routes = [
    GetPage(
      name: _Paths.HOME,
      page: () => HomeView(),
      binding: HomeBinding(),
    ),
    GetPage(
      name: _Paths.LOGIN,
      page: () => LoginView(),
      binding: LoginBinding(),
    ),
    GetPage(
      name: _Paths.SPLASH_SCREEN,
      page: () => SplashScreenView(),
      binding: SplashScreenBinding(),
    ),
    GetPage(
      name: _Paths.WELCOME,
      page: () => WelcomeView(),
      binding: WelcomeBinding(),
    ),
    GetPage(
      name: _Paths.SIGN_UP,
      page: () => SignUpView(),
      binding: SignUpBinding(),
    ),
    GetPage(
      name: _Paths.PROFILE,
      page: () => ProfileView(),
      binding: ProfileBinding(),
    ),
    GetPage(
      name: _Paths.DETAIL,
      page: () => DetailView(product: Get.arguments as Product),
      binding: DetailBinding(),
    ),
    GetPage(
      name: _Paths.DAFTAR_FAVORIT,
      page: () => DaftarFavoritView(),
      binding: DaftarFavoritBinding(),
    ),
    GetPage(
      name: _Paths.JENIS_BUKU,
      page: () => const JenisBukuView(),
      binding: JenisBukuBinding(),
    ),
    GetPage(
      name: _Paths.MEMERLUKAN_TINDAKAN,
      page: () => const MemerlukantindakanView(),
      binding: MemerlukantindakanBinding(),
    ),
    GetPage(
      name: _Paths.TENTANG_APLIKASI,
      page: () => const TentangAplikasiView(),
      binding: TentangAplikasiBinding(),
    ),
    GetPage(
      name: _Paths.COSTUMER_SERVICE,
      page: () => const CostumerServiceView(),
      binding: CostumerServiceBinding(),
    ),
    GetPage(
      name: _Paths.DAFTAR_BUKU,
      page: () => const DaftarBukuView(),
      binding: DaftarBukuBinding(),
    ),
  ];
}
