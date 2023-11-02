class EmailValidator {
  String? validate({String? email}) {
    if (email == null || email.isEmpty) {
      return 'O e-mail é obrigatório';
    }
    final emailValidationRegex = RegExp(
        r'^.+@[a-zA-Z]+\.{1}[a-zA-Z]+(\.{0,1}[a-zA-Z]+)$',
        caseSensitive: false);
    if (!emailValidationRegex.hasMatch(email)) {
      return 'E-mail Inválido';
    }
    return null;
  }
}
