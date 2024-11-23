import 'package:flutter/material.dart';

import 'package:flutter_bloc/flutter_bloc.dart';

import 'package:anime_app/core/utils/utils.dart';
import 'package:anime_app/cubits/anime_seasonal/anime_seasonal_cubit.dart';

class SeasonDropDownMenu extends StatefulWidget {
  const SeasonDropDownMenu({super.key});

  @override
  State<SeasonDropDownMenu> createState() => _SeasonDropDownMenuState();
}

class _SeasonDropDownMenuState extends State<SeasonDropDownMenu> {
  List<int> years = generateYears(40);
  final List<String> seasons = ['Winter', 'Spring', 'Summer', 'Fall'];

  int selectedYear = DateTime.now().year;
  String selectedSeason = getCurrentSeason();

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        DropdownMenu(
          width: MediaQuery.of(context).size.width * 0.4,
          menuHeight: 300,
          initialSelection: selectedYear.toString(),
          menuStyle: MenuStyle(
            elevation: WidgetStatePropertyAll(0),
            backgroundColor: WidgetStatePropertyAll(
              Color.fromRGBO(1, 6, 20, 1),
            ),
          ),
          dropdownMenuEntries: years.map(
            (year) {
              return DropdownMenuEntry<String>(
                value: year.toString(),
                label: year.toString(),
              );
            },
          ).toList(),
          onSelected: (value) {
            setState(() {
              selectedYear = int.tryParse(value!)!;
            });

            context.read<AnimeSeasonalCubit>().getSeasonalAnimes(
                  year: selectedYear,
                  season: selectedSeason,
                );
          },
        ),
        DropdownMenu(
          width: MediaQuery.of(context).size.width * 0.4,
          menuHeight: 300,
          initialSelection: getCurrentSeason(),
          menuStyle: MenuStyle(
            elevation: WidgetStatePropertyAll(0),
            backgroundColor: WidgetStatePropertyAll(
              Color.fromRGBO(1, 6, 20, 1),
            ),
          ),
          dropdownMenuEntries: seasons.map(
            (season) {
              return DropdownMenuEntry<String>(
                value: season,
                label: season,
              );
            },
          ).toList(),
          onSelected: (value) {
            setState(() {
              selectedSeason = value!;
            });

            context.read<AnimeSeasonalCubit>().getSeasonalAnimes(
                  year: selectedYear,
                  season: selectedSeason,
                );
          },
        ),
      ],
    );
  }
}
