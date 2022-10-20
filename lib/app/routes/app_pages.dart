import 'package:get/get.dart';

import 'package:libman/app/modules/home/bindings/home_binding.dart';
import 'package:libman/app/modules/home/views/home_view.dart';
import 'package:libman/app/modules/login/bindings/login_binding.dart';
import 'package:libman/app/modules/login/views/login_view.dart';
import 'package:libman/app/modules/profile/bindings/profile_binding.dart';
import 'package:libman/app/modules/profile/views/profile_view.dart';
import 'package:libman/app/modules/signUp/bindings/sign_up_binding.dart';
import 'package:libman/app/modules/signUp/views/sign_up_view.dart';
import 'package:libman/app/modules/splashScreen/bindings/splash_screen_binding.dart';
import 'package:libman/app/modules/splashScreen/views/splash_screen_view.dart';
import 'package:libman/app/modules/welcome/bindings/welcome_binding.dart';
import 'package:libman/app/modules/welcome/views/welcome_view.dart';

part 'app_routes.dart';

class AppPages {
  AppPages._();

  static const INITIAL = Routes.LOGIN;

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
  ];
}
