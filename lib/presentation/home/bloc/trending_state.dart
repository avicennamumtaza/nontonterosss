import 'package:nontonterosss/domain/movie/entities/movie.dart';

abstract class TrendingState {}

class TrendingMoviesLoading extends TrendingState {}

class TrendingMoviesLoaded extends TrendingState {
  final List<MovieEntity> movies;
  TrendingMoviesLoaded({required this.movies});
}

class TrendingMoviesFailureLoad extends TrendingState {
  final String errorMessage;
  TrendingMoviesFailureLoad({required this.errorMessage});
}