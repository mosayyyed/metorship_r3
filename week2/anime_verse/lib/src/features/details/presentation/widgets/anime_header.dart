import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';

class AnimeHeader extends StatelessWidget {
  const AnimeHeader({super.key});

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Column(
          children: [
            Container(
              width: double.infinity,
              height: 519.h,
              decoration: BoxDecoration(
                image: DecorationImage(
                  image: AssetImage('assets/animes_posters/details_poster.png'),
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
    );
  }
}
