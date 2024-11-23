import 'package:flutter/material.dart';
import 'package:anime_app/core/common/widgets/anime_grid_view.dart';

class SavedView extends StatelessWidget {
  const SavedView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Saved Animes'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(20),
        child: AnimeGridView(
          animes: [],
        ),
      ),
    );
  }
}
