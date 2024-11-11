import 'package:nontonterosss/domain/tv/entities/tv.dart';

abstract class PopularTvState {}

class PopularTvLoading extends PopularTvState {}

class PopularTvLoaded extends PopularTvState {
  final List<TvEntity> tv;
  PopularTvLoaded({required this.tv});
}

class PopularTvFailureLoad extends PopularTvState {
  final String errorMessage;
  PopularTvFailureLoad({required this.errorMessage});
}