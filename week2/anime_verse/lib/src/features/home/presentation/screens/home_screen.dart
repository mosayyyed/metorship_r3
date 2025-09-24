import 'package:anime_verse/src/core/routing/app_routing.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';
import '../widgets/home_app_bar.dart';
import '../widgets/categories_section.dart';
import '../widgets/anime_posters_section.dart';
import '../widgets/top_characters_section.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  int _selectedCategoryIndex = 0;

  final List<String> _categories = [
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

  final List<AnimeModel> _animeList = [
    AnimeModel(
      title: 'Detective Conan',
      category: 'Mystery',
      rating: 4.8,
      posterPath: 'assets/animes_posters/detective_conan.png',
    ),
    AnimeModel(
      title: 'Hunter x Hunter',
      category: 'Adventure',
      rating: 4.9,
      posterPath: 'assets/animes_posters/hunter_x_hunter.png',
    ),
    AnimeModel(
      title: 'Dragon Ball Z',
      category: 'Action',
      rating: 4.7,
      posterPath: 'assets/animes_posters/dragon_ball_z.png',
    ),
    AnimeModel(
      title: 'Detective Conan',
      category: 'Mystery',
      rating: 4.8,
      posterPath: 'assets/animes_posters/detective_conan.png',
    ),
    AnimeModel(
      title: 'Hunter x Hunter',
      category: 'Adventure',
      rating: 4.9,
      posterPath: 'assets/animes_posters/hunter_x_hunter.png',
    ),
    AnimeModel(
      title: 'Dragon Ball Z',
      category: 'Action',
      rating: 4.7,
      posterPath: 'assets/animes_posters/dragon_ball_z.png',
    ),
  ];

  // Sample characters data
  final List<CharacterModel> _topCharacters = [
    CharacterModel(
      name: 'Luffy',
      animeName: 'One Piece',
      imagePath: 'assets/charactars/charactar_1.png',
    ),
    CharacterModel(
      name: 'Gon Freecss',
      animeName: 'Hunter x Hunter',
      imagePath: 'assets/charactars/charactar_2.png',
    ),
    CharacterModel(
      name: 'Naruto Uzumaki',
      animeName: 'Naruto',
      imagePath: 'assets/charactars/charactar_3.png',
    ),
    CharacterModel(
      name: 'Conan Edogawa',
      animeName: 'Detective Conan',
      imagePath: 'assets/charactars/charactar_4.png',
    ),
    CharacterModel(
      name: 'Goku',
      animeName: 'Dragon Ball Z',
      imagePath: 'assets/charactars/charactar_5.png',
    ),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.transparent,
      body: CustomScrollView(
        slivers: [
          // App Bar
          const HomeAppBar(),

          // Spacing
          SliverToBoxAdapter(child: SizedBox(height: 40.h)),

          // Categories Section
          CategoriesSection(
            categories: _categories,
            selectedIndex: _selectedCategoryIndex,
            onCategorySelected: (index) {
              setState(() {
                _selectedCategoryIndex = index;
              });
            },
          ),

          // Spacing
          SliverToBoxAdapter(child: SizedBox(height: 30.h)),

          // Anime Posters Section
          AnimePostersSection(
            animeList: _animeList,
            onAnimeTap: (anime) {
              GoRouter.of(context).push(AppRouter.animeDetailsPath);
            },
          ),

          // Spacing
          SliverToBoxAdapter(child: SizedBox(height: 30.h)),

          // Top Characters Section
          TopCharactersSection(
            characters: _topCharacters,
            onCharacterTap: (character) {
              // Handle character tap
              print('Tapped on: ${character.name}');
            },
          ),

          // Bottom spacing
          SliverToBoxAdapter(child: SizedBox(height: 80.h)),
        ],
      ),
    );
  }
}
