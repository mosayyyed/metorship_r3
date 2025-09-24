import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../../../../core/theming/app_theme.dart';
import '../../domain/entities/anime.dart';

class AnimePosterCard extends StatelessWidget {
  final Anime anime;
  final VoidCallback? onTap;

  const AnimePosterCard({super.key, required this.anime, this.onTap});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
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
                  ),
                  child: ClipRRect(
                    borderRadius: BorderRadius.circular(12.r),
                    child: Image.asset(
                      anime.posterPath,
                      fit: BoxFit.cover,
                      errorBuilder: (context, error, stackTrace) {
                        return Container(
                          color: AppTheme.backgroundColor,
                          child: Icon(
                            Icons.image_not_supported,
                            color: AppTheme.primaryColor,
                            size: 50.sp,
                          ),
                        );
                      },
                    ),
                  ),
                ),
                // Rating overlay
                Positioned(
                  top: 8.h,
                  right: 8.w,
                  child: Container(
                    padding: EdgeInsets.symmetric(
                      horizontal: 6.w,
                      vertical: 2.h,
                    ),
                    decoration: BoxDecoration(
                      color: AppTheme.primaryColor,
                      borderRadius: BorderRadius.circular(10.r),
                    ),
                    child: Row(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        Icon(Icons.star, size: 12.sp, color: Colors.white),
                        SizedBox(width: 2.w),
                        Text(
                          anime.rating.toString(),
                          style: TextStyle(
                            fontSize: 10.sp,
                            fontWeight: FontWeight.bold,
                            color: Colors.white,
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
              textAlign: TextAlign.center,
            ),
            SizedBox(height: 4.h),
            // Category
            Text(
              anime.category,
              style: TextStyle(
                fontSize: 12.sp,
                color: AppTheme.secondaryColor.withOpacity(0.7),
              ),
              maxLines: 1,
              overflow: TextOverflow.ellipsis,
            ),
          ],
        ),
      ),
    );
  }
}
