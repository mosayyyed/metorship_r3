import 'package:flutter/material.dart';
import 'package:movie_task/core/extensions/context_extensions.dart';

class LoadMoreButton extends StatelessWidget {
  final VoidCallback onPressed;

  const LoadMoreButton({super.key, required this.onPressed});

  @override
  Widget build(BuildContext context) {
    final colorScheme = context.colorScheme;

    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 16),
      child: SizedBox(
        width: double.infinity,
        height: 48,
        child: ElevatedButton(
          onPressed: onPressed,
          style: ElevatedButton.styleFrom(
            backgroundColor: colorScheme.surface,
            foregroundColor: colorScheme.onSurface,
            elevation: 0,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(24),
            ),
          ),
          child: const Text(
            'Load More Movies',
            style: TextStyle(fontSize: 14, fontWeight: FontWeight.w500),
          ),
        ),
      ),
    );
  }
}
