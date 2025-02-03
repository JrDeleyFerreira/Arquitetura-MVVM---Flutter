import 'package:flutter/material.dart';
import 'package:novo_modelo_mvvm/ui/auth/logout/widgets/logout_button.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return const Material(
      child: Center(
        child: LogoutButton(),
      ),
    );
  }
}
