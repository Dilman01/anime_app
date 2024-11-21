import 'package:anime_app/views/anime_details/widgets/details_section.dart';
import 'package:anime_app/views/anime_details/widgets/image_section.dart';
import 'package:flutter/material.dart';

class AnimeDetailsView extends StatelessWidget {
  const AnimeDetailsView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              ImageSection(),
              SizedBox(
                height: 20,
              ),
              DetailsSection(),
            ],
          ),
        ),
      ),
    );
  }
}
