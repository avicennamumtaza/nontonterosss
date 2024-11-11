import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:nontonterosss/common/widgets/movie/movie_card.dart';
import 'package:nontonterosss/presentation/watch/bloc/recommendation_movies_cubit.dart';
import 'package:nontonterosss/presentation/watch/bloc/recommendation_movies_state.dart';

class RecommendationMovies extends StatelessWidget {
  final int movieId;
  const RecommendationMovies({super.key, required this.movieId});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) =>
          RecommendationMoviesCubit()..getRecommendationMovies(movieId),
      child: BlocBuilder<RecommendationMoviesCubit, RecommendationMoviesState>(
        builder: (context, state) {
          if (state is RecommendationMoviesLoading) {
            return const Center(
              child: CircularProgressIndicator(),
            );
          }
          if (state is RecommendationMoviesLoaded) {
            return Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const Text(
                  "Recommendations 🎞️",
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 20,
                  ),
                ),
                const SizedBox(height: 20),
                SizedBox(
                  height: 300,
                  child: ListView.separated(
                    scrollDirection: Axis.horizontal,
                    itemBuilder: (context, index) {
                      return MovieCard(
                        movieEntity: state.movies[index],
                      );
                    },
                    separatorBuilder: (context, index) => const SizedBox(
                      width: 10,
                    ),
                    itemCount: state.movies.length,
                  ),
                ),
              ],
            );
          }
          if (state is RecommendationMoviesFailureLoad) {
            return Text(state.errorMessage);
          }
          return Container();
        },
      ),
    );
  }
}
