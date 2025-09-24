import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';

class AnimeStats extends StatelessWidget {
  const AnimeStats({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: List.generate(3, (index) {
        return Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SvgPicture.asset(
              index == 0
                  ? 'assets/icons/view.svg'
                  : index == 1
                  ? 'assets/icons/clap.svg'
                  : 'assets/icons/seasons.svg',
              color: Colors.white70,
            ),
            SizedBox(width: 4.h),
            Text(
              index == 0
                  ? '2.3M Views'
                  : index == 1
                  ? '2K Claps'
                  : '4 Seasons',
              style: TextStyle(
                fontSize: 13.sp,
                fontWeight: FontWeight.w400,
                color: Colors.white70,
              ),
            ),
          ],
        );
      }),
    );
  }
}
