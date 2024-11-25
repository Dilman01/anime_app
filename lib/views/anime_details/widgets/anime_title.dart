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
            style: const TextStyle(
              fontSize: 20,
              fontWeight: FontWeight.bold,
            ),
          ),
        ),
        const Spacer(),
        const Icon(
          Icons.star,
          color: Color.fromRGBO(37, 136, 241, 1),
          size: 20,
        ),
        const SizedBox(
          width: 2,
        ),
        Text(
          score,
          style: const TextStyle(
            fontSize: 16,
          ),
        ),
      ],
    );
  }
}
