
class EmailValidation {
  static String? emailValidation(String? value) {
    final email = value?.trim() ?? '';

    if (email.isEmpty) return 'Enter your email';

    final regExp = RegExp(
      r"^[a-zA-Z0-9.!#$%&'*+/=?^_`{|}~-]+@[a-zA-Z0-9](?:[a-zA-Z0-9-]{0,253}[a-zA-Z0-9])?(?:\.[a-zA-Z0-9](?:[a-zA-Z0-9-]{0,253}[a-zA-Z0-9])?)*$",
    );

    if (!regExp.hasMatch(email)) return 'Enter your valid email';
    return null;
  }
}