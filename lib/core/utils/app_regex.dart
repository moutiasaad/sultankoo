class AppRegex {
  static bool isEmailValid(String email) {
    return RegExp(
      r'^[a-zA-Z0-9._%+-]+@[a-zA-Z0-9.-]+\.[a-zA-Z]{2,}$',
    ).hasMatch(email);
  }

  static bool isPhoneNumberValid(String phoneNumber) {
    return RegExp(r'^\+?[0-9\s\-\(\)]{7,15}$').hasMatch(phoneNumber);
  }
}
