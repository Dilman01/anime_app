import 'package:anime_app/views/anime_details/widgets/custom_app_bar.dart';
import 'package:anime_app/views/home/widgets/animes_list_view.dart';
import 'package:anime_app/views/home/widgets/text_header.dart';
import 'package:flutter/material.dart';
import 'package:anime_app/views/home/widgets/carousel_widget.dart';

class HomeView extends StatelessWidget {
  const HomeView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: CustomAppBar(),
      ),
      body: CustomScrollView(
        slivers: [
          SliverToBoxAdapter(
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20),
              child: Column(
                children: [
                  CarouselWidget(),
                  const SizedBox(
                    height: 20,
                  ),
                  TextHeader(
                    title: 'Best anime',
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  AnimesListView(),
                  const SizedBox(
                    height: 20,
                  ),
                  TextHeader(
                    title: 'Popular',
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  AnimesListView(),
                  const SizedBox(
                    height: 20,
                  ),
                  TextHeader(
                    title: 'Latest',
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  AnimesListView(),
                  const SizedBox(
                    height: 100,
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
