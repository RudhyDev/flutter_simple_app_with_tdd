import 'package:flutter_test/flutter_test.dart';
import 'package:tdd_01/app/shared/auth/auth_service.dart';

void main() {
  late Auth auth;

  setUp(() {
    auth = Auth();
  });
  group('Validação de Cadastro', () {
    test('deve retornar uma mensagem quando e-mail e senhas forem invalidos',
        () {
      final result = auth.register('email', 'password');

      expect(result, isA<String>());
    });

    test('deve retornar null quando e-mail e senhas forem válidos', () {
      final result = auth.register('email.valido@gmail.com', 'Pass@1234');

      expect(result, isNull);
    });
  });
}
