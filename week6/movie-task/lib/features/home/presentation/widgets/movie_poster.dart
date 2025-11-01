import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:movie_task/core/extensions/context_extensions.dart';

class MoviePoster extends StatelessWidget {
  final String? posterUrl;
  final double width;
  final double height;

  const MoviePoster({
    super.key,
    this.posterUrl,
    required this.width,
    required this.height,
  });

  @override
  Widget build(BuildContext context) {
  final colorScheme = context.colorScheme;

    return ClipRRect(
      borderRadius: BorderRadius.circular(8),
      child: posterUrl != null
          ? CachedNetworkImage(
              imageUrl: posterUrl!,
              width: width,
              height: height,
              fit: BoxFit.cover,
              placeholder: (context, url) => Container(
                width: width,
                height: height,
                decoration: BoxDecoration(
                  color: colorScheme.surfaceVariant,
                  borderRadius: BorderRadius.circular(8),
                ),
                child: Center(
                  child: CircularProgressIndicator(
                    strokeWidth: 2,
                    valueColor:
                        AlwaysStoppedAnimation<Color>(colorScheme.primary),
                  ),
                ),
              ),
              errorWidget: (context, url, error) => Container(
                width: width,
                height: height,
                decoration: BoxDecoration(
                  color: colorScheme.surfaceVariant,
                  borderRadius: BorderRadius.circular(8),
                ),
                child: Center(
                  child: Icon(
                    Icons.broken_image_outlined,
                    color: colorScheme.onSurface
                        .withAlpha((0.5 * 255).round()),
                    size: 32,
                  ),
                ),
              ),
            )
          : Container(
              width: width,
              height: height,
              decoration: BoxDecoration(
                color: colorScheme.surfaceVariant,
                borderRadius: BorderRadius.circular(8),
              ),
              child: Center(
                child: Icon(
                  Icons.hide_image_outlined,
                  color: colorScheme.onSurface.withAlpha((0.5 * 255).round()),
                  size: 32,
                ),
              ),
            ),
    );
  }
}
