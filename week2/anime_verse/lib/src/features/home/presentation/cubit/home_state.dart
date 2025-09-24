import '../../domain/entities/anime.dart';
import '../../domain/entities/character.dart';

abstract class HomeState {}

class HomeInitial extends HomeState {}

class HomeLoading extends HomeState {}

class HomeLoaded extends HomeState {
  final List<Anime> animeList;
  final List<Character> characterList;
  final List<String> categories;
  HomeLoaded({
    required this.animeList,
    required this.characterList,
    required this.categories,
  });
}

class HomeError extends HomeState {
  final String message;
  HomeError(this.message);
}
