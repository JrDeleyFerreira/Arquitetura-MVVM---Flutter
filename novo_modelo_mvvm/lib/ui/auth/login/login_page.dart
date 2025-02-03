import 'package:flutter/material.dart';
import 'package:novo_modelo_mvvm/config/dependencies.dart';
import 'package:novo_modelo_mvvm/domain/validators/credential_validator.dart';
import 'package:novo_modelo_mvvm/ui/auth/login/viewmodel/login_viewmodel.dart';
import 'package:result_command/result_command.dart';

import '../../../domain/dtos/credentials.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  final viewModel = injector.get<LoginViewmodel>();

  final validator = CredentialValidator();
  final credentials = Credentials();

  @override
  void initState() {
    super.initState();
    viewModel.loginCommand.addListener(_listenable);
  }

  void _listenable() {
    if (viewModel.loginCommand.isFailure) {
      final erro = viewModel.loginCommand.value as FailureCommand;

      final snackbar = SnackBar(
        content: Text(erro.error.toString()),
        backgroundColor: Colors.red,
      );

      ScaffoldMessenger.of(context).showSnackBar(snackbar);
    }
  }

  @override
  void dispose() {
    viewModel.loginCommand.removeListener(_listenable);
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          const FlutterLogo(size: 100),
          const SizedBox(height: 20),
          TextFormField(
            autovalidateMode: AutovalidateMode.onUserInteraction,
            onChanged: credentials.setEmail,
            validator: validator.byField(credentials, 'email'),
            decoration: const InputDecoration(
              labelText: 'Email',
              border: OutlineInputBorder(),
            ),
          ),
          const SizedBox(height: 20),
          TextFormField(
            autovalidateMode: AutovalidateMode.onUserInteraction,
            onChanged: credentials.setPassword,
            validator: validator.byField(credentials, 'password'),
            decoration: const InputDecoration(
              labelText: 'Password',
              border: OutlineInputBorder(),
            ),
          ),
          const SizedBox(height: 40),
          ListenableBuilder(
              listenable: viewModel.loginCommand,
              builder: (context, _) {
                return ElevatedButton(
                  onPressed: viewModel.loginCommand.isRunning
                      ? null
                      : () {
                          if (validator.validate(credentials).isValid) {
                            viewModel.loginCommand.execute(credentials);
                          }
                        },
                  child: const Text('Login'),
                );
              }),
        ],
      ),
    );
  }
}
