import 'package:anime_app/models/anime.dart';
import 'package:flutter/material.dart';
import 'package:anime_app/core/common/widgets/anime_card.dart';

class AnimeGridView extends StatelessWidget {
  const AnimeGridView({super.key, this.animes});

  final List<Anime>? animes;

  @override
  Widget build(BuildContext context) {
    return GridView.builder(
      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 3,
        mainAxisSpacing: 12,
        mainAxisExtent: 180,
      ),
      itemCount: animes == null ? 30 : animes!.length,
      itemBuilder: (context, index) {
        return animes == null
            ? SizedBox(
                child: AnimeCard(),
              )
            : AnimeCard(
                title: animes![index].node.title,
                imageUrl: animes![index].node.mainPicture.large,
              );
      },
    );
  }
}
