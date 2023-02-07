class Validator {
  static const userNameError = 'กรูณากรอกเลขสมาชิก';
  static const passError = 'กรูณากรอกรหัสผ่าน';
  static const loginError = "เลขสมาชิก หรือรหัสผ่าน ไม่ถูกต้อง";

  static String? passwordValidator(String? password) {
    if (password!.isEmpty) return passError;
    return null;
  }

  static String? userValidator(String? username) {
    if (username!.isEmpty) return userNameError;
    return null;
  }

  static String? loginValidator(bool? login) {
    if (login == false) return loginError;
    return null;
  }
}
