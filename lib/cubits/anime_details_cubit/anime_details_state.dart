part of 'anime_details_cubit.dart';

@immutable
sealed class AnimeDetailsState {}

final class AnimeDetailsInitial extends AnimeDetailsState {}

final class AnimeDetailsLoading extends AnimeDetailsState {}

final class AnimeDetailsSuccess extends AnimeDetailsState {
  final AnimeDetails animeDetails;

  AnimeDetailsSuccess({required this.animeDetails});
}

final class AnimeDetailsFailure extends AnimeDetailsState {
  final String errorMessage;

  AnimeDetailsFailure({required this.errorMessage});
}
