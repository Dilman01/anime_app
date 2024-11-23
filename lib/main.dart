import 'package:flutter/material.dart';

import 'package:flutter_bloc/flutter_bloc.dart';

import 'package:anime_app/core/utils/utils.dart';
import 'package:anime_app/cubits/anime_categories/anime_categories_cubit.dart';
import 'package:anime_app/cubits/anime_details_cubit/anime_details_cubit.dart';
import 'package:anime_app/cubits/anime_search_cubit/anime_search_cubit.dart';
import 'package:anime_app/cubits/anime_seasonal/anime_seasonal_cubit.dart';
import 'package:anime_app/repositories/anime_repository.dart';
import 'package:anime_app/views/main_wrapper/main_wrapper.dart';

void main() {
  runApp(const AnimeApp());
}

class AnimeApp extends StatelessWidget {
  const AnimeApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider<AnimeCategoriesCubit>(
          create: (context) => AnimeCategoriesCubit(
            AnimeRepository(),
          )..getAnimesByRank(rankType: 'all'),
        ),
        BlocProvider<AnimeSearchCubit>(
          create: (context) => AnimeSearchCubit(
            AnimeRepository(),
          ),
        ),
        BlocProvider<AnimeSeasonalCubit>(
          create: (context) => AnimeSeasonalCubit(
            AnimeRepository(),
          )..getSeasonalAnimes(
              year: DateTime.now().year,
              season: getCurrentSeason(),
            ),
        ),
        BlocProvider<AnimeDetailsCubit>(
          create: (context) => AnimeDetailsCubit(
            AnimeRepository(),
          ),
        ),
      ],
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        theme: ThemeData.dark().copyWith(
          appBarTheme: AppBarTheme().copyWith(
            backgroundColor: Colors.transparent,
            elevation: 0,
            scrolledUnderElevation: 0,
          ),
          scaffoldBackgroundColor: Color.fromRGBO(1, 6, 20, 1),
        ),
        home: MainWrapper(),
      ),
    );
  }
}
