import 'package:auto_injector/auto_injector.dart';
import 'package:dio/dio.dart';
import '../../ui/auth/viewmodel/login_viewmodel.dart';
import '../../data/services/auth/auth_client_http.dart';
import '../../data/services/auth/auth_local_storage.dart';
import '../../data/services/client_http.dart';
import '../../data/services/local_storage.dart';
import '../../data/repositories/auth/auth_repository.dart';
import '../../data/repositories/auth/remote_auth_repository.dart';

final injector = AutoInjector();

setupDependencies() {
  injector.addSingleton<AuthRepository>(RemoteAuthRepository.new);
  injector.addInstance(Dio());
  injector.addSingleton(ClientHttp.new);
  injector.addSingleton(LocalStorage.new);
  injector.addSingleton(AuthClientHttp.new);
  injector.addSingleton(AuthLocalStorage.new);
  injector.addSingleton(LoginViewmodel.new);
}
