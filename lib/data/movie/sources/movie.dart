import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';
import 'package:nontonterosss/core/constants/api_url.dart';
import 'package:nontonterosss/core/network/dio_client.dart';
import 'package:nontonterosss/service_locator.dart';

abstract class MovieService {
  Future<Either> getTrendingMovies();
  Future<Either> getNowPlayingMovies();
  Future<Either> getMovieTrailer(int movieId);
  Future<Either> getRecommendationMovies(int movieId);
  Future<Either> searchMovie(String query);
}

class MovieApiServiceImpl extends MovieService {
  @override
  Future<Either> getTrendingMovies() async {
    try {
      var response = await sl<DioClient>().get(
        ApiUrl.trendingMovies,
      );
      return Right(response.data);
    } on DioException catch (error) {
      return Left(error.response!.data["message"]);
    }
  }

  @override
  Future<Either> getNowPlayingMovies() async {
    try {
      var response = await sl<DioClient>().get(
        ApiUrl.nowPlayingMovies,
      );
      return Right(response.data);
    } on DioException catch (error) {
      return Left(error.response!.data["message"]);
    }
  }

  @override
  Future<Either> getMovieTrailer(int movieId) async {
    try {
      var response = await sl<DioClient>().get(
        "${ApiUrl.movie}$movieId/trailer",
      );
      return Right(response.data);
    } on DioException catch (error) {
      return Left(error.response!.data["message"]);
    }
  }
  
  @override
  Future<Either> getRecommendationMovies(int movieId) async {
    try {
      var response = await sl<DioClient>().get(
        "${ApiUrl.movie}$movieId/recommendations",
      );
      return Right(response.data);
    } on DioException catch (error) {
      return Left(error.response!.data["message"]);
    }
  }
  
  @override
  Future<Either> searchMovie(String query) async {
    try {
      var response = await sl<DioClient>().get(
        "${ApiUrl.search}movie/$query",
      );
      return Right(response.data);
    } on DioException catch (error) {
      return Left(error.response!.data["message"]);
    }
  }
}
