import 'package:anime_app/core/common/widgets/anime_card.dart';
import 'package:anime_app/core/common/widgets/genre_chip.dart';
import 'package:anime_app/views/anime_details/widgets/anime_description.dart';
import 'package:anime_app/views/anime_details/widgets/anime_title.dart';
import 'package:flutter/material.dart';

class DetailsSection extends StatelessWidget {
  const DetailsSection({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          AnimeTitle(),
          SizedBox(
            height: 10,
          ),
          SingleChildScrollView(
            scrollDirection: Axis.horizontal,
            child: Row(
              children: [
                GenreChip(title: 'drama'),
                SizedBox(
                  width: 4,
                ),
                GenreChip(title: 'adventure'),
                SizedBox(
                  width: 4,
                ),
                GenreChip(title: 'animation'),
              ],
            ),
          ),
          SizedBox(
            height: 20,
          ),
          AnimeDescription(),
          SizedBox(
            height: 10,
          ),
          Text(
            'Related',
            style: TextStyle(
              fontSize: 18,
              fontWeight: FontWeight.w500,
            ),
          ),
          SizedBox(
            height: 10,
          ),
          SizedBox(
            height: 180,
            child: ListView.builder(
              scrollDirection: Axis.horizontal,
              itemCount: 2,
              shrinkWrap: true,
              itemBuilder: (context, index) {
                return AnimeCard();
              },
            ),
          ),
          SizedBox(
            height: 10,
          ),
          Text(
            'Recommendation',
            style: TextStyle(
              fontSize: 18,
              fontWeight: FontWeight.w500,
            ),
          ),
          SizedBox(
            height: 10,
          ),
          SizedBox(
            height: 180,
            child: ListView.builder(
              scrollDirection: Axis.horizontal,
              itemCount: 10,
              shrinkWrap: true,
              itemBuilder: (context, index) {
                return AnimeCard();
              },
            ),
          ),
          SizedBox(
            height: 10,
          ),
        ],
      ),
    );
  }
}
