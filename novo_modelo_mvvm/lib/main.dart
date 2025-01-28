import 'package:flutter/material.dart';
import 'package:novo_modelo_mvvm/config/dependencies.dart';
import 'package:routefly/routefly.dart';

import 'main.route.dart';
part 'main.g.dart';

void main() {
  setupDependencies();
  runApp(const MainApp());
}

@Main('lib/ui/')
class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp.router(
      routerConfig: Routefly.routerConfig(
        routes: routes,
        initialPath: routePaths.auth.login,
      ),
    );
  }
}
