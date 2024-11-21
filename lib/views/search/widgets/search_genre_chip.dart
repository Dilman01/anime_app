import 'package:flutter/material.dart';

class SearchGenreChip extends StatelessWidget {
  const SearchGenreChip({
    super.key,
    required this.title,
    required this.onTap,
    required this.isSelected,
  });
  final String title;
  final VoidCallback? onTap;
  final bool isSelected;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        decoration: BoxDecoration(
          color: Color.fromRGBO(2, 11, 37, 1),
          gradient: isSelected
              ? LinearGradient(
                  colors: [
                    Color.fromRGBO(38, 132, 241, 1),
                    Color.fromRGBO(38, 132, 241, 0.7),
                  ],
                  begin: Alignment.centerRight,
                  end: Alignment.centerLeft,
                )
              : null,
          borderRadius: BorderRadius.circular(8),
        ),
        padding: EdgeInsets.symmetric(horizontal: 12, vertical: 8),
        child: Text(
          title,
          style: TextStyle(
            fontSize: 14,
            fontWeight: FontWeight.w300,
            color: Colors.white.withOpacity(0.8),
          ),
        ),
      ),
    );
  }
}
