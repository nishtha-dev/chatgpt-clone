import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:gap/gap.dart';

import '../../../core/constants/constants.dart';
import '../../../core/widgets/typography.dart';

class MainPage extends StatelessWidget {
  const MainPage({super.key, required this.widget});
  final Widget widget;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      body: widget,
      bottomNavigationBar: const BottomBar(),
    );
  }
}

class BottomBar extends StatelessWidget {
  const BottomBar({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      color: AppColors.black2,
      padding: const EdgeInsets.all(5),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              Image.asset(AssetImages.chatGptLogoWhite),
              Gap(5.w),
              AppText.body3(
                AppLabels.chatGpt,
                color: AppColors.white,
              )
            ],
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              AppText.body3(
                AppLabels.curatedBy,
                color: AppColors.white,
              ),
              Gap(5.w),
              AppText.body3(
                AppLabels.mobbin,
                color: AppColors.white,
              )
            ],
          ),
        ],
      ),
    );
  }
}
