import 'package:flutter/material.dart';

import 'package:anime_app/views/anime_details/widgets/anime_details_app_bar.dart';
import 'package:anime_app/views/anime_details/widgets/row_buttons.dart';

class ImageSection extends StatelessWidget {
  const ImageSection({super.key});

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Container(
          height: 450,
          width: double.infinity,
          decoration: BoxDecoration(
            image: DecorationImage(
              fit: BoxFit.cover,
              image: NetworkImage(
                'https://i.pinimg.com/736x/50/dd/90/50dd90461c9ba044e68ef5487f1bc8ec.jpg',
              ),
            ),
          ),
        ),
        Positioned(
          left: 20,
          right: 20,
          top: 10,
          child: AnimeDetailsAppBar(),
        ),
        Positioned(
          left: 0,
          right: 0,
          bottom: -1,
          child: RowButtons(),
        ),
      ],
    );
  }
}
