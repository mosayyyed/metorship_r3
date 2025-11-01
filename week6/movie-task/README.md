# Movie Task

A concise Flutter demo app that shows popular movies (list + details), supports light/dark themes, local caching (Hive), and infinite scroll pagination.

## Demo

https://github.com/user-attachments/assets/6ef50d4e-28af-4fd8-991e-9d57bab5f1da

## Key Features
- Browse popular movies (TMDB)
- Movie details: poster, rating, genre, description
- Light and Dark themes (toggle in the app bar)
- Local caching with Hive (offline support)
- Infinite scrolling with automatic load-more

## Quick start
1. Install Flutter (stable channel)
2. From the project root:

```bash
flutter pub get
flutter run
```

Run `flutter analyze` to check for warnings or errors.

## Notes for maintainers
- Theme files: `lib/core/theme/app_theme.dart` and `lib/core/theme/app_colors.dart` — tweak colors and component styles there.
- Theme toggle: `ThemeCubit` (stored via Hive) — initialized in `lib/core/di/service_locator.dart`.
- Hero poster transitions: `movie_list_item.dart` and `movie_details_screen.dart` use matching `Hero` tags like `poster_<id>`.
- Replace the demo video:
  - Add a file at `assets/demo.mp4` and commit it, or
  - Update the `<video>` src to point to a hosted URL (YouTube links are shown as plain links in GitHub READMEs).

## Project structure (short)
```
lib/
├── core/      # theme, networking, DI, routing
└── features/
    └── home/  # data (models, sources), presentation (widgets, screens), cubits
```

If you'd like, I can:
- produce a short GIF from the demo video for better README previews, or
- add a hosted YouTube demo and a thumbnail.

---

Built with ❤ and Flutter

