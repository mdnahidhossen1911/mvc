class NumberValidation {
  static String? validatePhoneNumber(String? value) {
    if (value == null || value.trim().isEmpty) {
      return 'Phone number is required.';
    }

    final digitsOnly = value.trim().replaceAll(RegExp(r'[\s\-().+]'), '');

    if (!RegExp(r'^\d+$').hasMatch(digitsOnly)) {
      return 'Phone number must contain digits only.';
    }

    if (digitsOnly.length < 7 || digitsOnly.length > 15) {
      return 'Phone number must be between 7 and 15 digits.';
    }

    return null;
  }
}