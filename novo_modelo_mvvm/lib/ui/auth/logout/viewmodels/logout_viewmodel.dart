import 'package:novo_modelo_mvvm/data/repositories/auth/auth_repository.dart';
import 'package:result_command/result_command.dart';
import 'package:result_dart/result_dart.dart';

class LogoutViewmodel {
  final AuthRepository _authRepository;

  LogoutViewmodel(this._authRepository);

  late final logoutCommand = Command0(_logout);

  AsyncResult<Unit> _logout() {
    return _authRepository.logout();
  }
}
