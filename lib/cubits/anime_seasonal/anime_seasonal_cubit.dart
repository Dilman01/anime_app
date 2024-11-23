import 'package:anime_app/models/anime.dart';
import 'package:anime_app/repositories/anime_repository.dart';
import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';

part 'anime_seasonal_state.dart';

class AnimeSeasonalCubit extends Cubit<AnimeSeasonalState> {
  final AnimeRepository _animeRepository;

  AnimeSeasonalCubit(this._animeRepository) : super(AnimeSeasonalInitial());

  void getSeasonalAnimes({required int year, required String season}) async {
    emit(AnimeSeasonaLoading());

    try {
      final animes = await _animeRepository.getSeasonalAnimes(
        year: year,
        season: season,
      );

      emit(AnimeSeasonalSuccess(animes: animes));
    } catch (e) {
      emit(AnimeSeasonalFailure(errorMessage: e.toString()));
    }
  }
}
