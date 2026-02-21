import 'package:flutter/material.dart';
import 'package:mvc/shared/app_button.dart';
import 'package:mvc/shared/lebeled_text_field.dart';

import '../../core/extensions/space_gap.dart';
import '../../core/validators/validators.dart';

class SignUpView extends StatefulWidget {
  const SignUpView({super.key});

  static const String routeName = '/sign-up';

  @override
  State<SignUpView> createState() => _SignUpViewState();
}

class _SignUpViewState extends State<SignUpView> {
  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  TextEditingController confirmPasswordController = TextEditingController();

  final GlobalKey<FormState> formKey = GlobalKey<FormState>();


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Sign Up')),
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
                  validator: Validator.phoneNumberValidation,
                  label: 'Phone',
                  hintText: "Enter your phone number",
                ),
                16.hGap,
                LabeledTextField(
                  controller: passwordController,
                  validator: Validator.passwordValidation,
                  label: "Password",
                  hintText: "Enter your password",
                  obscureText: true,
                ),
                16.hGap,
                LabeledTextField(
                  validator: (value) {
                    return Validator.confirmPasswordValidation(
                      value,
                      passwordController.text.trim(),
                    );
                  },
                  label: "Confirm Password",
                  hintText: "Enter your password",
                  obscureText: true,
                ),
                36.hGap,
                AppButton(onTap: () {
                  if (!formKey.currentState!.validate()) {
                    return;
                  }
                }, title: "Sign Up"),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
