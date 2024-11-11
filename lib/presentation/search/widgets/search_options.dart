import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:nontonterosss/presentation/search/bloc/search_cubit.dart';
import 'package:nontonterosss/presentation/search/bloc/selectable_option_cubit.dart';
import 'package:nontonterosss/presentation/search/widgets/selectable_option.dart';

class SearchOptions extends StatelessWidget {
  const SearchOptions({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<SelectableOptionCubit, SearchType>(
      builder: (context, state) {
        return Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            SelectableOption(
              title: "movie",
              isSelected: context.read<SelectableOptionCubit>().state ==
                  SearchType.movie,
              onTap: () {
                context.read<SelectableOptionCubit>().selectMovie();
                context.read<SearchCubit>().search(
                      context.read<SearchCubit>().searchEditingController.text,
                      context.read<SelectableOptionCubit>().state,
                    );
              },
            ),
            const SizedBox(width: 10),
            SelectableOption(
              title: "tv",
              isSelected:
                  context.read<SelectableOptionCubit>().state == SearchType.tv,
              onTap: () {
                context.read<SelectableOptionCubit>().selectTv();
                context.read<SearchCubit>().search(
                      context.read<SearchCubit>().searchEditingController.text,
                      context.read<SelectableOptionCubit>().state,
                    );
              },
            ),
          ],
        );
      },
    );
  }
}
