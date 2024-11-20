import 'package:anime_app/views/home/widgets/text_header.dart';
import 'package:flutter/material.dart';
import 'package:anime_app/views/home/widgets/carousel_widget.dart';

class HomeView extends StatelessWidget {
  const HomeView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Icon(
              Icons.reorder_rounded,
              size: 30,
            ),
            Icon(
              Icons.notifications,
              size: 30,
            ),
          ],
        ),
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
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
