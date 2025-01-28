import 'package:novo_modelo_mvvm/data/services/client_http.dart';
import 'package:novo_modelo_mvvm/domain/dtos/credentials.dart';
import 'package:novo_modelo_mvvm/domain/entities/user_entity.dart';
import 'package:result_dart/result_dart.dart';

//import '../../exceptions/local_exceptions.dart';

/// Assim como em AuthLocalStorage, essa classe não precisava existir.
class AuthClientHttp {
  final ClientHttp _clientHttp;

  AuthClientHttp(this._clientHttp);

  AsyncResult<LoggedUser> login(Credentials credentials) async {
    final response = await _clientHttp.post('l/ogin', {
      'email': credentials.email,
      'password': credentials.password,
    });
    return response.map((re) => LoggedUser.fromJson(re.data));

    // Código mock para teste de Sucesso:
    /* await Future.delayed(const Duration(seconds: 2));
    return const Success(LoggedUser(
      id: 1,
      name: 'Usuário Mock',
      email: 'ferreira@qualquer.com.br',
      token: 'token',
      refreshToken: 'refreshToken',
    )); */

    // Código mock para teste de Falha:
    //return Failure(LocalExceptions('Usuário ou senha inválidos'));
  }
}
