import '../entities/anime.dart';
import '../entities/character.dart';

abstract class HomeRepository {
  Future<List<Anime>> getAnimeList();
  Future<List<Character>> getCharactersList();
  Future<List<String>> getCategories();
}
