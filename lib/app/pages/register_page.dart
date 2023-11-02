import 'package:flutter/material.dart';
import 'package:tdd_01/app/shared/auth/auth_service.dart';

class RegisterPage extends StatefulWidget {
  const RegisterPage({Key? key}) : super(key: key);

  @override
  State<RegisterPage> createState() => _RegisterPageState();
}

class _RegisterPageState extends State<RegisterPage> {
  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();

  final Auth _auth = Auth();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text('App com TDD'),
        ),
        body: SingleChildScrollView(
          padding: const EdgeInsets.all(16),
          child:
              Column(crossAxisAlignment: CrossAxisAlignment.stretch, children: [
            TextFormField(
              key: const Key('email_key'),
              controller: emailController,
              keyboardType: TextInputType.emailAddress,
              decoration: const InputDecoration(
                  labelText: 'E-mail',
                  hintText: 'Digite seu e-mail',
                  border: OutlineInputBorder(
                      borderRadius: BorderRadius.all(Radius.circular(10)))),
            ),
            const SizedBox(height: 20),
            TextFormField(
              key: const Key('password_key'),
              controller: passwordController,
              obscureText: true,
              decoration: const InputDecoration(
                  labelText: 'Senha',
                  hintText: 'Digite sua Senha',
                  border: OutlineInputBorder(
                      borderRadius: BorderRadius.all(Radius.circular(10)))),
            ),
            const SizedBox(height: 32),
            ElevatedButton(
                key: const Key('register_button_key'),
                onPressed: () {
                  final String? result = _auth.register(emailController.text, passwordController.text);
                  if(result != null){
                    ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                      content: Text(result),
                      backgroundColor: Colors.red,
                    ));
                  }
                },
                style: ButtonStyle(
                    shape: MaterialStateProperty.all(RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(16))),
                    padding: MaterialStateProperty.all(
                        const EdgeInsets.symmetric(vertical: 26))),
                child: const Text('REGISTRAR'))
          ]),
        ));
  }
}
