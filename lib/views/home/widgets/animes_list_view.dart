import 'package:anime_app/views/home/widgets/anime_card.dart';
import 'package:flutter/material.dart';

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
