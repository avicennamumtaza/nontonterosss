import 'package:dartz/dartz.dart';
import 'package:nontonterosss/common/helper/mapper/tv_mapper.dart';
import 'package:nontonterosss/data/tv/models/tv.dart';
import 'package:nontonterosss/data/tv/sources/tv.dart';
import 'package:nontonterosss/domain/tv/repositories/tv.dart';
import 'package:nontonterosss/service_locator.dart';

class TvRepositoryImpl extends TvRepository {
  @override
  Future<Either> getPopularTv() async {
    var returnedData = await sl<TvService>().getPopularTv();
    return returnedData.fold(
      (error) {
        return Left(error);
      },
      (data) {
        var tv = List.from(data['content'])
            .map(
              (item) => TvMapper.toEntity(
                TvModel.fromJson(item),
              ),
            )
            .toList();
        return Right(tv);
      },
    );
  }
  
  @override
  Future<Either> searchTv(String query) async {
var returnedData = await sl<TvService>().searchTv(query);
    return returnedData.fold(
      (error) {
        return Left(error);
      },
      (data) {
        var tv = List.from(data['content'])
            .map(
              (item) => TvMapper.toEntity(
                TvModel.fromJson(item),
              ),
            )
            .toList();
        return Right(tv);
      },
    );
  }
}
