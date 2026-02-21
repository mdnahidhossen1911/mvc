import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:mvc/core/dependency/controller_binder.dart';
import 'package:mvc/core/router/app_router.dart';

import 'core/theme/app_theme.dart';

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      initialBinding: ControllerBinder(),
      theme: AppTheme.lightTheme,
      darkTheme: AppTheme.darkTheme,
      themeMode: ThemeMode.light,
      getPages: AppRouter.routes,
      initialRoute: '/',
    );
  }
}
