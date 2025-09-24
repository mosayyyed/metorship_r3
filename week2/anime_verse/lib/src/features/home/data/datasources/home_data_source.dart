import '../models/anime_model.dart';
import '../models/character_model.dart';

class HomeDataSource {
  // Static data for anime list
  static const List<AnimeModel> _animeList = [
    AnimeModel(
      title: 'Attack on Titan',
      category: 'Action',
      rating: 4.8,
      posterPath: 'assets/animes_posters/attack_on_titan.png',
    ),
    AnimeModel(
      title: 'One Piece',
      category: 'Adventure',
      rating: 4.9,
      posterPath: 'assets/animes_posters/one_piece.png',
    ),
    AnimeModel(
      title: 'Death Note',
      category: 'Thriller',
      rating: 4.7,
      posterPath: 'assets/animes_posters/death_note.png',
    ),
    AnimeModel(
      title: 'Spirited Away',
      category: 'Fantasy',
      rating: 4.9,
      posterPath: 'assets/animes_posters/spirited_away.png',
    ),
    AnimeModel(
      title: 'Demon Slayer',
      category: 'Action',
      rating: 4.8,
      posterPath: 'assets/animes_posters/demon_slayer.png',
    ),
    AnimeModel(
      title: 'Dragon Ball Z',
      category: 'Action',
      rating: 4.7,
      posterPath: 'assets/animes_posters/dragon_ball_z.png',
    ),
  ];

  // Static data for characters
  static const List<CharacterModel> _charactersList = [
    CharacterModel(
      name: 'Levi Ackerman',
      animeName: 'Attack on Titan',
      imagePath: 'assets/charactars/charactar_1.png',
    ),
    CharacterModel(
      name: 'Luffy',
      animeName: 'One Piece',
      imagePath: 'assets/charactars/charactar_2.png',
    ),
    CharacterModel(
      name: 'Light Yagami',
      animeName: 'Death Note',
      imagePath: 'assets/charactars/charactar_3.png',
    ),
    CharacterModel(
      name: 'Chihiro',
      animeName: 'Spirited Away',
      imagePath: 'assets/charactars/charactar_4.png',
    ),
    CharacterModel(
      name: 'Goku',
      animeName: 'Dragon Ball Z',
      imagePath: 'assets/charactars/charactar_5.png',
    ),
  ];

  // Static categories
  static const List<String> _categories = [
    'All',
    'Popular',
    'Trending',
    'Top Rated',
    'New Releases',
    'Action',
    'Romance',
    'Comedy',
    'Drama',
    'Fantasy',
    'Horror',
  ];

  // Get anime list
  Future<List<AnimeModel>> getAnimeList() async {
    // Simulate network delay
    await Future.delayed(const Duration(milliseconds: 500));
    return _animeList;
  }

  // Get characters list
  Future<List<CharacterModel>> getCharactersList() async {
    // Simulate network delay
    await Future.delayed(const Duration(milliseconds: 300));
    return _charactersList;
  }

  // Get categories
  Future<List<String>> getCategories() async {
    // Simulate network delay
    await Future.delayed(const Duration(milliseconds: 100));
    return _categories;
  }
}
