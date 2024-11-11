import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:nontonterosss/core/entitiy/trailer.dart';
import 'package:nontonterosss/domain/movie/usecases/get_movie_trailer.dart';
import 'package:nontonterosss/presentation/watch/bloc/trailer_state.dart';
import 'package:nontonterosss/service_locator.dart';
import 'package:youtube_player_flutter/youtube_player_flutter.dart';

class TrailerCubit extends Cubit<TrailerState> {
  TrailerCubit() : super(TrailerLoading());

  void getMovieTrailer(int movieId) async {
    var returnedData = await sl<GetMovieTrailerUseCase>().call(params: movieId);

    returnedData.fold((error) {
      emit(
        FailureLoadTrailer(errorMessage: error),
      );
    }, (data) async {
      TrailerEntity trailerEntity = data;
      YoutubePlayerController controller = YoutubePlayerController(
        initialVideoId: trailerEntity.key!,
        flags: const YoutubePlayerFlags(autoPlay: false),
      );
      // VideoPlayerController videoPlayerController =
      //     VideoPlayerController.networkUrl(
      //   Uri.tryParse(
      //     ApiUrl.trailerBaseUrl + trailerEntity.key!,
      //   )!,
      // );
      // await videoPlayerController.initialize();
      // final chewieController = ChewieController(
      //   videoPlayerController: videoPlayerController,
      //   autoPlay: false,
      //   looping: false,
      // );
      emit(
        TrailerLoaded(youtubePlayerController: controller),
      );
    });
  }
}
