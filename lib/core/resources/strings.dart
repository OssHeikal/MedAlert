class AppStrings {
  // Authentication
  static const String welcomeTitle = 'Take control of your health';
  static const String welcomeDescription =
      'Manage your medications, receive intelligent reminders, and stay on top of your health';

  static const String login = 'Login';
  static const String loginTitle = 'Hello again!';
  static const String loginDescription = 'Welcome back, you\'ve\nbeen missed!';

  static const String register = 'Register';
  static const String signUp = 'Sign Up';
  static const String registerTitle = 'Create an account';
  static const String registerDescription =
      'Please fill in the form below to\ncreate an account.';

  static const String usernameHint = 'Enter your name';
  static const String emailHint = 'Enter your email';
  static const String passwordHint = 'Password';
  static const String confirmPasswordHint = 'Confirm Password';

  static const String forgotPassword = 'Forgot password?';
  static const String notMemberYet = 'Not a member yet?';
  static const String registerNow = 'Register now';
  static const String alreadyHaveAcc = 'Already have an account?';
  static const String loginNow = 'Login now';

  // Medicine
  static const String noMedicines = 'No medicines for this day';
  static const String noDispensers = 'No dispensers available';
}

class ValidationMessages {
  static const String emailRequired = 'Email is required';
  static const String emailInvalid = 'Invalid Email Format';
  static const String passwordRequired = 'Password is required';
  static const String passwordLength = 'at least 8 characters.';
  static const String passwordPattern =
      'Ensure password contains both upper and lowercases, numbers, and special characters';
  static const String confirmPassword = 'Password does not match.';
  static const String usernameRequired = 'Username is required.';
  static const String requiredField = 'This field is required.';
}

class ValidationRegex {
  static const String emailRegex =
      r'^[\w-]+(\.[\w-]+)*@([\w-]+\.)+[a-zA-Z]{2,7}$';
  static const String passwordRegex =
      r'^(?=.*?[A-Z])(?=.*?[a-z])(?=.*?[0-9])(?=.*?[!@#\$&*~]).{8,}$';
}
