import 'package:flutter/material.dart';
import 'package:movie_task/core/extensions/context_extensions.dart';

class RatingWidget extends StatelessWidget {
  final double rating;

  const RatingWidget({super.key, required this.rating});

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
  Icon(Icons.star, color: context.colorScheme.secondary, size: 18),
        const SizedBox(width: 4),
        Text(
          '${rating.toStringAsFixed(1)} / 10',
          style: Theme.of(context).textTheme.bodyMedium,
        ),
      ],
    );
  }
}
