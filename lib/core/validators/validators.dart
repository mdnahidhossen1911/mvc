import 'validation/email_validation.dart';
import 'validation/number_validation.dart';
import 'validation/password_validation.dart';

class Validator {
  static String? emailValidation(String? value) {
    return EmailValidation.emailValidation(value);
  }

  static String? passwordValidation(String? value) {
    return PasswordValidation.validatePassword(value);
  }

  static String? confirmPasswordValidation(String? value, String password) {
    return PasswordValidation.validateConfirmPassword(value, password);
  }

  static String? phoneNumberValidation(String? value) {
    return NumberValidation.validatePhoneNumber(value);
  }
}
