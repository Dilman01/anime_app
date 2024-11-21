import 'package:anime_app/views/search/search_screen.dart';
import 'package:flutter/material.dart';

import 'package:anime_app/core/common/widgets/anime_grid_view.dart';

import 'package:anime_app/views/anime_details/widgets/custom_app_bar.dart';
import 'package:anime_app/views/search/widgets/search_genre_chip.dart';
import 'package:anime_app/views/search/widgets/search_text_field.dart';

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
                children: [
                  SearchGenreChip(
                    title: 'Adventure',
                    isSelected: currentGenre == 0,
                    onTap: () {
                      setState(() {
                        currentGenre = 0;
                      });
                    },
                  ),
                  SizedBox(
                    width: 8,
                  ),
                  SearchGenreChip(
                    title: 'Romance',
                    isSelected: currentGenre == 1,
                    onTap: () {
                      setState(() {
                        currentGenre = 1;
                      });
                    },
                  ),
                  SizedBox(
                    width: 8,
                  ),
                  SearchGenreChip(
                    title: 'Drama',
                    isSelected: currentGenre == 2,
                    onTap: () {
                      setState(() {
                        currentGenre = 2;
                      });
                    },
                  ),
                  SizedBox(
                    width: 8,
                  ),
                  SearchGenreChip(
                    title: 'Action',
                    isSelected: currentGenre == 3,
                    onTap: () {
                      setState(() {
                        currentGenre = 3;
                      });
                    },
                  ),
                ],
              ),
            ),
            SizedBox(
              height: 20,
            ),
            Expanded(
              child: AnimeGridView(),
            ),
          ],
        ),
      ),
    );
  }
}
