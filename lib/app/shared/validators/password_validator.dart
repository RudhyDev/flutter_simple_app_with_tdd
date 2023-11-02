class PasswordValidator {
  String? validate({String? password}) {
    if (password == null || password.isEmpty) {
      return 'A senha é obrigatória';
    }

    final passwordValidationRegex =
        RegExp(r'^(?=.*?[A-Z])(?=.*?[a-z])(?=.*?[0-9])(?=.*?[!@#\$&*~]).{8,}$');
    if (!passwordValidationRegex.hasMatch(password)) {
      return 'Senha Inválida';
    }
    return null;
  }
}