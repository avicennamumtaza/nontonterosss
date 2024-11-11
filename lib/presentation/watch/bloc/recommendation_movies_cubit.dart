import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:nontonterosss/domain/movie/usecases/get_recommendation_movies.dart';
import 'package:nontonterosss/presentation/watch/bloc/recommendation_movies_state.dart';
import 'package:nontonterosss/service_locator.dart';

class RecommendationMoviesCubit extends Cubit<RecommendationMoviesState> {
  RecommendationMoviesCubit() : super(RecommendationMoviesLoading());

  void getRecommendationMovies(int movieId) async {
    var returnedData = await sl<GetRecommendationMoviesUseCase>().call(params: movieId);
    returnedData.fold(
      (error) {
        emit(RecommendationMoviesFailureLoad(errorMessage: error));
      },
      (data) {
        emit(RecommendationMoviesLoaded(movies: data));
      },
    );
  }
}
