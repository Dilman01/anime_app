import 'package:anime_app/models/anime.dart';
import 'package:anime_app/repositories/anime_repository.dart';
import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';

part 'anime_search_state.dart';

class AnimeSearchCubit extends Cubit<AnimeSearchState> {
  final AnimeRepository _animeRepository;

  AnimeSearchCubit(this._animeRepository) : super(AnimeSearchInitial());

  void getAnimeBySearch({required String query}) async {
    emit(AnimeSearchLoading());

    try {
      final List<Anime> animes =
          await _animeRepository.getAnimesbySearch(query: query);

      emit(AnimeSearchSuccess(animes: animes));
    } catch (e) {
      emit(AnimeSearchFailure(errorMessage: e.toString()));
    }
  }
}
