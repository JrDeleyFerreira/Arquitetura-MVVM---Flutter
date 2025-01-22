import 'package:novo_modelo_mvvm/domain/dtos/credentials.dart';
import 'package:novo_modelo_mvvm/domain/entities/user_entity.dart';
import 'package:result_dart/result_dart.dart';

abstract interface class AuthRepository {
  AsyncResult<LoggedUser> login(Credentials credentials);
  AsyncResult<Unit> logout();
  AsyncResult<LoggedUser> getUser();
  Stream userObserver();
  void dispose();
}
