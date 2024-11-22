part of 'anime_rank_cubit.dart';

@immutable
sealed class AnimeRankState {}

final class AnimeRankInitial extends AnimeRankState {}

final class AnimeRankLoading extends AnimeRankState {}

final class AnimeRankSuccess extends AnimeRankState {
  final List<Anime> animes;
  AnimeRankSuccess({required this.animes});
}

final class AnimeRankFailure extends AnimeRankState {
  final String errorMessage;
  AnimeRankFailure({required this.errorMessage});
}
