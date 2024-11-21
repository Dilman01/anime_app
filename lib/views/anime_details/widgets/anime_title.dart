import 'package:flutter/material.dart';

class AnimeTitle extends StatelessWidget {
  const AnimeTitle({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        Text(
          'Violet Evergarden',
          style: TextStyle(
            fontSize: 20,
            fontWeight: FontWeight.bold,
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
          '4.5',
          style: TextStyle(
            fontSize: 16,
          ),
        ),
      ],
    );
  }
}
