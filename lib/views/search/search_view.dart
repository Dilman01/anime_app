import 'package:anime_app/cubits/anime_categories/anime_categories_cubit.dart';
import 'package:anime_app/core/constants/anime_categories.dart';
import 'package:anime_app/views/search/search_screen.dart';
import 'package:flutter/material.dart';

import 'package:anime_app/core/common/widgets/anime_grid_view.dart';

import 'package:anime_app/views/search/widgets/category_chip.dart';
import 'package:anime_app/views/search/widgets/search_text_field.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class SearchView extends StatefulWidget {
  const SearchView({super.key});

  @override
  State<SearchView> createState() => _SearchViewState();
}

class _SearchViewState extends State<SearchView> {
  int currentGenre = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: EdgeInsets.only(
          left: 10,
          right: 10,
          top: 40,
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            GestureDetector(
              onTap: () {
                Navigator.of(context).push(
                  MaterialPageRoute(
                    builder: (context) => SearchScreen(),
                  ),
                );
              },
              child: SearchTextField(
                enabled: false,
              ),
            ),
            SingleChildScrollView(
              scrollDirection: Axis.horizontal,
              child: Padding(
                padding: const EdgeInsets.symmetric(vertical: 20),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: animeCtegories.asMap().entries.map(
                    (entry) {
                      return CategoryChip(
                        title: entry.value.title,
                        isSelected: currentGenre == entry.key,
                        onTap: () {
                          context.read<AnimeCategoriesCubit>().getAnimesByRank(
                              rankType: entry.value.rankingType);

                          setState(() {
                            currentGenre = entry.key;
                          });
                        },
                      );
                    },
                  ).toList(),
                ),
              ),
            ),
            Expanded(
              child: BlocBuilder<AnimeCategoriesCubit, AnimeCategoriesState>(
                builder: (context, state) {
                  if (state is! AnimeCategoriesSuccess) {
                    return Center(
                      child: CircularProgressIndicator(
                        color: Colors.blue,
                      ),
                    );
                  }

                  return AnimeGridView(
                    animes: state.animes,
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
