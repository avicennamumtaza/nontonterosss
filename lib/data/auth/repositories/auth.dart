import 'package:dartz/dartz.dart';
import 'package:nontonterosss/data/auth/models/signin_req_params.dart';
import 'package:nontonterosss/data/auth/models/signup_req_params.dart';
import 'package:nontonterosss/data/auth/sources/auth_api_service.dart';
import 'package:nontonterosss/domain/auth/repositories/auth.dart';
import 'package:nontonterosss/service_locator.dart';

class AuthRepositoryImpl extends AuthRepository {
  // AuthApiService authApiService;
  // AuthRepositoryImpl({
  //   required this.authApiService,
  // });

  @override
  Future<Either> signup(SignupReqParams params) async {
    return await sl<AuthApiService>().signup(params);
  }

  @override
  Future<Either> signin(SigninReqParams params) async {
    return await sl<AuthApiService>().signin(params);
  }
}

// Here is implementation examples of abstraction...

// var data1 = AuthRepositoryImpl(
//   authApiService: AuthApiServiceImpl(),
// ).signup(
//   SignupReqParams(email: "email", password: "password"),
// );

// var data2 = AuthRepositoryImpl(
//   authApiService: AuthFirebaseServiceImpl(),
// ).signup(
//   SignupReqParams(email: "email", password: "password"),
// );
