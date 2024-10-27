import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';
import 'package:nontonterosss/core/constants/api_url.dart';
import 'package:nontonterosss/core/network/dio_client.dart';
import 'package:nontonterosss/data/auth/models/signin_req_params.dart';
import 'package:nontonterosss/data/auth/models/signup_req_params.dart';
import 'package:nontonterosss/service_locator.dart';

abstract class AuthApiService {
  Future<Either> signup(SignupReqParams params);
  Future<Either> signin(SigninReqParams params);
}

class AuthApiServiceImpl extends AuthApiService {
  @override
  Future<Either> signup(SignupReqParams params) async {
    try {
      var response = await sl<DioClient>().post(
        ApiUrl.signup,
        data: params.toMap(),
      );
      return Right(response.data);
    } on DioException catch (error) {
      return Left(error.response!.data["message"]);
    }
  }

  @override
  Future<Either> signin(SigninReqParams params) async {
    try {
      var response = await sl<DioClient>().post(
        ApiUrl.signin,
        data: params.toMap(),
      );
      return Right(response.data);
    } on DioException catch (error) {
      return Left(error.response!.data["message"]);
    }
  }
}

// class AuthFirebaseServiceImpl extends AuthApiService {
//   @override
//   Future<Either> signup(SignupReqParams params) {
//     // implementation of firebase auth logic
//     throw UnimplementedError();
//   }
// }
