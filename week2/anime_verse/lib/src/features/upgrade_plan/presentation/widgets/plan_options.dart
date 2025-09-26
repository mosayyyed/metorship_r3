import 'package:anime_verse/src/core/theming/app_theme.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class PlanOptions extends StatelessWidget {
  const PlanOptions({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: List.generate(2, (index) {
        return Container(
          margin: EdgeInsets.symmetric(vertical: 8.h),
          padding: EdgeInsets.symmetric(horizontal: 8.w, vertical: 4.h),
          decoration: BoxDecoration(
            color: index == 0 ? AppTheme.secondaryColor : Colors.white,
            borderRadius: BorderRadius.circular(22.r),
          ),
          child: Row(
            children: [
              Image.asset(
                index == 0
                    ? 'assets/vectors/annually_and_monthly.png'
                    : index == 1
                    ? 'assets/vectors/annually_and_monthly.png'
                    : 'assets/vectors/annually_and_monthly.png',
                width: 108.w,
                height: 108.h,
              ),
              SizedBox(width: 12.w),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    index == 0 ? 'Monthly' : 'Annually',
                    style: TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.w800,
                      color: index == 0 ? Colors.white : Colors.black,
                    ),
                  ),
                  SizedBox(height: 4.h),
                  RichText(
                    text: TextSpan(
                      children: [
                        TextSpan(
                          text: index == 0 ? '\$4.99 USD ' : '\$49.99 USD ',
                          style: TextStyle(
                            fontSize: 14,
                            fontWeight: FontWeight.w700,
                            color: index == 0 ? Colors.white : Colors.black,
                          ),
                        ),
                        TextSpan(
                          text: index == 0 ? '/ month' : '/ year',
                          style: TextStyle(
                            fontSize: 14,
                            fontWeight: FontWeight.w700,
                            color: index == 0 ? Colors.white70 : Colors.black54,
                          ),
                        ),
                      ],
                    ),
                  ),
                  Text(
                    'Include Family Sharing',
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      color: const Color(0xFFA49AD8),
                      fontSize: 12,
                      fontWeight: FontWeight.w700,
                    ),
                  ),
                ],
              ),
              const Spacer(),
              Icon(
                index == 0 ? Icons.check_circle : Icons.radio_button_unchecked,
                color: index == 0
                    ? AppTheme.primaryColor
                    : Colors.grey.shade400,
              ),
              SizedBox(width: 12.w),
            ],
          ),
        );
      }),
    );
  }
}
