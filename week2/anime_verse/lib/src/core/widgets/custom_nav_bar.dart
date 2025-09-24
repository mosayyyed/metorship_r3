import 'package:anime_verse/src/core/theming/app_theme.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';

class CustomBottomNavigation extends StatelessWidget {
  const CustomBottomNavigation({
    super.key,
    required this.currentIndex,
    required this.onTap,
  });

  final int currentIndex;
  final ValueChanged<int> onTap;

  @override
  Widget build(BuildContext context) {
    final items = [
      _NavItem(icon: 'assets/icons/home.svg', label: 'Home'),
      _NavItem(icon: 'assets/icons/lib.svg', label: 'Library'),
      _NavItem(icon: 'assets/icons/search.svg', label: 'Search'),
      _NavItem(icon: 'assets/icons/explore.svg', label: 'Explore'),
      _NavItem(icon: 'assets/icons/setting.svg', label: 'Settings'),
    ];

    return Container(
      margin: EdgeInsets.fromLTRB(20.w, 20.h, 20.w, 20.h),
      decoration: BoxDecoration(borderRadius: BorderRadius.circular(50.r)),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: List.generate(items.length, (index) {
          final isActive = index == currentIndex;
          final item = items[index];

          return GestureDetector(
            onTap: () => onTap(index),
            behavior: HitTestBehavior.opaque,
            child: AnimatedContainer(
              duration: const Duration(milliseconds: 300),
              curve: Curves.easeInOutCubic,
              margin: EdgeInsets.symmetric(horizontal: 2.w),
              padding: EdgeInsets.symmetric(
                horizontal: isActive ? 14.w : 5.w,
                vertical: 10.h,
              ),
              decoration: BoxDecoration(
                color: isActive ? AppTheme.primaryColor : Colors.transparent,
                borderRadius: BorderRadius.circular(50.r),
              ),
              child: Row(
                mainAxisSize: MainAxisSize.min,
                children: [
                  SvgPicture.asset(
                    item.icon,
                    color: isActive ? Colors.white : Colors.grey,
                    width: 22.w,
                    height: 22.h,
                  ),
                  AnimatedContainer(
                    duration: const Duration(milliseconds: 300),
                    curve: Curves.easeInOutCubic,
                    width: isActive ? null : 0.w,
                    child: isActive
                        ? Row(
                            mainAxisSize: MainAxisSize.min,
                            children: [
                              SizedBox(width: 6.w),
                              Text(
                                item.label,
                                style: TextStyle(
                                  fontSize: 14.sp,
                                  fontWeight: FontWeight.w600,
                                  color: isActive ? Colors.white : Colors.grey,
                                ),
                              ),
                            ],
                          )
                        : const SizedBox.shrink(),
                  ),
                ],
              ),
            ),
          );
        }),
      ),
    );
  }
}

class _NavItem {
  final String icon;
  final String label;

  const _NavItem({required this.icon, required this.label});
}
