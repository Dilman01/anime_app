import 'package:anime_app/cubits/anime_details_cubit/anime_details_cubit.dart';
import 'package:anime_app/repositories/anime_repository.dart';
import 'package:anime_app/views/anime_details/widgets/details_section.dart';
import 'package:anime_app/views/anime_details/widgets/image_section.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class AnimeDetailsView extends StatelessWidget {
  const AnimeDetailsView({
    super.key,
    required this.id,
  });

  final int id;

  @override
  Widget build(BuildContext context) {
    return BlocProvider<AnimeDetailsCubit>(
      create: (context) => AnimeDetailsCubit(
        context.read<AnimeRepository>(),
      )..getAnimeDetails(
          id: id,
        ),
      child: Scaffold(
        body: SafeArea(
          child: SingleChildScrollView(
            child: BlocBuilder<AnimeDetailsCubit, AnimeDetailsState>(
              builder: (context, state) {
                if (state is AnimeDetailsLoading) {
                  return SizedBox(
                    height: MediaQuery.of(context).size.height,
                    child: const Center(
                      child: CircularProgressIndicator(
                        color: Colors.blue,
                      ),
                    ),
                  );
                } else if (state is AnimeDetailsFailure) {
                  return Center(
                    child: Text(state.errorMessage),
                  );
                } else if (state is AnimeDetailsSuccess) {
                  return Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      ImageSection(
                        imageUrl: state.animeDetails.mainPicture.large,
                      ),
                      const SizedBox(
                        height: 20,
                      ),
                      DetailsSection(
                        animeDetails: state.animeDetails,
                      ),
                    ],
                  );
                } else {
                  return const SizedBox();
                }
              },
            ),
          ),
        ),
      ),
    );
  }
}
