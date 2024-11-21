import 'package:flutter/material.dart';

import 'package:anime_app/core/common/widgets/anime_grid_view.dart';

class SeasonsView extends StatelessWidget {
  const SeasonsView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Seasons'),
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            DropdownMenu(
              width: MediaQuery.of(context).size.width * 0.9,
              menuHeight: 300,
              dropdownMenuEntries: [
                DropdownMenuEntry(
                  value: '2024 Fall',
                  label: '2024 Fall',
                ),
                DropdownMenuEntry(
                  value: '2024 Summer',
                  label: '2024 Summer',
                ),
                DropdownMenuEntry(
                  value: '2024 Spring',
                  label: '2024 Spring',
                ),
                DropdownMenuEntry(
                  value: '2024 Winter',
                  label: '2024 Winter',
                ),
                DropdownMenuEntry(
                  value: '2024 Winter',
                  label: '2024 Winter',
                ),
                DropdownMenuEntry(
                  value: '2024 Winter',
                  label: '2024 Winter',
                ),
                DropdownMenuEntry(
                  value: '2024 Winter',
                  label: '2024 Winter',
                ),
              ],
              initialSelection: '2024 Fall',
              menuStyle: MenuStyle(
                elevation: WidgetStatePropertyAll(0),
                backgroundColor: WidgetStatePropertyAll(
                  Color.fromRGBO(1, 6, 20, 1),
                ),
              ),
            ),
            SizedBox(
              height: 10,
            ),
            Expanded(
              child: AnimeGridView(),
            ),
          ],
        ),
      ),
    );
  }
}
