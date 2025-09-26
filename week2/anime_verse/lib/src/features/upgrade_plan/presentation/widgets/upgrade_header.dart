import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class UpgradeHeader extends StatelessWidget {
  const UpgradeHeader({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Center(
          child: Image.asset(
            'assets/vectors/rocket_boy.png',
            width: 207.w,
            height: 207.h,
          ),
        ),
        Text(
          'Seamless Anime\nExperience, Ad-Free.',
          textAlign: TextAlign.center,
          style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
        ),
        SizedBox(height: 8.h),
        Text(
          "Enjoy unlimited anime streaming without interruptions.",
          textAlign: TextAlign.center,
          style: TextStyle(
            fontSize: 16,
            fontWeight: FontWeight.w500,
            color: const Color(0xFFAEADB5),
          ),
        ),
      ],
    );
  }
}
