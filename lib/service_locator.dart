import 'package:get_it/get_it.dart';
import 'package:nontonterosss/core/network/dio_client.dart';
import 'package:nontonterosss/data/auth/repositories/auth.dart';
import 'package:nontonterosss/data/auth/sources/auth_api_service.dart';
import 'package:nontonterosss/domain/auth/repositories/auth.dart';
import 'package:nontonterosss/domain/auth/usecases/signin.dart';
import 'package:nontonterosss/domain/auth/usecases/signup.dart';

final sl = GetIt.instance;

void setupServiceLocator() {
  sl.registerSingleton<DioClient>(DioClient());

  // Services
  sl.registerSingleton<AuthApiService>(AuthApiServiceImpl());

  // Repositories
  sl.registerSingleton<AuthRepository>(AuthRepositoryImpl());

  // Usecases
  sl.registerSingleton<SignupUseCase>(SignupUseCase());
  sl.registerSingleton<SigninUseCase>(SigninUseCase());
}
