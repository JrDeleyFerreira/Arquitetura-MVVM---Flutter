import 'dart:async';

import 'package:novo_modelo_mvvm/data/repositories/auth/auth_repository.dart';
import 'package:novo_modelo_mvvm/data/services/auth/auth_client_http.dart';
import 'package:novo_modelo_mvvm/data/services/auth/auth_local_storage.dart';
import 'package:novo_modelo_mvvm/domain/dtos/credentials.dart';
import 'package:novo_modelo_mvvm/domain/entities/user_entity.dart';
import 'package:novo_modelo_mvvm/domain/validators/credential_validator.dart';
import 'package:novo_modelo_mvvm/utils/validation/lucid_validation_extension.dart';
import 'package:result_dart/result_dart.dart';
import 'package:result_dart/src/types.dart';
import 'package:result_dart/src/unit.dart';

class RemoteAuthRepository implements AuthRepository {
  final _streamController = StreamController<User>.broadcast();
  final AuthLocalStorage _authLocalStorage;
  final AuthClientHttp _authClientHttp;

  RemoteAuthRepository(this._authLocalStorage, this._authClientHttp);

  @override
  AsyncResult<LoggedUser> getUser() => _authLocalStorage
      .getUser()
      .onSuccess((_) => _streamController.add(const NotLoggedUser()));

  @override
  AsyncResult<LoggedUser> login(Credentials credentials) {
    final validator = CredentialValidator();

    return validator
        .validateResult(credentials)
        .flatMap(_authClientHttp.login)
        .flatMap(_authLocalStorage.saveUser)
        .onSuccess(_streamController.add);
  }

  @override
  AsyncResult<Unit> logout() => _authLocalStorage.removeUser();

  @override
  Stream userObserver() => _streamController.stream;

  @override
  void dispose() => _streamController.close();
}
