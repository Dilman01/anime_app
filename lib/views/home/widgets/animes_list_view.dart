import 'package:anime_app/models/anime.dart';
import 'package:flutter/material.dart';
import 'package:anime_app/core/common/widgets/anime_card.dart';

class AnimesListView extends StatelessWidget {
  const AnimesListView({super.key, required this.animes});

  final List<Anime> animes;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 180,
      child: ListView.builder(
        scrollDirection: Axis.horizontal,
        shrinkWrap: true,
        itemCount: animes.length,
        itemBuilder: (context, index) {
          return AnimeCard(
            title: animes[index].node.title,
            imageUrl: animes[index].node.mainPicture.large,
          );
        },
      ),
    );
  }
}
