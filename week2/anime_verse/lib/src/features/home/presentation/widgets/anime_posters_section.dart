import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../../../../core/theming/app_theme.dart';

// Model classes (temporary - should be moved to data layer)
class AnimeModel {
  final String title;
  final String category;
  final double rating;
  final String posterPath;

  AnimeModel({
    required this.title,
    required this.category,
    required this.rating,
    required this.posterPath,
  });
}

class AnimePostersSection extends StatelessWidget {
  final List<AnimeModel> animeList;
  final Function(AnimeModel)? onAnimeTap;

  const AnimePostersSection({
    super.key,
    required this.animeList,
    this.onAnimeTap,
  });

  @override
  Widget build(BuildContext context) {
    return SliverToBoxAdapter(
      child: SizedBox(
        height: (247 + 50).h, // poster height + title area
        child: ListView.separated(
          scrollDirection: Axis.horizontal,
          padding: EdgeInsets.symmetric(horizontal: 16.w),
          itemCount: animeList.length,
          separatorBuilder: (context, index) => SizedBox(width: 12.w),
          itemBuilder: (context, index) {
            final anime = animeList[index];
            return SizedBox(width: 198.w, child: _buildAnimePosterCard(anime));
          },
        ),
      ),
    );
  }

  Widget _buildAnimePosterCard(AnimeModel anime) {
    return GestureDetector(
      onTap: () => onAnimeTap?.call(anime),
      child: Container(
        decoration: BoxDecoration(borderRadius: BorderRadius.circular(12.r)),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            // Poster Image
            Stack(
              children: [
                Container(
                  width: 198.w,
                  height: 247.h,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(12.r),
                    color: AppTheme.backgroundColor,
                    image: DecorationImage(
                      image: AssetImage(anime.posterPath),
                      fit: BoxFit.fill,
                      onError: (error, stackTrace) {},
                    ),
                  ),
                ),
                // Rating Badge
                Positioned(
                  top: 12.h,
                  right: 22.w,
                  child: Container(
                    padding: EdgeInsets.symmetric(
                      horizontal: 8.w,
                      vertical: 4.h,
                    ),
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(12.r),
                    ),
                    child: Row(
                      children: [
                        Icon(
                          Icons.star,
                          color: AppTheme.primaryColor,
                          size: 14.sp,
                        ),
                        SizedBox(width: 4.w),
                        Text(
                          anime.rating.toString(),
                          style: TextStyle(
                            color: Colors.black,
                            fontSize: 12.sp,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            ),
            SizedBox(height: 8.h),
            // Title
            Text(
              anime.title,
              style: TextStyle(
                fontSize: 14.sp,
                fontWeight: FontWeight.bold,
                color: AppTheme.secondaryColor,
              ),
              maxLines: 1,
              overflow: TextOverflow.ellipsis,
            ),
            SizedBox(height: 4.h),
            // Category
            Expanded(
              child: Text(
                anime.category,
                style: TextStyle(
                  fontSize: 12.sp,
                  color: AppTheme.secondaryColor.withOpacity(0.7),
                ),
                maxLines: 1,
                overflow: TextOverflow.ellipsis,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
