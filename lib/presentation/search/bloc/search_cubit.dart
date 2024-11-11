import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:nontonterosss/domain/movie/usecases/search_movie.dart';
import 'package:nontonterosss/domain/tv/usecases/search_tv.dart';
import 'package:nontonterosss/presentation/search/bloc/search_state.dart';
import 'package:nontonterosss/presentation/search/bloc/selectable_option_cubit.dart';
import 'package:nontonterosss/service_locator.dart';

class SearchCubit extends Cubit<SearchState> {
  SearchCubit() : super(SearchInitial());
  TextEditingController searchEditingController = TextEditingController();

  void search(String query, SearchType searchType) {
    if (query.isNotEmpty) {
      emit(SearchLoading());

      switch (searchType) {
        case SearchType.movie:
          searchMovie(query);
          break;
        case SearchType.tv:
          searchTv(query);
          break;
        default:
      }
    }
  }

  void searchMovie(String query) async {
    var returnedData = await sl<SearchMovieUseCase>().call(params: query);
    returnedData.fold(
      (error) {
        emit(SearchFailureLoad(errorMessage: error));
      },
      (data) {
        emit(MoviesLoaded(movies: data));
      },
    );
  }

  void searchTv(String query) async {
    var returnedData = await sl<SearchTvUseCase>().call(params: query);
    returnedData.fold(
      (error) {
        emit(SearchFailureLoad(errorMessage: error));
      },
      (data) {
        emit(TvsLoaded(tvs: data));
      },
    );
  }
}
