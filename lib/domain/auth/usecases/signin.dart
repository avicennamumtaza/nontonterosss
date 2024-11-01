import 'package:dartz/dartz.dart';
import 'package:nontonterosss/core/usecase/usecase.dart';
import 'package:nontonterosss/data/auth/models/signin_req_params.dart';
// import 'package:nontonterosss/data/auth/models/signup_req_params.dart';
import 'package:nontonterosss/domain/auth/repositories/auth.dart';
import 'package:nontonterosss/service_locator.dart';

class SigninUseCase extends Usecase<Either,SigninReqParams> {
  // SigninUseCase({required this.authRepository});
  // final AuthRepository authRepository;
  
  @override
  Future<Either> call({SigninReqParams? params}) async {
    return await sl<AuthRepository>().signin(params!);
  }
}