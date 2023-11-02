import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:tdd_01/app/pages/register_page.dart';

void main() {
  group('Testes do campo de e-mail', () {
    testWidgets('Verifica se o campo de e-mail foi renderizado', (tester) async {
      await tester.pumpWidget(const MaterialApp(home: RegisterPage()));
      final emailKey = find.byKey(const Key('email_key'));
      expect(emailKey, findsOneWidget);
    });

    testWidgets('Deve exibir uma snackbar com uma mensagem de erro caso o e-mail seja inválido', (tester) async {
      await tester.pumpWidget(const MaterialApp(home: RegisterPage()));

      final registerButton = find.byKey(const Key('register_button_key'));
      await tester.tap(registerButton);
      await tester.pumpAndSettle();

      expect(find.text('O e-mail é obrigatório'), findsOneWidget);
    });

    testWidgets('Deve mostrar uma snackbar caso o e-mail seja vazio', (tester) async {
      await tester.pumpWidget(const MaterialApp(home: RegisterPage()));

      final emailField = find.byKey(const Key('email_key'));
      await tester.tap(emailField);
      await tester.pumpAndSettle();

      await tester.enterText(emailField, '');
      await tester.pumpAndSettle();

      final registerButton = find.byKey(const Key('register_button_key'));
      await tester.tap(registerButton);
      await tester.pumpAndSettle();

      expect(find.text('O e-mail é obrigatório'), findsOneWidget);
    });

    testWidgets('Deve mostrar uma snackbar caso o e-mail seja invãlido', (tester) async {
      await tester.pumpWidget(const MaterialApp(home: RegisterPage()));

      final emailField = find.byKey(const Key('email_key'));
      await tester.tap(emailField);
      await tester.pumpAndSettle();

      await tester.enterText(emailField, 'email-errado');
      await tester.pumpAndSettle();

      final registerButton = find.byKey(const Key('register_button_key'));
      await tester.tap(registerButton);
      await tester.pumpAndSettle();

      expect(find.text('E-mail Inválido'), findsOneWidget);
    });

    testWidgets('Não deve mostrar nenhuma uma snackbar caso o e-mail seja vãlido', (tester) async {
      await tester.pumpWidget(const MaterialApp(home: RegisterPage()));

      final emailField = find.byKey(const Key('email_key'));
      await tester.tap(emailField);
      await tester.pumpAndSettle();

      await tester.enterText(emailField, 'email-valido@email.com');
      await tester.pumpAndSettle();

      final registerButton = find.byKey(const Key('register_button_key'));
      await tester.tap(registerButton);
      await tester.pumpAndSettle();

      expect(find.text('E-mail Inválido'), findsNothing);
    });
  });

  group('Testes do campo de senha', () {
    testWidgets('Verifica se o campo de senha foi renderizado', (tester) async {
      await tester.pumpWidget(const MaterialApp(home: RegisterPage()));
      final passwordKey = find.byKey(const Key('password_key'));
      expect(passwordKey, findsOneWidget);
    });

    testWidgets('Deve exibir uma snackbar com uma mensagem de erro caso a senha seja inválida', (tester) async {
      await tester.pumpWidget(const MaterialApp(home: RegisterPage()));

      final emailField = find.byKey(const Key('email_key'));
      await tester.tap(emailField);
      await tester.pumpAndSettle();

      await tester.enterText(emailField, 'email-valido@gmail.com');
      await tester.pumpAndSettle();

      final passwordField = find.byKey(const Key('password_key'));
      await tester.tap(passwordField);
      await tester.pumpAndSettle();

      await tester.enterText(passwordField, 'senha-errada');
      await tester.pumpAndSettle();

      final registerButton = find.byKey(const Key('register_button_key'));
      await tester.tap(registerButton);
      await tester.pumpAndSettle();

      expect(find.text('Senha Inválida'), findsOneWidget);
    });

    testWidgets('Deve mostrar uma snackbar caso a senha seja vazia', (tester) async {
      await tester.pumpWidget(const MaterialApp(home: RegisterPage()));

      final emailField = find.byKey(const Key('email_key'));
      await tester.tap(emailField);
      await tester.pumpAndSettle();

      await tester.enterText(emailField, 'email-valido@gmail.com');
      await tester.pumpAndSettle();

      final passwordField = find.byKey(const Key('password_key'));
      await tester.tap(passwordField);
      await tester.pumpAndSettle();

      await tester.enterText(passwordField, '');
      await tester.pumpAndSettle();

      final registerButton = find.byKey(const Key('register_button_key'));
      await tester.tap(registerButton);
      await tester.pumpAndSettle();

      expect(find.text('A senha é obrigatória'), findsOneWidget);
    });

    testWidgets('Não deve mostrar nenhuma snackbar caso e-mail e senha sejam válidos', (tester) async {
      await tester.pumpWidget(const MaterialApp(home: RegisterPage()));

      final emailField = find.byKey(const Key('email_key'));
      await tester.tap(emailField);
      await tester.pumpAndSettle();

      await tester.enterText(emailField, 'email-valido@gmail.com');
      await tester.pumpAndSettle();

      final passwordField = find.byKey(const Key('password_key'));
      await tester.tap(passwordField);
      await tester.pumpAndSettle();

      await tester.enterText(passwordField, 'Senha@forte123');
      await tester.pumpAndSettle();

      final registerButton = find.byKey(const Key('register_button_key'));
      await tester.tap(registerButton);
      await tester.pumpAndSettle();

      expect(find.text('A senha é obrigatória'), findsNothing);
    });
  });

  group('Testes Botão de Cadastro', () {
    testWidgets('Confirmar a renderização do botão de cadastro', (tester) async {
      await tester.pumpWidget(const MaterialApp(home: RegisterPage()));
      final registerButton = find.byKey(const Key('register_button_key'));
      expect(registerButton, findsOneWidget);
    });

    testWidgets('Deve mostrar uma snackbar caso e-mail ou senha sejam invalidos após o clique no botão REGISTRAR',
        (tester) async {
      await tester.pumpWidget(const MaterialApp(home: RegisterPage()));

      final emailField = find.byKey(const Key('email_key'));
      await tester.tap(emailField);
      await tester.pumpAndSettle();

      await tester.enterText(emailField, 'email-valido@gmail.com');
      await tester.pumpAndSettle();

      final passwordField = find.byKey(const Key('password_key'));
      await tester.tap(passwordField);
      await tester.pumpAndSettle();

      await tester.enterText(passwordField, 'senha-invalida');
      await tester.pumpAndSettle();

      final registerButton = find.byKey(const Key('register_button_key'));
      await tester.tap(registerButton);
      await tester.pumpAndSettle();

      expect(find.byType(SnackBar), findsOneWidget);
    });

    testWidgets('Não deve mostrar nenhuma snackbar caso e-mail e senha sejam validos após o clique no botão REGISTRAR',
        (tester) async {
      await tester.pumpWidget(const MaterialApp(home: RegisterPage()));

      final emailField = find.byKey(const Key('email_key'));
      await tester.tap(emailField);
      await tester.pumpAndSettle();

      await tester.enterText(emailField, 'email-valido@gmail.com');
      await tester.pumpAndSettle();

      final passwordField = find.byKey(const Key('password_key'));
      await tester.tap(passwordField);
      await tester.pumpAndSettle();

      await tester.enterText(passwordField, 'Senha@forte123');
      await tester.pumpAndSettle();

      final registerButton = find.byKey(const Key('register_button_key'));
      await tester.tap(registerButton);
      await tester.pumpAndSettle();

      expect(find.byType(SnackBar), findsNothing);
    });
  });
}
