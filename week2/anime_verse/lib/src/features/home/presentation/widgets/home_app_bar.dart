import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../../../../core/theming/app_theme.dart';

class HomeAppBar extends StatelessWidget {
  final String title;

  const HomeAppBar({super.key, this.title = 'Where Anime Comes Alive'});

  @override
  Widget build(BuildContext context) {
    return SliverAppBar(
      title: Text(
        title,
        style: TextStyle(
          fontSize: 20.sp,
          fontWeight: FontWeight.bold,
          color: AppTheme.secondaryColor,
        ),
      ),
      backgroundColor: Colors.transparent,
      elevation: 0,
      floating: true,
      snap: true,
      centerTitle: true,
      leading: null,
      automaticallyImplyLeading: false,
    );
  }
}
