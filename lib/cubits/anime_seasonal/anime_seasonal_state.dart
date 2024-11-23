part of 'anime_seasonal_cubit.dart';

@immutable
sealed class AnimeSeasonalState {}

final class AnimeSeasonalInitial extends AnimeSeasonalState {}

final class AnimeSeasonaLoading extends AnimeSeasonalState {}

final class AnimeSeasonalSuccess extends AnimeSeasonalState {
  final List<Anime> animes;
  AnimeSeasonalSuccess({required this.animes});
}

final class AnimeSeasonalFailure extends AnimeSeasonalState {
  final String errorMessage;
  AnimeSeasonalFailure({required this.errorMessage});
}
