import 'package:flutter/material.dart';
import 'package:novo_modelo_mvvm/config/dependencies.dart';
import 'package:novo_modelo_mvvm/domain/entities/user_entity.dart';
import 'package:novo_modelo_mvvm/main_viewmodel.dart';
import 'package:routefly/routefly.dart';

import 'main.route.dart';
part 'main.g.dart';

void main() {
  setupDependencies();
  runApp(const MainApp());
}

@Main('lib/ui/')
class MainApp extends StatefulWidget {
  const MainApp({super.key});

  @override
  State<MainApp> createState() => _MainAppState();
}

class _MainAppState extends State<MainApp> {
  final mainViewModel = injector.get<MainViewmodel>();

  @override
  void initState() {
    super.initState();

    mainViewModel.addListener(() {
      if (mainViewModel.user is LoggedUser) {
        Routefly.push(routePaths.home);
      } else {
        Routefly.push(routePaths.auth.login);
      }
    });
  }

  @override
  void dispose() {
    mainViewModel.dispose();
    super.dispose();
  }

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
