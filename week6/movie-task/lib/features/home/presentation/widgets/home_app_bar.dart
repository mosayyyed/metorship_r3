import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:movie_task/core/theme/app_colors.dart';
import 'package:movie_task/core/theme/cubit/theme_cubit.dart';

class HomeAppBar extends StatelessWidget implements PreferredSizeWidget {
  const HomeAppBar({super.key});

  @override
  Widget build(BuildContext context) {
    final colorScheme = Theme.of(context).colorScheme;

    return AppBar(
      backgroundColor: colorScheme.primary,
      elevation: 2,
      centerTitle: false,
      leadingWidth: 64,
      leading: Padding(
        padding: const EdgeInsets.only(left: 12.0),
        child: CircleAvatar(
          backgroundColor: colorScheme.secondaryContainer,
          child: Icon(
            Icons.movie_filter_rounded,
            color: colorScheme.onSecondaryContainer,
          ),
        ),
      ),
      title: const Text(
        'Movies',
        style: TextStyle(
          fontWeight: FontWeight.w700,
          fontSize: 20,
          color: Colors.white,
        ),
      ),
      actions: [
        // Theme toggle
        BlocBuilder<ThemeCubit, ThemeMode>(
          builder: (context, themeMode) {
            final isDarkMode = themeMode == ThemeMode.dark;
            return IconButton(
              onPressed: () => context.read<ThemeCubit>().toggleTheme(),
              icon: Icon(
                isDarkMode ? Icons.light_mode : Icons.dark_mode,
                color: isDarkMode
                    ? AppColors.lightIconColor
                    : AppColors.darkIconColor,
              ),
              tooltip: isDarkMode ? 'Light Mode' : 'Dark Mode',
            );
          },
        ),
        const SizedBox(width: 8),
      ],
    );
  }

  @override
  // toolbar height + bottom search field height (12)
  @override
  Size get preferredSize => const Size.fromHeight(kToolbarHeight + 12);
}
