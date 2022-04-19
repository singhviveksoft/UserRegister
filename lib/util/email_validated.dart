mixin InputValidationMixin {
  bool isPasswordValid(String password) => password.length == 6;

  bool isMobileValid(String nos) => nos.length == 10;
  bool isPinCodeValid(String nos) => nos.length == 6;

  bool isNameValid(String name) => name.length > 3;
  bool isEmptyValid(String name) => name.isEmpty ;
  bool validatePassword(String value) {
    RegExp regex =
    RegExp(r'^(?=.*?[A-Z])(?=.*?[a-z])(?=.*?[0-9])(?=.*?[!@#\$&*~]).{8,}$');
    if (value.isEmpty) {
      return true;
    } else {
      if (!regex.hasMatch(value)) {
        return true;
      } else {
        return false;
      }
    }
  }



  bool isEmailValid(String email) {
    bool emailValid = RegExp(
            r"^[a-zA-Z0-9.a-zA-Z0-9.!#$%&'*+-/=?^_`{|}~]+@[a-zA-Z0-9]+\.[a-zA-Z]+")
        .hasMatch(email);
    return emailValid;
  }
}
