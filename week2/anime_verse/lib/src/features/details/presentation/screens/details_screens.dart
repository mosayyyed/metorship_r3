import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

// Import widgets
import '../widgets/background_spots.dart';
import '../widgets/anime_header.dart';
import '../widgets/genre_buttons.dart';
import '../widgets/anime_stats.dart';
import '../widgets/anime_description.dart';
import '../widgets/action_buttons.dart';

class AnimeDetailsScreen extends StatelessWidget {
  const AnimeDetailsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color.fromRGBO(44, 30, 81, 1),
      extendBodyBehindAppBar: true,
      appBar: AppBar(),
      body: Stack(
        children: [
          // Background spots with gradient and shadow
          const BackgroundSpots(),
          // Main content
          SingleChildScrollView(
            physics: const BouncingScrollPhysics(),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                // Anime header and poster
                const AnimeHeader(),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 18.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      // Genre buttons
                      const GenreButtons(),
                      Padding(
                        padding: EdgeInsets.symmetric(vertical: 8.h),
                        child: Divider(color: Colors.white24, thickness: 1.h),
                      ),
                      // Anime statistics
                      const AnimeStats(),
                      Padding(
                        padding: EdgeInsets.symmetric(vertical: 8.h),
                        child: Divider(color: Colors.white24, thickness: 1.h),
                      ),
                      // Anime description
                      const AnimeDescription(),
                      SizedBox(height: 40.h),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
      bottomNavigationBar: const ActionButtons(),
    );
  }
}
