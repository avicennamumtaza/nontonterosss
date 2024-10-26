import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:nontonterosss/presentation/splash/bloc/splash_cubit.dart';
import 'package:nontonterosss/presentation/splash/pages/splash.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'core/configs/theme/app_theme.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    SystemChrome.setSystemUIOverlayStyle(
      const SystemUiOverlayStyle(
        statusBarColor: Colors.transparent,
      ),
    );
    return BlocProvider(
      create: (context) => SplashCubit()..appStarted(),
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        theme: AppTheme.appTheme,
        home: const SplashPage(),
      ),
    );
  }
}
