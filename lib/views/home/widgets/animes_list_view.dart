import 'package:flutter/material.dart';

import 'package:anime_app/models/anime.dart';
import 'package:anime_app/views/anime_details/anime_details_view.dart';
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
          return GestureDetector(
            onTap: () {
              Navigator.of(context).push(
                MaterialPageRoute(
                  builder: (context) => AnimeDetailsView(
                    id: animes[index].node.id,
                  ),
                ),
              );
            },
            child: AnimeCard(
              title: animes[index].node.title,
              imageUrl: animes[index].node.mainPicture.large,
            ),
          );
        },
      ),
    );
  }
}
