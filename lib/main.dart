import 'package:anime_app/blocs/anime_categories/anime_categories_cubit.dart';
import 'package:anime_app/repositories/anime_repository.dart';
import 'package:flutter/material.dart';

import 'package:anime_app/views/main_wrapper/main_wrapper.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

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
