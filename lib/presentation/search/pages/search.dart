import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:nontonterosss/common/widgets/appbar/appbar.dart';
import 'package:nontonterosss/presentation/search/bloc/search_cubit.dart';
import 'package:nontonterosss/presentation/search/bloc/selectable_option_cubit.dart';
import 'package:nontonterosss/presentation/search/widgets/search_content.dart';
import 'package:nontonterosss/presentation/search/widgets/search_field.dart';
import 'package:nontonterosss/presentation/search/widgets/search_options.dart';

class SearchPage extends StatelessWidget {
  const SearchPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const BasicAppbar(
        title: Text('Search'),
      ),
      body: MultiBlocProvider(
        providers: [
          BlocProvider(create: (context) => SelectableOptionCubit()),
          BlocProvider(create: (context) => SearchCubit()),
        ],
        child: const Padding(
          padding: EdgeInsets.symmetric(horizontal: 16),
          child: Column(
            children: [
              SearchField(),
              SizedBox(height: 20),
              SearchOptions(),
              SizedBox(height: 20),
              Expanded(child: SearchContent()),
            ],
          ),
        ),
      ),
    );
  }
}
