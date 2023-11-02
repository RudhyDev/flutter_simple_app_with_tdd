import 'package:flutter_test/flutter_test.dart';
import 'package:tdd_01/app/shared/validators/password_validator.dart';

void main() {
  late PasswordValidator passwordValidator;

  setUp(() {
    passwordValidator = PasswordValidator();
  });
  group('Validar Senha', () {
    test('Deve retornar mensagem de erro caso a senha seja nula', () {
      final result = passwordValidator.validate();

      expect(result, equals('Campo obrigatório'));
    });

    test('Deve retornar mensagem de erro caso a senha seja vazia', () {
      final result = passwordValidator.validate(password: '');

      expect(result, equals('Campo obrigatório'));
    });

    test('Deve retornar mensagem de erro se a senha for inválida', () {
      final result = passwordValidator.validate(password: '123456');

      expect(result, equals('Senha Inválida'));
    });

    test('Deve retornar null se a senha for válida', () {
      final result = passwordValidator.validate(password: 'Senha@teste123');

      expect(result, isNull);
    });
  });
}
