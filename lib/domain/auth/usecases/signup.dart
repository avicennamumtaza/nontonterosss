import 'package:dartz/dartz.dart';
import 'package:nontonterosss/core/usecase/usecase.dart';
import 'package:nontonterosss/data/auth/models/signup_req_params.dart';
import 'package:nontonterosss/domain/auth/repositories/auth.dart';
import 'package:nontonterosss/service_locator.dart';

class SignupUseCase extends Usecase<Either,SignupReqParams> {
  // SignupUseCase({required this.authRepository});
  // final AuthRepository authRepository;
  
  @override
  Future<Either> call({SignupReqParams? params}) async {
    return await sl<AuthRepository>().signup(params!);
  }
}