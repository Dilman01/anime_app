part of 'anime_categories_cubit.dart';

@immutable
sealed class AnimeCategoriesState {}

final class AnimeCategoriesInitial extends AnimeCategoriesState {}

final class AnimeCategoriesLoading extends AnimeCategoriesState {}

final class AnimeCategoriesSuccess extends AnimeCategoriesState {
  final List<Anime> animes;
  AnimeCategoriesSuccess({required this.animes});
}

final class AnimeCategoriesFailure extends AnimeCategoriesState {
  final String errorMessage;
  AnimeCategoriesFailure({required this.errorMessage});
}
