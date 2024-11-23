part of 'anime_search_cubit.dart';

@immutable
sealed class AnimeSearchState {}

final class AnimeSearchInitial extends AnimeSearchState {}

final class AnimeSearchLoading extends AnimeSearchState {}

final class AnimeSearchSuccess extends AnimeSearchState {
  final List<Anime> animes;
  AnimeSearchSuccess({required this.animes});
}

final class AnimeSearchFailure extends AnimeSearchState {
  final String errorMessage;
  AnimeSearchFailure({required this.errorMessage});
}
