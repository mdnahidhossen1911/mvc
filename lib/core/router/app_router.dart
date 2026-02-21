import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:mvc/view/auth/sign_in_view.dart';
import 'package:mvc/view/auth/sign_up_view.dart';
import 'package:mvc/view/auth/splash_view.dart';
import 'package:mvc/view/home/home_view.dart';

class AppRouter {
  static final routes = [
    GetPage(
      name: '/',
        page: () => SplashView(),
      transition: Transition.native,
    ),

    GetPage(
      name: SignInView.routeName,
      page: () => SignInView(),
      transition: Transition.native,
    ),

    GetPage(
      name: SignUpView.routeName,
      page: () => SignUpView(),
      transition: Transition.native,
    ),

    GetPage(
      name: HomeView.routeName,
      page: () => HomeView(),
      transition: Transition.native,
    ),
  ];
}
