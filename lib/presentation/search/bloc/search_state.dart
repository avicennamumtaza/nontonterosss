import 'package:nontonterosss/domain/movie/entities/movie.dart';
import 'package:nontonterosss/domain/tv/entities/tv.dart';

abstract class SearchState {}

class SearchInitial extends SearchState {}

class SearchLoading extends SearchState {}

class MoviesLoaded extends SearchState {
  final List<MovieEntity> movies;
  MoviesLoaded({required this.movies});
}

class TvsLoaded extends SearchState {
  final List<TvEntity> tvs;
  TvsLoaded({required this.tvs});
}

class SearchFailureLoad extends SearchState {
  final String errorMessage;
  SearchFailureLoad({required this.errorMessage});
}
