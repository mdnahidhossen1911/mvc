import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:mvc/controller/credential/credential_controller.dart';
import 'package:mvc/view/auth/sign_in_view.dart';
import 'package:mvc/view/home/home_view.dart';

class SplashView extends StatefulWidget {
  const SplashView({super.key});

    static const String routeName = '/';

  @override
  State<SplashView> createState() => _SplashViewState();
}

class _SplashViewState extends State<SplashView> {
  final CredentialController credentialController =
      Get.find<CredentialController>();

  @override
  void initState() {
    super.initState();
    navigateToNextScreen();
  }

  Future<void> navigateToNextScreen() async {
    bool isLogin = await credentialController.isUserLoggedIn();
    if (isLogin) {
      Get.offNamed(HomeView.routeName);
    } else {
      Get.offNamed(SignInView.routeName);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Text(
          'Splash Screen',
          style: Theme.of(context).textTheme.headlineMedium,
        ),
      ),
    );
  }
}
