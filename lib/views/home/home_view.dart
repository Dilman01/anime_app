import 'package:flutter/material.dart';

import 'package:anime_app/core/constants/anime_categories.dart';
import 'package:anime_app/views/home/widgets/anime_rank.dart';

import 'package:anime_app/views/home/widgets/carousel_widget.dart';

class HomeView extends StatelessWidget {
  const HomeView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: CustomScrollView(
        slivers: [
          SliverToBoxAdapter(
            child: Padding(
              padding: const EdgeInsets.only(left: 20, right: 20, top: 50),
              child: Column(
                children: [
                  CarouselWidget(),
                  ListView.builder(
                    shrinkWrap: true,
                    physics: NeverScrollableScrollPhysics(),
                    itemCount: animeCategories.length,
                    itemBuilder: (context, index) {
                      final category = animeCategories[index];

                      return AnimeRank(category: category);
                    },
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
