import 'package:flutter/material.dart';

class RowButtons extends StatelessWidget {
  const RowButtons({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      crossAxisAlignment: CrossAxisAlignment.end,
      children: [
        Container(
          height: 100,
          width: 80,
          decoration: const BoxDecoration(
            color: Color.fromRGBO(1, 6, 20, 1),
            borderRadius: BorderRadius.only(
              topRight: Radius.circular(34),
            ),
          ),
          child: IconButton(
            onPressed: () {},
            icon: const Icon(
              Icons.favorite_border_rounded,
              size: 34,
              color: Colors.white,
            ),
          ),
        ),
        Container(
          height: 100,
          width: 80,
          decoration: const BoxDecoration(
            color: Color.fromRGBO(1, 6, 20, 1),
            borderRadius: BorderRadius.only(
              topLeft: Radius.circular(34),
            ),
          ),
          child: IconButton(
            onPressed: () {},
            icon: const Icon(
              Icons.share_outlined,
              size: 34,
              color: Colors.white,
            ),
          ),
        )
      ],
    );
  }
}
