import 'package:flutter/material.dart';
import 'package:novo_modelo_mvvm/data/repositories/auth/auth_repository.dart';
import 'package:novo_modelo_mvvm/domain/dtos/credentials.dart';
import 'package:novo_modelo_mvvm/domain/entities/user_entity.dart';
import 'package:result_command/result_command.dart';
import 'package:result_dart/result_dart.dart';

class LoginViewmodel extends ChangeNotifier {
  final AuthRepository _authRepository;
  late final loginCommand = Command1(_login);

  LoginViewmodel(this._authRepository);

  AsyncResult<LoggedUser> _login(Credentials credentials) {
    return _authRepository.login(credentials);
  }
}
