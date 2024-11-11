import 'package:dartz/dartz.dart';
import 'package:nontonterosss/core/usecase/usecase.dart';
import 'package:nontonterosss/domain/tv/repositories/tv.dart';
import 'package:nontonterosss/service_locator.dart';

class GetPopularTvUseCase extends Usecase<Either, dynamic> {
  @override
  Future<Either> call({params}) async {
    return await sl<TvRepository>().getPopularTv();
  }
}
