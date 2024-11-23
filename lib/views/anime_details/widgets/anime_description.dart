import 'package:flutter/material.dart';
import 'package:readmore/readmore.dart';

class AnimeDescription extends StatelessWidget {
  const AnimeDescription({
    super.key,
    required this.description,
  });

  final String description;

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
          description,
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
