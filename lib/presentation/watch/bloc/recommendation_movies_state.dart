import 'package:nontonterosss/domain/movie/entities/movie.dart';

abstract class RecommendationMoviesState {}

class RecommendationMoviesLoading extends RecommendationMoviesState {}

class RecommendationMoviesLoaded extends RecommendationMoviesState {
  final List<MovieEntity> movies;
  RecommendationMoviesLoaded({required this.movies});
}

class RecommendationMoviesFailureLoad extends RecommendationMoviesState {
  final String errorMessage;
  RecommendationMoviesFailureLoad({required this.errorMessage});
}