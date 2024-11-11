import 'package:dartz/dartz.dart';
import 'package:nontonterosss/core/usecase/usecase.dart';
import 'package:nontonterosss/domain/movie/repositories/movie.dart';
import 'package:nontonterosss/service_locator.dart';

class SearchMovieUseCase extends Usecase<Either, String> {
  @override
  Future<Either> call({String? params}) async {
    return await sl<MovieRepository>().searchMovie(params!);
  }
}
