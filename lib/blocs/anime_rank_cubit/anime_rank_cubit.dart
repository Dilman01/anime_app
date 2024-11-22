import 'package:anime_app/models/anime.dart';
import 'package:anime_app/repositories/anime_repository.dart';
import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';

part 'anime_rank_state.dart';

class AnimeRankCubit extends Cubit<AnimeRankState> {
  final AnimeRepository animeRepository;

  AnimeRankCubit(this.animeRepository) : super(AnimeRankInitial());

  void getAnimesByRank({required String rankType, int limit = 10}) async {
    emit(AnimeRankLoading());

    try {
      final animes = await animeRepository.getAnimeByRankingType(
        rankingType: rankType,
        limit: limit,
      );

      emit(
        AnimeRankSuccess(animes: animes),
      );
    } catch (e) {
      emit(
        AnimeRankFailure(
          errorMessage: e.toString(),
        ),
      );

      throw Exception(e.toString());
    }
  }
}
