import 'package:anime_app/models/anime.dart';
import 'package:anime_app/repositories/anime_repository.dart';
import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';

part 'anime_categories_state.dart';

class AnimeCategoriesCubit extends Cubit<AnimeCategoriesState> {
  final AnimeRepository animeRepository;

  AnimeCategoriesCubit(this.animeRepository) : super(AnimeCategoriesInitial());

  void getAnimesByRank({required String rankType, int limit = 500}) async {
    emit(AnimeCategoriesLoading());

    try {
      final animes = await animeRepository.getAnimeByRankingType(
        rankingType: rankType,
        limit: limit,
      );

      emit(
        AnimeCategoriesSuccess(animes: animes),
      );
    } catch (e) {
      emit(
        AnimeCategoriesFailure(
          errorMessage: e.toString(),
        ),
      );

      throw Exception(e.toString());
    }
  }
}
