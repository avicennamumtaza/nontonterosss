import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';
import 'package:nontonterosss/core/constants/api_url.dart';
import 'package:nontonterosss/core/network/dio_client.dart';
import 'package:nontonterosss/service_locator.dart';

abstract class MovieService {
  Future<Either> getTrendingMovies();
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
}
