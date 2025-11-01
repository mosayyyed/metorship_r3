import 'package:flutter/material.dart';
import 'package:movie_task/core/extensions/context_extensions.dart';

class GenreChip extends StatelessWidget {
  final String genre;

  const GenreChip({super.key, required this.genre});

  @override
  Widget build(BuildContext context) {
  final colorScheme = context.colorScheme;

  final backgroundColor = colorScheme.primaryContainer;
  final textColor = colorScheme.onPrimaryContainer;

    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 6),
      decoration: BoxDecoration(
        color: backgroundColor,
        borderRadius: BorderRadius.circular(6),
      ),
      child: Text(
        genre,
        style: Theme.of(context)
            .textTheme
            .bodyMedium
            ?.copyWith(fontSize: 12, color: textColor),
      ),
    );
  }
}
