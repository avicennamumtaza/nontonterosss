import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:nontonterosss/domain/tv/usecases/get_popular_tv.dart';
import 'package:nontonterosss/presentation/home/bloc/popular_tv_state.dart';
import 'package:nontonterosss/service_locator.dart';

class PopularTvCubit extends Cubit<PopularTvState> {
  PopularTvCubit(): super(PopularTvLoading());

  void getPopularTv() async {
    var returnedData = await sl<GetPopularTvUseCase>().call();
    returnedData.fold((error) {
      emit(PopularTvFailureLoad(errorMessage: error));
    }, (data) {
      emit(PopularTvLoaded(tv: data));
    });
  }
}