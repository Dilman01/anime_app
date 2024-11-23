import 'package:anime_app/cubits/anime_seasonal/anime_seasonal_cubit.dart';
import 'package:anime_app/views/seasons/widgets/season_drop_down_menu.dart';
import 'package:flutter/material.dart';

import 'package:anime_app/core/common/widgets/anime_grid_view.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

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
            SeasonDropDownMenu(),
            SizedBox(
              height: 10,
            ),
            Expanded(
              child: BlocBuilder<AnimeSeasonalCubit, AnimeSeasonalState>(
                builder: (context, state) {
                  if (state is AnimeSeasonaLoading) {
                    return Center(
                      child: CircularProgressIndicator(),
                    );
                  } else if (state is AnimeSeasonalFailure) {
                    return Center(
                      child: Text(state.errorMessage),
                    );
                  } else if (state is AnimeSeasonalSuccess) {
                    return AnimeGridView(
                      animes: state.animes,
                    );
                  } else {
                    return SizedBox();
                  }
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
