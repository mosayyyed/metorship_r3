import 'package:anime_verse/src/features/details/presentation/screens/details_screens.dart';
import 'package:anime_verse/src/features/upgrade_plan/presentation/screens/upgrade_plan_screen.dart';
import 'package:anime_verse/src/features/layout/presentation/screens/root_screen.dart';
import 'package:go_router/go_router.dart';

class AppRouter {
  static const String rootScreenPath = '/';
  static const String animeDetailsPath = '/animeDetails';
  static const String upgradePlanScreen = '/upgradePlan';

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
      GoRoute(
        path: upgradePlanScreen,
        builder: (context, state) {
          return UpgradePlanScreen();
        },
      ),
    ],
  );
}
