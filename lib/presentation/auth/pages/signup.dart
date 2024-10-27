import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:nontonterosss/common/helper/message/display_message.dart';
import 'package:nontonterosss/common/helper/navigation/app_navigator.dart';
import 'package:nontonterosss/data/auth/models/signup_req_params.dart';
import 'package:nontonterosss/domain/auth/usecases/signup.dart';
import 'package:nontonterosss/presentation/auth/pages/signin.dart';
import 'package:nontonterosss/service_locator.dart';

class SignupPage extends StatelessWidget {
  SignupPage({super.key});
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
            _signupText(),
            const SizedBox(height: 30),
            _emailField(),
            const SizedBox(height: 15),
            _passwordField(),
            const SizedBox(height: 30),
            _signupButton(context),
            const SizedBox(height: 10),
            _signinText(context),
          ],
        ),
      ),
    );
  }

  Widget _signupText() {
    return const Text(
      "Sign Up",
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
      obscureText: true,
    );
  }

  Widget _signupButton(BuildContext context) {
    return ElevatedButton(
      style: ElevatedButton.styleFrom(
        backgroundColor: Colors.yellow.shade800, // warna tombol
        minimumSize: const Size(double.infinity, 50), // ukuran tombol
      ),
      onPressed: () async {
        try {
          final result = await sl<SignupUseCase>().call(
            params: SignupReqParams(
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
                SigninPage(),
              );
            },
          );
        } catch (error) {
          DisplayMessage.errorMessage(context, error.toString());
        }
      },
      child: const Text(
        "Sign Up",
        style: TextStyle(
          color: Colors.white,
        ),
      ),
    );
  }

  Widget _signinText(BuildContext context) {
    return Text.rich(
      TextSpan(
        children: [
          const TextSpan(
            text: "Already have an account?",
          ),
          TextSpan(
            text: "  Let's Sign In here.",
            style: const TextStyle(
              color: Colors.blue,
            ),
            recognizer: TapGestureRecognizer()
              ..onTap = () {
                AppNavigator.push(context, SigninPage());
              },
          ),
        ],
      ),
    );
  }
}
