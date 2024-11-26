import 'package:flutter/material.dart';
import 'package:anime_app/views/anime_details/anime_details_view.dart';

import 'package:anime_app/core/common/widgets/anime_card.dart';
import 'package:anime_app/core/common/widgets/genre_chip.dart';
import 'package:anime_app/models/anime_details.dart';
import 'package:anime_app/views/anime_details/widgets/anime_description.dart';
import 'package:anime_app/views/anime_details/widgets/anime_title.dart';

class DetailsSection extends StatelessWidget {
  const DetailsSection({super.key, required this.animeDetails});

  final AnimeDetails animeDetails;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          AnimeTitle(
            title: animeDetails.title,
            score: animeDetails.mean?.toString() ?? '0',
          ),
          const SizedBox(
            height: 10,
          ),
          SingleChildScrollView(
            scrollDirection: Axis.horizontal,
            child: Row(
              children: animeDetails.genres.map(
                (genre) {
                  return GenreChip(
                    title: genre.name,
                  );
                },
              ).toList(),
            ),
          ),
          const SizedBox(
            height: 20,
          ),
          AnimeDescription(
            description: animeDetails.synopsis,
          ),
          const SizedBox(
            height: 10,
          ),
          if (animeDetails.relatedAnime.isNotEmpty)
            const Text(
              'Related Animes',
              style: TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.w500,
              ),
            ),
          if (animeDetails.relatedAnime.isNotEmpty)
            const SizedBox(
              height: 10,
            ),
          if (animeDetails.relatedAnime.isNotEmpty)
            SizedBox(
              height: 180,
              child: ListView.builder(
                scrollDirection: Axis.horizontal,
                itemCount: animeDetails.relatedAnime.length,
                shrinkWrap: true,
                itemBuilder: (context, index) {
                  return GestureDetector(
                    onTap: () {
                      Navigator.of(context).push(
                        MaterialPageRoute(
                          builder: (context) => AnimeDetailsView(
                            id: animeDetails.relatedAnime[index].node.id,
                          ),
                        ),
                      );
                    },
                    child: AnimeCard(
                      imageUrl: animeDetails
                          .relatedAnime[index].node.mainPicture.large,
                      title: animeDetails.relatedAnime[index].node.title,
                    ),
                  );
                },
              ),
            ),
          if (animeDetails.relatedAnime.isNotEmpty)
            const SizedBox(
              height: 10,
            ),
          if (animeDetails.recommendations.isNotEmpty)
            const Text(
              'Recommendations',
              style: TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.w500,
              ),
            ),
          if (animeDetails.recommendations.isNotEmpty)
            const SizedBox(
              height: 10,
            ),
          if (animeDetails.recommendations.isNotEmpty)
            SizedBox(
              height: 180,
              child: ListView.builder(
                scrollDirection: Axis.horizontal,
                itemCount: animeDetails.recommendations.length,
                shrinkWrap: true,
                itemBuilder: (context, index) {
                  return GestureDetector(
                    onTap: () {
                      Navigator.of(context).push(
                        MaterialPageRoute(
                          builder: (context) => AnimeDetailsView(
                            id: animeDetails.recommendations[index].node.id,
                          ),
                        ),
                      );
                    },
                    child: AnimeCard(
                      imageUrl: animeDetails
                          .recommendations[index].node.mainPicture.large,
                      title: animeDetails.recommendations[index].node.title,
                    ),
                  );
                },
              ),
            ),
          if (animeDetails.recommendations.isNotEmpty)
            const SizedBox(
              height: 10,
            ),
        ],
      ),
    );
  }
}
