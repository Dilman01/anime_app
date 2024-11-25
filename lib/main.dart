import 'package:flutter/material.dart';

import 'package:flutter_bloc/flutter_bloc.dart';

import 'package:anime_app/core/utils/utils.dart';
import 'package:anime_app/views/main_wrapper/main_wrapper.dart';

import 'package:anime_app/repositories/anime_repository.dart';
import 'package:anime_app/cubits/anime_rank_cubit/anime_rank_cubit.dart';
import 'package:anime_app/cubits/anime_categories/anime_categories_cubit.dart';
import 'package:anime_app/cubits/anime_details_cubit/anime_details_cubit.dart';
import 'package:anime_app/cubits/anime_seasonal/anime_seasonal_cubit.dart';

void main() {
  runApp(const AnimeApp());
}

class AnimeApp extends StatelessWidget {
  const AnimeApp({super.key});

  @override
  Widget build(BuildContext context) {
    return RepositoryProvider(
      create: (context) => AnimeRepository(),
      child: MultiBlocProvider(
        providers: [
          BlocProvider<AnimeCategoriesCubit>(
            create: (context) => AnimeCategoriesCubit(
              context.read<AnimeRepository>(),
            )..getAnimesByRank(rankType: 'all'),
          ),
          BlocProvider<AnimeSeasonalCubit>(
            create: (context) => AnimeSeasonalCubit(
              context.read<AnimeRepository>(),
            )..getSeasonalAnimes(
                year: DateTime.now().year,
                season: getCurrentSeason(),
              ),
          ),
          BlocProvider<AnimeDetailsCubit>(
            create: (context) => AnimeDetailsCubit(
              context.read<AnimeRepository>(),
            ),
          ),
          BlocProvider<AnimeRankCubit>(
            create: (context) => AnimeRankCubit(
              context.read<AnimeRepository>(),
            )..getAnimesByRank(rankType: 'all', limit: 1),
          ),
        ],
        child: MaterialApp(
          debugShowCheckedModeBanner: false,
          theme: ThemeData.dark().copyWith(
            appBarTheme: const AppBarTheme().copyWith(
              backgroundColor: Colors.transparent,
              elevation: 0,
              scrolledUnderElevation: 0,
            ),
            scaffoldBackgroundColor: const Color.fromRGBO(1, 6, 20, 1),
          ),
          home: const MainWrapper(),
        ),
      ),
    );
  }
}
