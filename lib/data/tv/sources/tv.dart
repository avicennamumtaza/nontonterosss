import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';
import 'package:nontonterosss/core/constants/api_url.dart';
import 'package:nontonterosss/core/network/dio_client.dart';
import 'package:nontonterosss/service_locator.dart';

abstract class TvService {
  Future<Either> getPopularTv();
  Future<Either> searchTv(String query);
}

class TvServiceImpl extends TvService {
  @override
  Future<Either> getPopularTv() async {
    try {
      var response = await sl<DioClient>().get(
        ApiUrl.popularTv,
      );
      return Right(response.data);
    } on DioException catch (e) {
      return Left(e.response!.data["message"]);
    }
  }

  @override
  Future<Either> searchTv(String query) async {
    try {
      var response = await sl<DioClient>().get(
        "${ApiUrl.search}tv/$query",
      );
      return Right(response.data);
    } on DioException catch (e) {
      return Left(e.response!.data["message"]);
    }
  }
}
