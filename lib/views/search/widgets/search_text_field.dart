import 'package:flutter/material.dart';

class SearchTextField extends StatelessWidget {
  const SearchTextField({super.key, this.enabled = true});

  final bool enabled;

  @override
  Widget build(BuildContext context) {
    return TextField(
      enabled: enabled,
      autofocus: true,
      cursorColor: Colors.white,
      decoration: InputDecoration(
        fillColor: Color.fromRGBO(2, 11, 37, 1),
        filled: true,
        border: OutlineInputBorder(
          borderSide: BorderSide.none,
          borderRadius: BorderRadius.circular(12),
        ),
        prefixIcon: Icon(
          Icons.search,
          size: 30,
        ),
        hintText: 'Search',
      ),
    );
  }
}
