import 'package:flutter/material.dart';
import 'package:movie_task/core/constants/api_constants.dart';
import 'package:movie_task/features/home/data/models/movie_model.dart';
import 'package:movie_task/features/home/presentation/widgets/movie_poster.dart';
// rating_widget not used here (rating badge implemented inline)
import 'package:movie_task/features/home/presentation/widgets/genre_chip.dart';

class MovieDetailsView extends StatelessWidget {
  final MovieModel movie;
  final bool isDarkMode;

  const MovieDetailsView({
    super.key,
    required this.movie,
    required this.isDarkMode,
  });

  @override
  Widget build(BuildContext context) {
    final posterUrl = movie.posterPath != null
        ? ApiConstants.getPosterUrl(movie.posterPath!)
        : null;

    final colorScheme = Theme.of(context).colorScheme;
    final textTheme = Theme.of(context).textTheme;

    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          icon: const Icon(Icons.arrow_back),
          onPressed: () => Navigator.pop(context),
        ),
        title: Text(movie.title, overflow: TextOverflow.ellipsis, maxLines: 1),
        elevation: 2,
      ),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Poster with subtle shadow and gradient
            Stack(
              alignment: Alignment.bottomCenter,
              children: [
                Container(
                  width: double.infinity,
                  height: 320,
                  decoration: BoxDecoration(
                    gradient: LinearGradient(
                      colors: [
                        colorScheme.primary.withOpacity(0.12),
                        colorScheme.background,
                      ],
                      begin: Alignment.topCenter,
                      end: Alignment.bottomCenter,
                    ),
                  ),
                ),
                Positioned(
                  top: 28,
                  left: 24,
                  right: 24,
                  child: Hero(
                    tag: 'poster_${movie.id}',
                    child: Material(
                      color: Colors.transparent,
                      child: ClipRRect(
                        borderRadius: BorderRadius.circular(12),
                        child: MoviePoster(
                          posterUrl: posterUrl,
                          width: double.infinity,
                          height: 260,
                        ),
                      ),
                    ),
                  ),
                ),
              ],
            ),

            const SizedBox(height: 16),

            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  // Title and metadata row
                  Text(movie.title, style: textTheme.headlineLarge),

                  const SizedBox(height: 8),

                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Row(
                        children: [
                          GenreChip(genre: movie.getGenreNames()),
                          const SizedBox(width: 8),
                          Text(
                            movie.releaseDate.isNotEmpty
                                ? movie.releaseDate.split('-').first
                                : '',
                            style: textTheme.bodySmall,
                          ),
                        ],
                      ),

                      // Rating Badge
                      Container(
                        decoration: BoxDecoration(
                          color: colorScheme.primaryContainer,
                          borderRadius: BorderRadius.circular(20),
                        ),
                        padding: const EdgeInsets.symmetric(
                          horizontal: 12,
                          vertical: 8,
                        ),
                        child: Row(
                          children: [
                            Icon(
                              Icons.star,
                              size: 16,
                              color: colorScheme.primary,
                            ),
                            const SizedBox(width: 6),
                            Text(
                              movie.voteAverage.toStringAsFixed(1),
                              style: textTheme.bodyMedium?.copyWith(
                                fontWeight: FontWeight.w700,
                              ),
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),

                  const SizedBox(height: 16),

                  // Description
                  Text('Description', style: textTheme.titleLarge),
                  const SizedBox(height: 8),
                  Text(
                    movie.overview.isNotEmpty
                        ? movie.overview
                        : 'No description available.',
                    style: textTheme.bodyMedium?.copyWith(height: 1.6),
                  ),

                  const SizedBox(height: 24),

                  // Actions
                  Row(
                    children: [
                      Expanded(
                        child: ElevatedButton.icon(
                          onPressed: () {},
                          icon: const Icon(Icons.play_arrow),
                          label: const Text('Play'),
                        ),
                      ),
                      const SizedBox(width: 12),
                      OutlinedButton.icon(
                        onPressed: () {},
                        icon: const Icon(Icons.bookmark_add_outlined),
                        label: const Text('Save'),
                        style: OutlinedButton.styleFrom(
                          padding: const EdgeInsets.symmetric(vertical: 14),
                        ),
                      ),
                    ],
                  ),

                  const SizedBox(height: 40),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
