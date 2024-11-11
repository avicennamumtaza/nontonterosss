import 'package:flutter/material.dart';
import 'package:nontonterosss/common/widgets/appbar/appbar.dart';
import 'package:nontonterosss/domain/movie/entities/movie.dart';
import 'package:nontonterosss/presentation/watch/widgets/recommendation_movies.dart';
import 'package:nontonterosss/presentation/watch/widgets/video_overview.dart';
import 'package:nontonterosss/presentation/watch/widgets/video_player.dart';
import 'package:nontonterosss/presentation/watch/widgets/video_release_date.dart';
import 'package:nontonterosss/presentation/watch/widgets/video_title.dart';
import 'package:nontonterosss/presentation/watch/widgets/video_vote_average.dart';

class MovieWatchPage extends StatelessWidget {
  final MovieEntity movieEntity;
  const MovieWatchPage({super.key, required this.movieEntity});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const BasicAppbar(
        hideBack: false,
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.symmetric(horizontal: 16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            VideoPlayer(id: movieEntity.id!),
            const SizedBox(height: 20),
            VideoTitle(title: movieEntity.title!),
            const SizedBox(height: 15),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                VideoReleaseDate(releaseDate: movieEntity.releaseDate!),
                VideoVoteAverage(voteAverage: movieEntity.voteAverage!),
              ],
            ),
            const SizedBox(height: 15),
            VideoOverview(overview: movieEntity.overview!),
            const SizedBox(height: 15),
            RecommendationMovies(movieId: movieEntity.id!),
          ],
        ),
      ),
    );
  }
}
