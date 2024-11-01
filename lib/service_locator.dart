import 'package:get_it/get_it.dart';
import 'package:nontonterosss/core/network/dio_client.dart';
import 'package:nontonterosss/data/auth/repositories/auth.dart';
import 'package:nontonterosss/data/auth/sources/auth_api_service.dart';
import 'package:nontonterosss/data/movie/repositories/movie.dart';
import 'package:nontonterosss/data/movie/sources/movie.dart';
import 'package:nontonterosss/domain/auth/repositories/auth.dart';
import 'package:nontonterosss/domain/auth/usecases/is_signed_in.dart';
import 'package:nontonterosss/domain/auth/usecases/signin.dart';
import 'package:nontonterosss/domain/auth/usecases/signup.dart';
import 'package:nontonterosss/domain/movie/repositories/movie.dart';
import 'package:nontonterosss/domain/movie/usecases/get_trending_movies.dart';

final sl = GetIt.instance;

void setupServiceLocator() {
  sl.registerSingleton<DioClient>(DioClient());

  // Services
  sl.registerSingleton<AuthService>(AuthApiServiceImpl());
  sl.registerSingleton<MovieService>(MovieApiServiceImpl());

  // Repositories
  sl.registerSingleton<AuthRepository>(AuthRepositoryImpl());
  sl.registerSingleton<MovieRepository>(MovieRepositoryImpl());

  // Usecases
  sl.registerSingleton<SignupUseCase>(SignupUseCase());
  sl.registerSingleton<SigninUseCase>(SigninUseCase());
  sl.registerSingleton<IsSignedInUseCase>(IsSignedInUseCase());
  sl.registerSingleton<GetTrendingMoviesUseCase>(GetTrendingMoviesUseCase());
}