import 'package:anime_app/core/constants/anime_home_categories.dart';
import 'package:anime_app/cubits/anime_rank_cubit/anime_rank_cubit.dart';
import 'package:flutter/material.dart';

import 'package:anime_app/views/home/widgets/anime_rank.dart';

import 'package:anime_app/views/home/widgets/carousel_widget.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class HomeView extends StatelessWidget {
  const HomeView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: BlocBuilder<AnimeRankCubit, AnimeRankState>(
        builder: (context, state) {
          if (state is! AnimeRankSuccess) {
            return const Center(
              child: CircularProgressIndicator(
                color: Colors.blue,
              ),
            );
          }
          return CustomScrollView(
            slivers: [
              SliverToBoxAdapter(
                child: Padding(
                  padding: const EdgeInsets.only(left: 20, right: 20, top: 50),
                  child: Column(
                    children: [
                      const CarouselWidget(),
                      ListView.builder(
                        shrinkWrap: true,
                        physics: const NeverScrollableScrollPhysics(),
                        itemCount: animeHomeCategories.length,
                        itemBuilder: (context, index) {
                          final category = animeHomeCategories[index];

                          return AnimeRank(category: category);
                        },
                      ),
                    ],
                  ),
                ),
              ),
            ],
          );
        },
      ),
    );
  }
}
