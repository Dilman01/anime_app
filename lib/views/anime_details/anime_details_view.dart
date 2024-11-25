import 'package:anime_app/cubits/anime_details_cubit/anime_details_cubit.dart';
import 'package:anime_app/views/anime_details/widgets/details_section.dart';
import 'package:anime_app/views/anime_details/widgets/image_section.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class AnimeDetailsView extends StatefulWidget {
  const AnimeDetailsView({
    super.key,
    required this.id,
  });

  final int id;

  @override
  State<AnimeDetailsView> createState() => _AnimeDetailsViewState();
}

class _AnimeDetailsViewState extends State<AnimeDetailsView> {
  @override
  void initState() {
    super.initState();

    context.read<AnimeDetailsCubit>().getAnimeDetails(id: widget.id);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          child: BlocBuilder<AnimeDetailsCubit, AnimeDetailsState>(
            builder: (context, state) {
              if (state is AnimeDetailsLoading) {
                return SizedBox(
                  height: MediaQuery.of(context).size.height,
                  child: Center(
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
                    SizedBox(
                      height: 20,
                    ),
                    DetailsSection(
                      animeDetails: state.animeDetails,
                    ),
                  ],
                );
              } else {
                return SizedBox();
              }
            },
          ),
        ),
      ),
    );
  }
}
