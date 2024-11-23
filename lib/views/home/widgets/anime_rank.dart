import 'package:flutter/material.dart';

import 'package:anime_app/cubits/anime_rank_cubit/anime_rank_cubit.dart';
import 'package:anime_app/repositories/anime_repository.dart';

import 'package:anime_app/models/anime_category.dart';
import 'package:anime_app/views/home/widgets/animes_list_view.dart';
import 'package:anime_app/views/home/widgets/text_header.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class AnimeRank extends StatelessWidget {
  final AnimeCategory category;

  const AnimeRank({super.key, required this.category});

  @override
  Widget build(BuildContext context) {
    return BlocProvider<AnimeRankCubit>(
      create: (context) => AnimeRankCubit(AnimeRepository())
        ..getAnimesByRank(
          rankType: category.rankingType,
          limit: 500,
        ),
      lazy: false,
      child: BlocBuilder<AnimeRankCubit, AnimeRankState>(
        builder: (context, state) {
          if (state is! AnimeRankSuccess) {
            return Center(
              child: CircularProgressIndicator(),
            );
          }

          return Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              TextHeader(
                title: category.title,
                animes: state.animes,
              ),
              const SizedBox(height: 10),
              AnimesListView(
                animes: state.animes.sublist(0, 10),
              ),
              const SizedBox(height: 20),
            ],
          );
        },
      ),
    );
  }
}
