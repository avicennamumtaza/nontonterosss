import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:nontonterosss/common/widgets/appbar/appbar.dart';
import 'package:nontonterosss/core/configs/assets/app_vectors.dart';
import 'package:nontonterosss/core/configs/theme/app_colors.dart';
import 'package:nontonterosss/presentation/home/widgets/trending_movies.dart';
import 'package:nontonterosss/presentation/home/widgets/trending_text.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: BasicAppbar(
        hideBack: true,
        leading: SvgPicture.asset(
          AppVectors.logo,
          theme: const SvgTheme(
            currentColor: AppColors.primary,
          ),
        ),
      ),
      body: const SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            TrendingText(),
            TrendingMovies(),
          ],
        ),
      ),
    );
  }
}
