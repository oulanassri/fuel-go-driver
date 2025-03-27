import 'package:get/get.dart';
import '../app/auth/LogIn/login_screen.dart';
import '../app/auth/Splash/splash_screen.dart';
import '../app/home/home_screen.dart';
import '../app/lorry/lorry_screen.dart';
import '../app/orders/orders_screen.dart';
import '../app/profile/profile_screen.dart';
import '../app/settings/settings_screen.dart';
import '../getx_bindings/home_binding.dart';
import '../getx_bindings/login_binding.dart';
import '../getx_bindings/lorry_binding.dart';
import '../getx_bindings/orders_binding.dart';
import '../getx_bindings/profile_binding.dart';
import '../getx_bindings/settings_binding.dart';
import '../getx_bindings/splash_binding.dart';
import 'app_routes.dart';

class AppPages {
  AppPages._();

  static const INITIAL = Routes.SPLASH;
  static final routes = [
    //Splash
    GetPage(
        name: Paths.SPLASH,
        page: () => const SplashScreen(),
        binding: SplashBinding()),
    //LogIn
    GetPage(
        name: Paths.LOGIN,
        page: () =>  LogInScreen(),
        binding: LoginBinding()),




    //Home
    GetPage(
        name: Paths.HOME,
        page: () =>  HomeScreen(),
        binding: HomeBinding()),





    //Orders
    GetPage(
        name: Paths.ORDERS,
        page: () => const OrdersScreen(),
        binding: OrdersBinding()),
    //Profile
    GetPage(
        name: Paths.PROFILE,
        page: () => const ProfileScreen(),
        binding: ProfileBinding()),
    //Lorry
    GetPage(
        name: Paths.LORRY,
        page: () => const LorryScreen(),
        binding: LorryBinding()),
    //Settings
    GetPage(
        name: Paths.SETTINGS,
        page: () => const SettingsScreen(),
        binding: SettingsBinding()),


  ];
}
