import 'package:flutter/material.dart';

class CustomAppBar extends StatelessWidget {
  const CustomAppBar({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
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
    );
  }
}
