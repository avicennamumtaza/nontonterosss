import 'package:dartz/dartz.dart';
import 'package:nontonterosss/core/usecase/usecase.dart';
import 'package:nontonterosss/domain/tv/repositories/tv.dart';
import 'package:nontonterosss/service_locator.dart';

class SearchTvUseCase extends Usecase<Either, String> {
  @override
  Future<Either> call({String ? params}) async {
    return await sl<TvRepository>().searchTv(params!);
  }
}
