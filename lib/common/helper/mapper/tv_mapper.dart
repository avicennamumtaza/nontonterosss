import 'package:nontonterosss/data/tv/models/tv.dart';
import 'package:nontonterosss/domain/tv/entities/tv.dart';

class TvMapper {
  static TvEntity toEntity(TvModel tvmodel) {
    return TvEntity(
      adult: tvmodel.adult,
      backdropPath: tvmodel.backdropPath,
      genreIds: tvmodel.genreIds,
      id: tvmodel.id,
      originCountry: tvmodel.originCountry,
      originalLanguage: tvmodel.originalLanguage,
      originalName: tvmodel.originalName,
      overview: tvmodel.overview,
      popularity: tvmodel.popularity,
      posterPath: tvmodel.posterPath,
      firstAirDate: tvmodel.firstAirDate,
      name: tvmodel.name,
      voteAverage: tvmodel.voteAverage,
      voteCount: tvmodel.voteCount,
    );
  }
}
