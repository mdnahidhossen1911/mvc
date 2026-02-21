import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:mvc/core/extensions/space_gap.dart';
import 'package:mvc/core/validators/validators.dart';
import 'package:mvc/shared/app_button.dart';
import 'package:mvc/shared/app_text.dart';
import 'package:mvc/shared/lebeled_text_field.dart';
import 'package:mvc/shared/or_divider.dart';
import 'package:mvc/view/auth/sign_up_view.dart';
import 'package:mvc/view/home/home_view.dart';

class SignInView extends StatefulWidget {
  const SignInView({super.key});

  static const String routeName = '/sign-in';

  @override
  State<SignInView> createState() => _SignInViewState();
}

class _SignInViewState extends State<SignInView> {
  final GlobalKey<FormState> formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Sign In')),
      body: Padding(
        padding: const EdgeInsets.all(20),
        child: SingleChildScrollView(
          child: Form(
            key: formKey,
            child: Column(
              children: [
                LabeledTextField(
                  validator: Validator.emailValidation,
                  label: 'Email',
                  hintText: "Enter your email",
                ),
                16.hGap,
                LabeledTextField(
                  validator: Validator.passwordValidation,
                  label: "Password",
                  hintText: "Enter your password",
                  obscureText: true,
                ),
                36.hGap,
                AppButton(
                  onTap: () {
                    if (!formKey.currentState!.validate()) {
                      return;
                    }
                    Get.offAllNamed(HomeView.routeName);
                  },
                  title: "Login",
                ),
                24.hGap,
                OrDivider(),
                24.hGap,
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    AppText("Don't have an account?"),
                    4.wGap,
                    AppText(
                      "Sign Up",
                      color: Theme.of(context).primaryColor,
                      fontWeight: FontWeight.bold,
                      onTap: () {
                        Get.toNamed(SignUpView.routeName);
                      },
                    ),
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
