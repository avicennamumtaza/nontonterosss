import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:nontonterosss/common/helper/navigation/app_navigator.dart';
import 'package:nontonterosss/core/configs/theme/app_colors.dart';
import 'package:nontonterosss/presentation/auth/pages/signup.dart';
import 'package:reactive_button/reactive_button.dart';

class SigninPage extends StatelessWidget {
  const SigninPage({super.key});

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
            _signinButton(),
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
      decoration: InputDecoration(
        hintText: "Email",
      ),
    );
  }

  Widget _passwordField() {
    return TextField(
      decoration: InputDecoration(
        hintText: "Password",
      ),
    );
  }

  Widget _signinButton() {
    return ReactiveButton(
      title: "Sign In",
      // width: double.negativeInfinity,
      activeColor: Colors.yellow.shade800,
      onPressed: () async {},
      onSuccess: () {},
      onFailure: (error) {},
    );
  }

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
            recognizer: TapGestureRecognizer()..onTap=(){
              AppNavigator.push(context, const SignupPage());
            }
          ),
        ],
      ),
    );
  }
}
