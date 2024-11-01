import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:nontonterosss/domain/movie/usecases/get_trending_movies.dart';
import 'package:nontonterosss/presentation/home/bloc/trending_state.dart';
import 'package:nontonterosss/service_locator.dart';

class TrendingCubit extends Cubit<TrendingState> {
  TrendingCubit(): super(TrendingMoviesLoading());

  void getTrendingMovies() async {
    var returnedData = await sl<GetTrendingMoviesUseCase>().call();
    returnedData.fold((error) {
      emit(TrendingMoviesFailureLoad(errorMessage: error));
    }, (data) {
      emit(TrendingMoviesLoaded(movies: data));
    });
  }
}