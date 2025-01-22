import 'dart:convert';

import 'package:novo_modelo_mvvm/domain/entities/user_entity.dart';
import 'package:result_dart/result_dart.dart';

import '../local_storage.dart';

const _userkey = '_userKey';

/// Essa classe não precisava existir, bastava
/// usar o 'LocalStorage' diretamente no 'RemoteAuthRepository.
class AuthLocalStorage {
  final LocalStorage _localStorage;

  AuthLocalStorage(this._localStorage);

  AsyncResult<LoggedUser> getUser() => _localStorage
      .getData(_userkey)
      .map((json) => LoggedUser.fromJson(jsonDecode(json)));

  AsyncResult<LoggedUser> saveUser(LoggedUser user) =>
      _localStorage.saveData(_userkey, jsonEncode(user.toJson())).pure(user);

  AsyncResult<Unit> removeUser() => _localStorage.removeData(_userkey);
}
