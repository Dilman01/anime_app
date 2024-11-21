import 'package:anime_app/core/common/widgets/anime_grid_view.dart';
import 'package:anime_app/views/search/widgets/search_text_field.dart';
import 'package:flutter/material.dart';

class SearchScreen extends StatelessWidget {
  const SearchScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: false,
        titleSpacing: 8,
        toolbarHeight: 80,
        title: SearchTextField(),
      ),
      body: Padding(
        padding: const EdgeInsets.all(10),
        child: AnimeGridView(),
      ),
    );
  }
}
