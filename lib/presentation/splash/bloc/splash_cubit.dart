import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:nontonterosss/domain/auth/usecases/is_signed_in.dart';
import 'package:nontonterosss/presentation/splash/bloc/splash_state.dart';
import 'package:nontonterosss/service_locator.dart';

class SplashCubit extends Cubit<SplashState> {
  SplashCubit() : super(DisplaySplash());

  void appStarted() async {
    await Future.delayed(
      const Duration(seconds: 1),
    );
    var isSignedIn = await sl<IsSignedInUseCase>().call();
    if (isSignedIn) {
      emit(Authenticated());
    } else {
      emit(UnAuthenticated());
    }
  }
}
