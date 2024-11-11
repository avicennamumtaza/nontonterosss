import 'package:dartz/dartz.dart';
import 'package:nontonterosss/core/usecase/usecase.dart';
import 'package:nontonterosss/domain/movie/repositories/movie.dart';
import 'package:nontonterosss/service_locator.dart';

class GetMovieTrailerUseCase extends Usecase<Either, int> {
  @override
  Future<Either> call({int? params}) async {
    return await sl<MovieRepository>().getMovieTrailer(params!);
  }
}
