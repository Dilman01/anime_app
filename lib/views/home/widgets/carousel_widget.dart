import 'package:anime_app/views/anime_details/anime_details_view.dart';
import 'package:flutter/material.dart';

import 'package:anime_app/cubits/anime_rank_cubit/anime_rank_cubit.dart';
import 'package:anime_app/repositories/anime_repository.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class CarouselWidget extends StatefulWidget {
  const CarouselWidget({super.key});

  @override
  State<CarouselWidget> createState() => _CarouselWidgetState();
}

class _CarouselWidgetState extends State<CarouselWidget> {
  int _current = 0;
  final CarouselSliderController _controller = CarouselSliderController();

  @override
  Widget build(BuildContext context) {
    return BlocProvider<AnimeRankCubit>(
      create: (context) => AnimeRankCubit(AnimeRepository())
        ..getAnimesByRank(
          rankType: 'bypopularity',
          limit: 5,
        ),
      child: BlocBuilder<AnimeRankCubit, AnimeRankState>(
        builder: (context, state) {
          if (state is! AnimeRankSuccess) {
            return Center(
              child: CircularProgressIndicator(),
            );
          }
          return Stack(
            children: [
              CarouselSlider(
                carouselController: _controller,
                options: CarouselOptions(
                  height: 360,
                  enlargeCenterPage: true,
                  autoPlay: true,
                  autoPlayAnimationDuration: Duration(milliseconds: 1500),
                  viewportFraction: 0.7,
                  onPageChanged: (index, reason) {
                    setState(() {
                      _current = index;
                    });
                  },
                ),
                items: state.animes.map(
                  (anime) {
                    return GestureDetector(
                      onTap: () {
                        Navigator.of(context).push(
                          MaterialPageRoute(
                            builder: (context) => AnimeDetailsView(
                              id: anime.node.id,
                            ),
                          ),
                        );
                      },
                      child: Container(
                        margin: EdgeInsets.symmetric(horizontal: 5),
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(8),
                          image: DecorationImage(
                            fit: BoxFit.cover,
                            image: NetworkImage(
                              anime.node.mainPicture.large,
                            ),
                          ),
                        ),
                      ),
                    );
                  },
                ).toList(),
              ),
              Positioned(
                bottom: 0,
                right: 0,
                left: 0,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: state.animes.asMap().entries.map(
                    (entry) {
                      return Container(
                        width: 12,
                        height: 10,
                        margin: EdgeInsets.symmetric(horizontal: 2),
                        decoration: BoxDecoration(
                          shape: BoxShape.circle,
                          color: _current == entry.key
                              ? Color.fromRGBO(37, 136, 243, 1)
                              : Colors.white70,
                        ),
                      );
                    },
                  ).toList(),
                ),
              ),
            ],
          );
        },
      ),
    );
  }
}
