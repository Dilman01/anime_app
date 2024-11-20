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
            child: Column(
              children: [
                CarouselWidget(),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
