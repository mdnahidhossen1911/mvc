import 'package:flutter/material.dart';
import 'package:get/get.dart';

class AppRouter {
  static final routes = [
    GetPage(
      name: '/',
        page: () => const Scaffold(),
      transition: Transition.native,
    ),
  ];
}
