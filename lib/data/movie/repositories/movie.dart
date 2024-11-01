import 'package:dartz/dartz.dart';
import 'package:nontonterosss/common/helper/mapper/movie_mapper.dart';
import 'package:nontonterosss/data/movie/models/movie.dart';
import 'package:nontonterosss/data/movie/sources/movie.dart';
import 'package:nontonterosss/domain/movie/repositories/movie.dart';
import 'package:nontonterosss/service_locator.dart';

class MovieRepositoryImpl extends MovieRepository {
  @override
  Future<Either> getTrendingMovies() async {
    var returnedData = await sl<MovieService>().getTrendingMovies();
    return returnedData.fold(
      (error) {
        return Left(error);
      },
      (data) {
        var movies = List.from(data['content'])
            .map(
              (item) => MovieMapper.toEntity(
                MovieModel.fromJson(item),
              ),
            )
            .toList();
        return Right(movies);
      },
    );
  }
}
