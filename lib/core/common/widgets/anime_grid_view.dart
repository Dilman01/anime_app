import 'package:flutter/material.dart';
import 'package:anime_app/core/common/widgets/anime_card.dart';

class AnimeGridView extends StatelessWidget {
  const AnimeGridView({super.key});

  @override
  Widget build(BuildContext context) {
    return GridView.builder(
      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 3,
        mainAxisSpacing: 12,
        mainAxisExtent: 180,
      ),
      // shrinkWrap: true,
      itemCount: 30,
      itemBuilder: (context, index) {
        return SizedBox(
          child: AnimeCard(),
        );
      },
    );
  }
}
