import 'package:anime_verse/src/core/theming/app_theme.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';

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
          SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Stack(
                  children: [
                    Column(
                      children: [
                        Container(
                          width: double.infinity,
                          height: 519.h,
                          decoration: BoxDecoration(
                            image: DecorationImage(
                              image: AssetImage(
                                'assets/animes_posters/details_poster.png',
                              ),
                              fit: BoxFit.cover,
                            ),
                          ),
                        ),
                        Container(
                          width: double.infinity,
                          height: 50.h,
                          decoration: BoxDecoration(),
                        ),
                      ],
                    ),
                    Positioned(
                      bottom: 0.h,
                      left: 0,
                      right: 0,
                      child: SvgPicture.asset(
                        'assets/vectors/anime_logo.svg',
                        width: 200.w,
                        height: 150.h,
                      ),
                    ),
                  ],
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 18.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: [
                          ...List.generate(3, (index) {
                            return Container(
                              margin: EdgeInsets.symmetric(
                                horizontal: 5.w,
                                vertical: 10.h,
                              ),
                              padding: EdgeInsets.symmetric(
                                horizontal: 12.w,
                                vertical: 8.h,
                              ),
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
                      ),
                      Padding(
                        padding: EdgeInsets.symmetric(vertical: 8.h),
                        child: Divider(color: Colors.white24, thickness: 1.h),
                      ),
                      Row(
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
                      ),
                      Padding(
                        padding: EdgeInsets.symmetric(vertical: 8.h),
                        child: Divider(color: Colors.white24, thickness: 1.h),
                      ),
                      Row(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          SvgPicture.asset(
                            'assets/vectors/fire.svg',
                            width: 30.w,
                            height: 30.h,
                          ),
                          SizedBox(width: 12.w),
                          Expanded(
                            child: Text(
                              'Demon Slayer: Kimetsu no Yaiba follows Tanjiro, a kind-hearted boy who becomes a demon slayer after his family is slaughtered and his sister is turned into a demon. Experience breathtaking battles, stunning animation, and an emotional journey of courage and hope.',
                              style: TextStyle(
                                fontSize: 14.sp,
                                fontWeight: FontWeight.w400,
                                color: Colors.white,
                                height: 1.5,
                              ),
                            ),
                          ),
                        ],
                      ),
                      SizedBox(height: 40.h),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
      bottomNavigationBar: Container(
        color: AppTheme.secondaryColor,
        padding: EdgeInsets.symmetric(horizontal: 20.w, vertical: 16.h),
        child: SafeArea(
          child: Row(
            children: [
              Expanded(
                child: ElevatedButton.icon(
                  onPressed: () {},
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Color(0xFF8D8998),
                    padding: EdgeInsets.symmetric(vertical: 14.h),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(30.r),
                    ),
                  ),
                  icon: SvgPicture.asset(
                    'assets/icons/preview.svg',
                    width: 24.w,
                    height: 24.h,
                  ),
                  label: Text(
                    'Preview',
                    style: TextStyle(
                      fontSize: 16.sp,
                      fontWeight: FontWeight.bold,
                      color: Colors.white,
                    ),
                  ),
                ),
              ),
              SizedBox(width: 16.w),
              Expanded(
                child: ElevatedButton.icon(
                  onPressed: () {},
                  style: ElevatedButton.styleFrom(
                    backgroundColor: AppTheme.primaryColor,
                    padding: EdgeInsets.symmetric(vertical: 14.h),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(30.r),
                    ),
                  ),
                  icon: SvgPicture.asset(
                    'assets/icons/view.svg',
                    width: 24.w,
                    height: 24.h,
                  ),
                  label: Text(
                    'Watch Now',
                    style: TextStyle(
                      fontSize: 16.sp,
                      fontWeight: FontWeight.bold,
                      color: Colors.white,
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
