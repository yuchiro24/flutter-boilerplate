class Validator {
  Validator._();

  static bool isValidPassword(String password) {
    return password.length >= 8;
  }

  static bool isValidPasswordConfirm(String password, String passwordConfirm) {
    return password == passwordConfirm;
  }

  static bool isValidEmail(String email) {
    const emailRegExpString = r'[a-zA-Z0-9\+\.\_\%\-\+]{1,256}\@[a-zA-Z0-9]'
        r'[a-zA-Z0-9\-]{0,64}(\.[a-zA-Z0-9][a-zA-Z0-9\-]{0,25})+';
    return RegExp(emailRegExpString, caseSensitive: false).hasMatch(email);
  }

  static bool isValidPin(String pin) {
    const pinRegExpString = r'[0-9]{6}';
    return RegExp(pinRegExpString, caseSensitive: false).hasMatch(pin);
  }

  static bool isValidSendPoint(int point, int senderPoint) {
    return point > 0 && point <= senderPoint;
  }

  static bool isValidString(String value) => value.isNotEmpty;

  static bool isValid(dynamic value) => value != null;
}
