import 'package:anime_verse/src/features/layout/presentation/widgets/custom_nav_bar.dart';
import 'package:anime_verse/src/features/home/presentation/screens/home_screen.dart';
import 'package:anime_verse/src/core/theming/app_theme.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';

class RootScreen extends StatefulWidget {
  const RootScreen({super.key});

  @override
  State<RootScreen> createState() => _RootScreenState();
}

class _RootScreenState extends State<RootScreen> with TickerProviderStateMixin {
  int _currentIndex = 0;

  final List<Widget> _screens = [
    const HomeScreen(),
    const LibraryScreen(),
    const SearchScreen(),
    const ExploreScreen(),
    const SettingsScreen(),
  ];

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBody: true,
      body: Stack(
        children: [
          Positioned.fill(
            child: Container(
              decoration: BoxDecoration(gradient: AppTheme.backgroundGradient),
            ),
          ),
          Positioned(
            top: 0,
            right: 0,
            child: SvgPicture.asset(
              'assets/vectors/star.svg',
              width: 432.w,
              height: 432.h,
            ),
          ),
          IndexedStack(index: _currentIndex, children: _screens),
        ],
      ),

      bottomNavigationBar: CustomBottomNavigation(
        currentIndex: _currentIndex,
        onTap: (int index) {
          setState(() {
            _currentIndex = index;
          });
        },
      ),
    );
  }
}

// Placeholder screens
class SearchScreen extends StatelessWidget {
  const SearchScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.transparent,
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            SvgPicture.asset(
              'assets/icons/search.svg',
              width: 80,
              height: 80,
              color: AppTheme.secondaryColor,
            ),
            SizedBox(height: 16),
            Text(
              'Search Screen',
              style: TextStyle(
                fontSize: 24,
                fontWeight: FontWeight.bold,
                color: AppTheme.secondaryColor,
              ),
            ),
            SizedBox(height: 8),
            Text(
              'Find your favorite anime here',
              style: TextStyle(fontSize: 16, color: AppTheme.secondaryColor),
            ),
          ],
        ),
      ),
    );
  }
}

class ExploreScreen extends StatelessWidget {
  const ExploreScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.transparent,
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            SvgPicture.asset(
              'assets/icons/explore.svg',
              width: 80,
              height: 80,
              color: AppTheme.secondaryColor,
            ),
            SizedBox(height: 16),
            Text(
              'Explore Screen',
              style: TextStyle(
                fontSize: 24,
                fontWeight: FontWeight.bold,
                color: AppTheme.secondaryColor,
              ),
            ),
            SizedBox(height: 8),
            Text(
              'Discover new anime content',
              style: TextStyle(fontSize: 16, color: AppTheme.secondaryColor),
            ),
          ],
        ),
      ),
    );
  }
}

class LibraryScreen extends StatelessWidget {
  const LibraryScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.transparent,
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            SvgPicture.asset(
              'assets/icons/lib.svg',
              width: 80,
              height: 80,
              color: AppTheme.secondaryColor,
            ),
            SizedBox(height: 16),
            Text(
              'Library Screen',
              style: TextStyle(
                fontSize: 24,
                fontWeight: FontWeight.bold,
                color: AppTheme.secondaryColor,
              ),
            ),
            SizedBox(height: 8),
            Text(
              'Access your saved anime',
              style: TextStyle(fontSize: 16, color: AppTheme.secondaryColor),
            ),
          ],
        ),
      ),
    );
  }
}

class SettingsScreen extends StatelessWidget {
  const SettingsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.transparent,
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            SvgPicture.asset(
              'assets/icons/setting.svg',
              width: 80,
              height: 80,
              color: AppTheme.secondaryColor,
            ),
            SizedBox(height: 16),
            Text(
              'Settings Screen',
              style: TextStyle(
                fontSize: 24,
                fontWeight: FontWeight.bold,
                color: AppTheme.secondaryColor,
              ),
            ),
            SizedBox(height: 8),
            Text(
              'Manage your preferences',
              style: TextStyle(fontSize: 16, color: AppTheme.secondaryColor),
            ),
          ],
        ),
      ),
    );
  }
}
