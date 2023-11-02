import 'package:flutter_test/flutter_test.dart';
import 'package:tdd_01/app/shared/validators/email_validator.dart';

void main() {
  late EmailValidator emailValidator;

  setUp(() {
    emailValidator = EmailValidator();
  });
  group(
    'Validação de E-mail',
    () {
      test('Deve retornar uma mensagem de erro caso o e-mail seja null', () {
        final result = emailValidator.validate();

        expect(result, equals('Campo obrigatório'));
      });

      test('Deve retornar uma mensagem de erro caso o e-mail seja vazio', () {
        final result = emailValidator.validate(email: '');

        expect(result, equals('Campo obrigatório'));
      });

      test('Deve retornar uma mensagem de erro caso o e-mail seja inválido',
          () {
        final result = emailValidator.validate(email: 'email-invalido');

        expect(result, equals('E-mail Inválido'));
      });

      test('Deve retornar null se o e-mail for válido', () {
        final result = emailValidator.validate(email: 'email.teste@gmail.com');

        expect(result, isNull);
      });
    },
  );
}
