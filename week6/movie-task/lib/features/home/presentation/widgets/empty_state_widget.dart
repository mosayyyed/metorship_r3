import 'package:flutter/material.dart';
import 'package:movie_task/core/extensions/context_extensions.dart';

class EmptyStateWidget extends StatelessWidget {
  final String message;
  final IconData icon;

  const EmptyStateWidget({
    super.key,
    required this.message,
    this.icon = Icons.movie_outlined,
  });

  @override
  Widget build(BuildContext context) {
  final colorScheme = context.colorScheme;

  // Use colorScheme's onSurface with alpha for subdued empty-state visuals.
  // We use withAlpha to avoid the deprecated withOpacity API.
  final iconColor = colorScheme.onSurface.withAlpha((0.3 * 255).round());
  final textColor = colorScheme.onSurface.withAlpha((0.5 * 255).round());

    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Icon(icon, size: 64, color: iconColor),
          const SizedBox(height: 16),
          Text(message, style: TextStyle(fontSize: 16, color: textColor)),
        ],
      ),
    );
  }
}
