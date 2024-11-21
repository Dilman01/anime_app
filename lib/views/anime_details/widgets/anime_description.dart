import 'package:flutter/material.dart';
import 'package:readmore/readmore.dart';

class AnimeDescription extends StatelessWidget {
  const AnimeDescription({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          'Description',
          style: TextStyle(
            fontSize: 18,
            fontWeight: FontWeight.w500,
          ),
        ),
        SizedBox(
          height: 8,
        ),
        ReadMoreText(
          'The story follows Violet Evergarden, a young ex-soldier who becomes an Auto Memory Doll tasked with writing letters that can connect people. A 13-episode anime television series adaptation produced by Kyoto Animation aired between January and April 2018 with several advance screenings taking place in 2017.',
          style: TextStyle(
            fontSize: 14,
            color: Colors.white.withOpacity(0.8),
            fontWeight: FontWeight.w300,
          ),
          trimMode: TrimMode.Line,
          trimLines: 3,
          colorClickableText: Color.fromRGBO(37, 136, 241, 0.7),
          trimCollapsedText: 'Show more',
          trimExpandedText: '\nShow less',
          moreStyle: TextStyle(
            fontSize: 14,
            fontWeight: FontWeight.bold,
            color: Color.fromRGBO(37, 136, 241, 1),
          ),
        ),
      ],
    );
  }
}
