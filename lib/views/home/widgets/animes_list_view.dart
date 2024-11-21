import 'package:flutter/material.dart';
import 'package:anime_app/core/common/widgets/anime_card.dart';

class AnimesListView extends StatelessWidget {
  const AnimesListView({super.key});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 160,
      child: ListView.builder(
        scrollDirection: Axis.horizontal,
        shrinkWrap: true,
        itemCount: 10,
        itemBuilder: (context, index) {
          return AnimeCard();
        },
      ),
    );
  }
}
