class AppValidators {
  AppValidators._();


  static String? emailValidator(String? email) {
    final RegExp emailRegExp = RegExp(r"""
^[a-zA-Z0-9.a-zA-Z0-9.!#$%&'*+-/=?^_`{|}~]+@[a-zA-Z0-9]+\.[a-zA-Z]+""");
    if (email!.isEmpty) {
      return 'Enter your email';
    } else if (!emailRegExp.hasMatch(email)) {
      return 'Enter valid email';
    }
    return null;
  }
  static String? passwordValidator(String? password) {
    if (password!.isEmpty) {
      return 'Enter password';
    } else if (password.length <= 7) {
      return 'Password should be at least 8 characters';
    }
    return null;
  }
}
