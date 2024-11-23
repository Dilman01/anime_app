import 'package:anime_app/models/anime_details.dart';
import 'package:anime_app/repositories/anime_repository.dart';
import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';

part 'anime_details_state.dart';

class AnimeDetailsCubit extends Cubit<AnimeDetailsState> {
  final AnimeRepository _animeRepository;
  AnimeDetailsCubit(this._animeRepository) : super(AnimeDetailsInitial());

  void getAnimeDetails({required int id}) async {
    emit(AnimeDetailsLoading());

    try {
      final animeDetails = await _animeRepository.getAnimeDetails(id: id);

      emit(AnimeDetailsSuccess(animeDetails: animeDetails));
    } catch (e) {
      emit(AnimeDetailsFailure(errorMessage: e.toString()));
    }
  }
}
