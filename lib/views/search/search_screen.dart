import 'package:anime_app/core/common/widgets/anime_grid_view.dart';
import 'package:anime_app/cubits/anime_search_cubit/anime_search_cubit.dart';
import 'package:anime_app/repositories/anime_repository.dart';
import 'package:anime_app/views/search/widgets/search_text_field.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class SearchScreen extends StatelessWidget {
  const SearchScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider<AnimeSearchCubit>(
      create: (context) => AnimeSearchCubit(
        context.read<AnimeRepository>(),
      ),
      child: Scaffold(
        appBar: AppBar(
          centerTitle: false,
          titleSpacing: 8,
          toolbarHeight: 80,
          title: SearchTextField(),
        ),
        body: BlocBuilder<AnimeSearchCubit, AnimeSearchState>(
          builder: (context, state) {
            if (state is AnimeSearchInitial) {
              return Center(
                child: Text('Search for something...'),
              );
            } else if (state is AnimeSearchLoading) {
              return Center(
                child: CircularProgressIndicator(
                  color: Colors.blue,
                ),
              );
            } else if (state is AnimeSearchSuccess) {
              return Padding(
                padding: const EdgeInsets.all(10),
                child: AnimeGridView(
                  animes: state.animes,
                ),
              );
            } else if (state is AnimeSearchFailure) {
              return Center(
                child: Text(state.errorMessage),
              );
            } else {
              return SizedBox();
            }
          },
        ),
      ),
    );
  }
}
