import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:nontonterosss/common/widgets/movie/movie_card.dart';
import 'package:nontonterosss/common/widgets/movie/tv_card.dart';
import 'package:nontonterosss/presentation/search/bloc/search_cubit.dart';
import 'package:nontonterosss/presentation/search/bloc/search_state.dart';

class SearchContent extends StatelessWidget {
  const SearchContent({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<SearchCubit, SearchState>(
      builder: (context, state) {
        if (state is SearchLoading) {
          return const Center(
            child: CircularProgressIndicator(),
          );
        }
        if (state is MoviesLoaded) {
          return GridView.builder(
            itemCount: state.movies.length,
            shrinkWrap: true,
            gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 2,
                crossAxisSpacing: 10,
                mainAxisSpacing: 10,
                childAspectRatio: 0.6),
            itemBuilder: (context, index) {
              return MovieCard(movieEntity: state.movies[index]);
            },
          );
        }
        if (state is TvsLoaded) {
          return GridView.builder(
            itemCount: state.tvs.length,
            shrinkWrap: true,
            gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 2,
                crossAxisSpacing: 10,
                mainAxisSpacing: 10,
                childAspectRatio: 0.6),
            itemBuilder: (context, index) {
              return TvCard(tvEntity: state.tvs[index]);
            },
          );
        }
        if (state is SearchFailureLoad) {
          return Center(child: Text(state.errorMessage));
        }
        return Container();
      },
    );
  }
}
