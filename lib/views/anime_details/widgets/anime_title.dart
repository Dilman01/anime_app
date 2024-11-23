import 'package:flutter/material.dart';

class AnimeTitle extends StatelessWidget {
  const AnimeTitle({
    super.key,
    required this.title,
    required this.score,
  });

  final String title;
  final String score;

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        SizedBox(
          width: 250,
          child: Text(
            title,
            maxLines: 3,
            overflow: TextOverflow.ellipsis,
            style: TextStyle(
              fontSize: 20,
              fontWeight: FontWeight.bold,
            ),
          ),
        ),
        Spacer(),
        Icon(
          Icons.star,
          color: Color.fromRGBO(37, 136, 241, 1),
          size: 20,
        ),
        SizedBox(
          width: 2,
        ),
        Text(
          score,
          style: TextStyle(
            fontSize: 16,
          ),
        ),
      ],
    );
  }
}
