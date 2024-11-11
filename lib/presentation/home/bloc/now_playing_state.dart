import 'package:nontonterosss/domain/movie/entities/movie.dart';

abstract class NowPlayingState {}

class NowPlayingMoviesLoading extends NowPlayingState {}

class NowPlayingMoviesLoaded extends NowPlayingState {
  final List<MovieEntity> movies;
  NowPlayingMoviesLoaded({required this.movies});
}

class NowPlayingMoviesFailureLoad extends NowPlayingState {
  final String errorMessage;
  NowPlayingMoviesFailureLoad({required this.errorMessage});
}