import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class GenreButtons extends StatelessWidget {
  const GenreButtons({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: [
        ...List.generate(3, (index) {
          return Container(
            margin: EdgeInsets.symmetric(horizontal: 5.w, vertical: 10.h),
            padding: EdgeInsets.symmetric(horizontal: 12.w, vertical: 8.h),
            width: 97.w,
            height: 40.h,
            decoration: BoxDecoration(
              color: Colors.white24,
              boxShadow: [
                BoxShadow(
                  color: Colors.black.withOpacity(0.2),
                  blurRadius: 4.r,
                  offset: Offset(0, 2.h),
                ),
              ],
              borderRadius: BorderRadius.circular(24.r),
            ),
            child: Center(
              child: Text(
                index == 0
                    ? 'Action'
                    : index == 1
                    ? 'Adventure'
                    : 'Fantasy',
                style: TextStyle(
                  fontSize: 13.sp,
                  fontWeight: FontWeight.w600,
                  color: Colors.white,
                ),
              ),
            ),
          );
        }),
      ],
    );
  }
}
