import 'package:med_alert/core/resources/strings.dart';

class Validator {
  static String? validateField(String? value) {
    if (value == '') {
      return ValidationMessages.requiredField;
    }
    return null;
  }

  static String? validateEmail(String email) {
    final emailRegex = RegExp(ValidationRegex.emailRegex);

    if (email == '') {
      return ValidationMessages.emailRequired;
    } else if (!emailRegex.hasMatch(email)) {
      return ValidationMessages.emailInvalid;
    }
    return null;
  }

  static String? validatePassword(String password) {
    RegExp regExp = RegExp(ValidationRegex.passwordRegex);
    if (password == '') {
      return ValidationMessages.passwordRequired;
    } else if (password.length < 8) {
      return ValidationMessages.passwordLength;
    } else if (!regExp.hasMatch(password)) {
      return ValidationMessages.passwordPattern;
    }
    return null;
  }

  static String? validateConfirmPassword(String value, String? password) {
    if (value != password || value == '') {
      return ValidationMessages.confirmPassword;
    }
    return null;
  }

  static String? validateUsername(String value) {
    if (value == '') {
      return ValidationMessages.usernameRequired;
    }
    return null;
  }
}
