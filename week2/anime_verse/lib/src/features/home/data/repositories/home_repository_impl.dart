import '../../domain/entities/anime.dart';
import '../../domain/entities/character.dart';
import '../../domain/repositories/home_repository.dart';
import '../datasources/home_data_source.dart';
import '../models/anime_model.dart';
import '../models/character_model.dart';

class HomeRepositoryImpl implements HomeRepository {
  final HomeDataSource dataSource;

  HomeRepositoryImpl(this.dataSource);

  @override
  Future<List<Anime>> getAnimeList() async {
    final List<AnimeModel> animeModels = await dataSource.getAnimeList();
    return animeModels
        .map(
          (model) => Anime(
            title: model.title,
            category: model.category,
            rating: model.rating,
            posterPath: model.posterPath,
          ),
        )
        .toList();
  }

  @override
  Future<List<Character>> getCharactersList() async {
    final List<CharacterModel> characterModels = await dataSource
        .getCharactersList();
    return characterModels
        .map(
          (model) => Character(
            name: model.name,
            animeName: model.animeName,
            imagePath: model.imagePath,
          ),
        )
        .toList();
  }

  @override
  Future<List<String>> getCategories() async {
    return await dataSource.getCategories();
  }
}
