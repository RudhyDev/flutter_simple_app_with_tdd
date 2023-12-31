import 'package:tdd_01/app/shared/validators/email_validator.dart';
import 'package:tdd_01/app/shared/validators/password_validator.dart';

class Auth {
  register(String? email, String? password) {
    final emailError = EmailValidator().validate(email: email);
    final passwordError = PasswordValidator().validate(password: password);

    return emailError ?? passwordError;
  }
}