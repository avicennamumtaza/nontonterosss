import 'package:nontonterosss/core/usecase/usecase.dart';
import 'package:nontonterosss/domain/auth/repositories/auth.dart';
import 'package:nontonterosss/service_locator.dart';

class IsSignedInUseCase extends Usecase<bool, dynamic> {
  @override
  Future<bool> call({params}) async {
    return await sl<AuthRepository>().isSignedIn();
  }
}