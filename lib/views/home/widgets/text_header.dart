import 'package:flutter/material.dart';

import 'package:anime_app/views/home/see_all_screen.dart';

class TextHeader extends StatelessWidget {
  const TextHeader({
    super.key,
    required this.title,
  });

  final String title;

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      crossAxisAlignment: CrossAxisAlignment.end,
      children: [
        Text(
          title,
          style: TextStyle(
            fontSize: 18,
            fontWeight: FontWeight.w500,
          ),
        ),
        InkWell(
          onTap: () {
            Navigator.of(context).push(
              MaterialPageRoute(
                builder: (context) => SeeAllScreen(
                  title: title,
                ),
              ),
            );
          },
          child: Text(
            'See all',
            style: TextStyle(
              fontSize: 18,
              color: Color.fromRGBO(37, 136, 243, 1),
            ),
          ),
        ),
      ],
    );
  }
}
