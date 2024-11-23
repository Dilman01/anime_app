import 'package:anime_app/blocs/anime_categories/anime_categories_cubit.dart';
import 'package:anime_app/core/constants/anime_categories.dart';
import 'package:anime_app/views/search/search_screen.dart';
import 'package:flutter/material.dart';

import 'package:anime_app/core/common/widgets/anime_grid_view.dart';

import 'package:anime_app/views/anime_details/widgets/custom_app_bar.dart';
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
      appBar: AppBar(
        title: CustomAppBar(),
      ),
      body: Padding(
        padding: EdgeInsets.symmetric(horizontal: 10),
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
            SizedBox(
              height: 20,
            ),
            SingleChildScrollView(
              scrollDirection: Axis.horizontal,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: animeCtegories.asMap().entries.map(
                  (entry) {
                    return CategoryChip(
                      title: entry.value.title,
                      isSelected: currentGenre == entry.key,
                      onTap: () {
                        context
                            .read<AnimeCategoriesCubit>()
                            .getAnimesByRank(rankType: entry.value.rankingType);

                        setState(() {
                          currentGenre = entry.key;
                        });
                      },
                    );
                  },
                ).toList(),
              ),
            ),
            SizedBox(
              height: 20,
            ),
            Expanded(
              child: BlocBuilder<AnimeCategoriesCubit, AnimeCategoriesState>(
                builder: (context, state) {
                  if (state is! AnimeCategoriesSuccess) {
                    return Center(
                      child: CircularProgressIndicator(),
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
