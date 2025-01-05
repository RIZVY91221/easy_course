import 'package:bs_assignment/features/auth/signin/bindings/login_bindings.dart';
import 'package:bs_assignment/features/auth/signin/presentation/screen_login.dart';
import 'package:bs_assignment/features/creat_post/bindings/create_post_bindings.dart';
import 'package:bs_assignment/features/creat_post/presentation/create_post_screen.dart';
import 'package:bs_assignment/features/home/bindings/home_bindings.dart';
import 'package:bs_assignment/features/home/presentation/home_screen.dart';
import 'package:bs_assignment/features/splash/binding/splash_binding.dart';
import 'package:bs_assignment/features/splash/presentation/splash_screen.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class AppRoutes {
  AppRoutes._();

  //static variables
  static const String INITINAL = '/';
  static const String SIGNUP_SCREEN = '/SIGNUP_SCREEN';
  static const String LOGIN_SCREEN = '/LOGIN_SCREEN';
  static const String HOME_SCREEN = '/HOME_SCREEN';
  static const String CREATE_POST = '/CREATE_POST';

  static final List<GetPage> routes = [
    GetPage(name: INITINAL, page: () => const SplashScreen(), binding: SplashBinding()),
    GetPage(name: LOGIN_SCREEN, page: () => LoginScreen(), binding: LoginBinding()),
    GetPage(name: HOME_SCREEN, page: () => HomeScreen(), binding: HomeBindings()),
    GetPage(name: CREATE_POST, page: () => CreatePostScreen(), binding: CreatePostBindings()),
  ];

  static generateRoute(RouteSettings settings) {
    return GetPageRoute(page: () => _generatePage(settings), binding: _generateBinding(settings));
  }

  static Widget _generatePage(RouteSettings settings) {
    switch (settings.name) {
      default:
        return Container();
    }
  }

  static Bindings? _generateBinding(RouteSettings settings) {
    switch (settings.name) {
      default:
        return null;
    }
  }
}
