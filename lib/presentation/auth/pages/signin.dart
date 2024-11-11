import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:nontonterosss/common/helper/message/display_message.dart';
import 'package:nontonterosss/common/helper/navigation/app_navigator.dart';
// import 'package:nontonterosss/core/configs/theme/app_colors.dart';
import 'package:nontonterosss/data/auth/models/signin_req_params.dart';
import 'package:nontonterosss/domain/auth/usecases/signin.dart';
import 'package:nontonterosss/presentation/auth/pages/signup.dart';
import 'package:nontonterosss/presentation/home/pages/home.dart';
import 'package:nontonterosss/service_locator.dart';
// import 'package:reactive_button/reactive_button.dart';

class SigninPage extends StatelessWidget {
  SigninPage({super.key});
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        minimum: const EdgeInsets.only(
          top: 100,
          right: 16,
          left: 16,
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            _signinText(),
            const SizedBox(height: 30),
            _emailField(),
            const SizedBox(height: 15),
            _passwordField(),
            const SizedBox(height: 30),
            _signinButton(context),
            const SizedBox(height: 10),
            _signupText(context),
          ],
        ),
      ),
    );
  }

  Widget _signinText() {
    return const Text(
      "Sign In",
      style: TextStyle(
        fontWeight: FontWeight.bold,
        fontSize: 24,
      ),
    );
  }

  Widget _emailField() {
    return TextField(
      controller: _emailController,
      decoration: const InputDecoration(
        hintText: "Email",
      ),
    );
  }

  Widget _passwordField() {
    return TextField(
      controller: _passwordController,
      decoration: const InputDecoration(
        hintText: "Password",
      ),
    );
  }
  
  Widget _signinButton(BuildContext context) {
    return ElevatedButton(
      style: ElevatedButton.styleFrom(
        backgroundColor: Colors.yellow.shade800, // warna tombol
        minimumSize: const Size(double.infinity, 50), // ukuran tombol
      ),
      onPressed: () async {
        try {
          final result = await sl<SigninUseCase>().call(
            params: SigninReqParams(
              email: _emailController.text,
              password: _passwordController.text,
            ),
          );
          result.fold(
            (failure) {
              DisplayMessage.errorMessage(context, failure.toString());
            },
            (success) {
              AppNavigator.pushAndRemove(
                context,
                const HomePage(),
              );
            },
          );
        } catch (error) {
          DisplayMessage.errorMessage(context, error.toString());
        }
      },
      child: const Text(
        "Sign In",
        style: TextStyle(
          color: Colors.white,
        ),
      ),
    );
  }

  // Widget _signinButtonOld(BuildContext context) {
  //   return ReactiveButton(
  //     title: "Sign In",
  //     // width: double.negativeInfinity,
  //     activeColor: Colors.yellow.shade800,
  //     onPressed: () async {
  //       await sl<SigninUseCase>().call(
  //         params: SigninReqParams(
  //           email: _emailController.text,
  //           password: _passwordController.text,
  //         ),
  //       );
  //     },
  //     onSuccess: () {
  //       AppNavigator.pushAndRemove(
  //         context,
  //         const HomePage(),
  //       );
  //     },
  //     onFailure: (error) {
  //       DisplayMessage.errorMessage(context, error);
  //     },
  //   );
  // }

  Widget _signupText(BuildContext context) {
    return Text.rich(
      TextSpan(
        children: [
          const TextSpan(
            text: "Don't have an account?",
          ),
          TextSpan(
            text: "  Let's Sign Up here.",
            style: const TextStyle(
              color: Colors.blue,
            ),
            recognizer: TapGestureRecognizer()
              ..onTap = () {
                AppNavigator.push(context, SignupPage());
              },
          ),
        ],
      ),
    );
  }
}
