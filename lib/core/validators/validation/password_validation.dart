class PasswordValidation {

  static String? validatePassword(String? value) {
    if (value == null || value.isEmpty) {
      return 'Enter your password';
    }
    if (value.length < 8) {
      return 'Password must be at least 8 characters long';
    }
    if (!RegExp(r'[A-Z]').hasMatch(value)) {
      return 'Password must contain at least one uppercase letter';
    }
    if (!RegExp(r'[a-z]').hasMatch(value)) {
      return 'Password must contain at least one lowercase letter';
    }
    if (!RegExp(r'[0-9]').hasMatch(value)) {
      return 'Password must contain at least one digit';
    }
    if (!RegExp(r'[!@#$%^&*(),.?":{}|<>]').hasMatch(value)) {
      return 'Password must contain at least one special character';
    }
    return null; // Password is valid
  }

  static String? validateConfirmPassword(String? confirmPassword,String? password) {
    if (confirmPassword == null || confirmPassword.isEmpty) {
      return ' Enter your confirm password';
    }
    if (password != confirmPassword) {
      return 'Passwords do not match';
    }
    return null;
  }

}