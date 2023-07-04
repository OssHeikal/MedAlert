class AppMessages {
  static const String loginFailed = 'Login failed.';
  static const String userNotFound =
      'User not found, or the provided email and password does not match.';
  static const String userExists =
      'The provided email is already in use. Please use a different email.';
  static const String regiserationFailed = 'Sign up failed.';
  static const String emailPasswordMismatch =
      'The email or password provided does not match. Please try again.';
  static const String noInternetConnection =
      'No internet connection. Please check your network settings and try again.';

  static const String failedToLoadMedicines = 'Failed to load medicines.';

  static String getMedicineNotificationMessage(
      int dose, String medicineName, String medicineType) {
    return 'It\'s time to take $dose $medicineType of $medicineName.';
  }
}
