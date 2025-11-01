import 'package:flutter/material.dart';
import 'package:movie_task/core/extensions/context_extensions.dart';

class BottomIndicator extends StatelessWidget {
  const BottomIndicator({super.key});

  @override
  Widget build(BuildContext context) {
  final colorScheme = context.colorScheme;

    final indicatorColor = colorScheme.onSurface.withAlpha((0.35 * 255).round());

    return Container(
      margin: const EdgeInsets.only(bottom: 16, top: 8),
      height: 4,
      width: 120,
      decoration: BoxDecoration(
        color: indicatorColor,
        borderRadius: BorderRadius.circular(2),
      ),
    );
  }
}
