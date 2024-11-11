import 'package:dartz/dartz.dart';

abstract class TvRepository {
  Future<Either> getPopularTv();
  Future<Either> searchTv(String query);
}
