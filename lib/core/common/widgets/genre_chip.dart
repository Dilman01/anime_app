import 'package:flutter/material.dart';

class GenreChip extends StatelessWidget {
  const GenreChip({
    super.key,
    required this.title,
  });

  final String title;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(
        horizontal: 8,
      ),
      margin: const EdgeInsets.symmetric(horizontal: 2),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(12),
        border: Border.all(
          color: const Color.fromRGBO(6, 23, 66, 1),
        ),
        color: const Color.fromRGBO(2, 11, 37, 1),
      ),
      child: Text(
        title,
        textAlign: TextAlign.center,
        style: const TextStyle(
          fontSize: 12,
          fontWeight: FontWeight.w300,
          color: Color.fromRGBO(124, 140, 162, 1),
        ),
      ),
    );
  }
}
