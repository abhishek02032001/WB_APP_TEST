import 'package:get/get.dart';
import 'package:wmapp/presentation/view/home_screen.dart';
import 'package:wmapp/presentation/view/login_screen.dart';
import 'package:wmapp/presentation/view/otp_screen.dart';
import 'package:wmapp/presentation/view/profile_create_screen.dart';

List<GetPage> routesList = [
  GetPage(
    name: "/login",
    page: () => const LoginScreen(),
    transitionDuration: const Duration(milliseconds: 500),
    transition: Transition.rightToLeftWithFade,
  ),
  GetPage(
    name: "/otp",
    page: () => const OTPScreen(),
    transitionDuration: const Duration(milliseconds: 500),
    transition: Transition.rightToLeftWithFade,
  ),
  GetPage(
    name: "/profileCreate",
    page: () => const ProfileCreateScreen(),
    transitionDuration: const Duration(milliseconds: 500),
    transition: Transition.rightToLeftWithFade,
  ),
  GetPage(
    name: "/home",
    page: () => const HomeScreen(),
    transitionDuration: const Duration(milliseconds: 500),
    transition: Transition.rightToLeftWithFade,
  ),
];
