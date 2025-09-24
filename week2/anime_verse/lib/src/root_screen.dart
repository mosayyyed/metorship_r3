import 'package:anime_verse/src/core/widgets/custom_nav_bar.dart';
import 'package:anime_verse/src/features/home/presentation/screens/home_screen.dart';
import 'package:anime_verse/src/core/theming/app_theme.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
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
    const SearchScreen(),
    const ProfileScreen(),
    const SearchScreen(), // Explore placeholder
    const ProfileScreen(), // Library placeholder
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
    return const Scaffold(
      backgroundColor: Colors.transparent,
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Icon(Icons.search, size: 80, color: AppTheme.secondaryColor),
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

class ProfileScreen extends StatelessWidget {
  const ProfileScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      backgroundColor: Colors.transparent,
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Icon(Icons.person, size: 80, color: AppTheme.secondaryColor),
            SizedBox(height: 16),
            Text(
              'Profile Screen',
              style: TextStyle(
                fontSize: 24,
                fontWeight: FontWeight.bold,
                color: AppTheme.secondaryColor,
              ),
            ),
            SizedBox(height: 8),
            Text(
              'Manage your account settings',
              style: TextStyle(fontSize: 16, color: AppTheme.secondaryColor),
            ),
          ],
        ),
      ),
    );
  }
}
