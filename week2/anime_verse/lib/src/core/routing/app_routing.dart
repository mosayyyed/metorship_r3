import 'package:anime_verse/src/features/details/presentation/screens/details_screens.dart';
import 'package:anime_verse/src/root_screen.dart';
import 'package:go_router/go_router.dart';

class AppRouter {
  static const String rootScreenPath = '/';
  static const String animeDetailsPath = '/animeDetails';

  static final GoRouter router = GoRouter(
    initialLocation: rootScreenPath,
    routes: [
      GoRoute(
        path: rootScreenPath,
        builder: (context, state) => const RootScreen(),
      ),
      GoRoute(
        path: animeDetailsPath,
        builder: (context, state) {
          return AnimeDetailsScreen();
        },
      ),
    ],
  );
}
