import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:nontonterosss/common/helper/navigation/app_navigator.dart';
import 'package:nontonterosss/common/widgets/appbar/appbar.dart';
import 'package:nontonterosss/core/configs/assets/app_vectors.dart';
import 'package:nontonterosss/core/configs/theme/app_colors.dart';
import 'package:nontonterosss/presentation/home/widgets/category_text.dart';
import 'package:nontonterosss/presentation/home/widgets/now_playing_movies.dart';
import 'package:nontonterosss/presentation/home/widgets/popular_tv.dart';
import 'package:nontonterosss/presentation/home/widgets/trending_movies.dart';
import 'package:nontonterosss/presentation/search/pages/search.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: BasicAppbar(
        hideBack: true,
        action: IconButton(
          icon: const Icon(
            Icons.search,
            color: AppColors.primary,
          ),
          onPressed: () {
            AppNavigator.push(context, const SearchPage());
          },
        ),
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
            CategoryText(title: "Trendings🔥"),
            SizedBox(
              height: 10,
            ),
            TrendingMovies(),
            SizedBox(
              height: 20,
            ),
            CategoryText(title: "Now Playing 👀"),
            SizedBox(
              height: 10,
            ),
            NowPlayingMovies(),
            SizedBox(
              height: 20,
            ),
            CategoryText(title: "Popular Tv 📺"),
            SizedBox(
              height: 10,
            ),
            PopularTv(),
            SizedBox(
              height: 20,
            ),
          ],
        ),
      ),
    );
  }
}
