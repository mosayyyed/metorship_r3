import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

// Import widgets
import '../widgets/upgrade_background.dart';
import '../widgets/upgrade_header.dart';
import '../widgets/plan_options.dart';
import '../widgets/continue_button.dart';

class UpgradePlanScreen extends StatelessWidget {
  const UpgradePlanScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBodyBehindAppBar: true,
      extendBody: true,
      appBar: AppBar(title: Text('Upgrade Plan')),
      bottomNavigationBar: const ContinueButton(),
      body: Stack(
        children: [
          const UpgradeBackground(),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16.0),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                const UpgradeHeader(),
                SizedBox(height: 30.h),
                const PlanOptions(),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
