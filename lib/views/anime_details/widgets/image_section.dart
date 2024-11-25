import 'package:flutter/material.dart';

import 'package:anime_app/views/anime_details/widgets/anime_details_app_bar.dart';
import 'package:anime_app/views/anime_details/widgets/row_buttons.dart';

class ImageSection extends StatelessWidget {
  const ImageSection({
    super.key,
    required this.imageUrl,
  });

  final String imageUrl;

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Container(
          height: 470,
          width: double.infinity,
          decoration: BoxDecoration(
            image: DecorationImage(
              fit: BoxFit.cover,
              image: NetworkImage(
                imageUrl,
              ),
            ),
          ),
        ),
        const Positioned(
          left: 20,
          right: 20,
          top: 10,
          child: AnimeDetailsAppBar(),
        ),
        const Positioned(
          left: 0,
          right: 0,
          bottom: -1,
          child: RowButtons(),
        ),
      ],
    );
  }
}
