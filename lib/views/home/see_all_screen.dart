import 'package:flutter/material.dart';

import 'package:anime_app/core/common/widgets/anime_grid_view.dart';

class SeeAllScreen extends StatelessWidget {
  const SeeAllScreen({
    super.key,
    required this.title,
  });

  final String title;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(title),
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20),
        child: AnimeGridView(),
      ),
    );
  }
}
