import 'package:anime_app/cubits/anime_search_cubit/anime_search_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class SearchTextField extends StatelessWidget {
  const SearchTextField({super.key, this.enabled = true});

  final bool enabled;

  @override
  Widget build(BuildContext context) {
    return TextField(
      enabled: enabled,
      onSubmitted: (value) {
        if (value.trim().isNotEmpty) {
          context.read<AnimeSearchCubit>().getAnimeBySearch(query: value);
        }
      },
      autofocus: true,
      cursorColor: Colors.white,
      decoration: InputDecoration(
        fillColor: const Color.fromRGBO(2, 11, 37, 1),
        filled: true,
        border: OutlineInputBorder(
          borderSide: BorderSide.none,
          borderRadius: BorderRadius.circular(12),
        ),
        prefixIcon: const Icon(
          Icons.search,
          size: 30,
        ),
        hintText: 'Search',
      ),
    );
  }
}
