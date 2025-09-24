import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class BackgroundSpots extends StatelessWidget {
  const BackgroundSpots({super.key});

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        // First background spot
        Positioned(
          top: 150.h,
          right: 20.w,
          child: Container(
            width: 120.w,
            height: 120.h,
            decoration: BoxDecoration(
              gradient: RadialGradient(
                colors: [
                  Color(0xFF713649).withOpacity(0.25),
                  Color(0xFF713649).withOpacity(0.15),
                  Color(0xFF713649).withOpacity(0.05),
                ],
              ),
              shape: BoxShape.circle,
              boxShadow: [
                BoxShadow(
                  color: Color(0xFF713649).withOpacity(0.3),
                  blurRadius: 20.r,
                  spreadRadius: 5.r,
                  offset: Offset(0, 5.h),
                ),
              ],
            ),
          ),
        ),
        // Second background spot
        Positioned(
          bottom: -80.h,
          left: -20.w,
          child: Container(
            width: 120.w,
            height: 120.h,
            decoration: BoxDecoration(
              gradient: RadialGradient(
                colors: [
                  Color(0xFF713649).withOpacity(0.20),
                  Color(0xFF713649).withOpacity(0.12),
                  Color(0xFF713649).withOpacity(0.03),
                ],
              ),
              shape: BoxShape.circle,
              boxShadow: [
                BoxShadow(
                  color: Color(0xFF713649).withOpacity(0.15),
                  blurRadius: 15.r,
                  spreadRadius: 3.r,
                  offset: Offset(0, 3.h),
                ),
              ],
            ),
          ),
        ),
        Positioned(
          bottom: 130.h,
          right: -50.w,
          child: Container(
            width: 150.w,
            height: 150.h,
            decoration: BoxDecoration(
              gradient: RadialGradient(
                colors: [
                  Color(0xFF713649).withOpacity(0.30),
                  Color(0xFF713649).withOpacity(0.05),
                  Color(0xFF713649).withOpacity(0.06),
                ],
              ),
              shape: BoxShape.circle,
              boxShadow: [
                BoxShadow(
                  color: Color(0xFF713649).withOpacity(0.3),
                  blurRadius: 18.r,
                  spreadRadius: 4.r,
                  offset: Offset(0, 4.h),
                ),
              ],
            ),
          ),
        ),
      ],
    );
  }
}
