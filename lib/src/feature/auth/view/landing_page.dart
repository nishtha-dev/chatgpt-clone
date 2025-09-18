import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:gap/gap.dart';
import 'package:go_router/go_router.dart';
import 'package:nishtha_saraswat_answersai_flutter/src/core/widgets/typography.dart';

import '../../../core/constants/constants.dart';
import '../../../core/route/route_utils.dart';
import '../../../core/widgets/components/components.dart';

class LandingPage extends StatelessWidget {
  const LandingPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.darkBlue,
      body: SafeArea(
          bottom: false,
          child: Stack(
            children: [
              Positioned(
                top: 140.h,
                child: AppText.h1(AppLabels.chatGpt),
              ),
              const Positioned(
                  left: 0,
                  right: 0,
                  bottom: 0,
                  child: LandingPageLoginContainer())
            ],
          )),
    );
  }
}

class LandingPageLoginContainer extends StatelessWidget {
  const LandingPageLoginContainer({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: Theme.of(context).colorScheme.background,
        borderRadius: const BorderRadius.only(
          topLeft: Radius.circular(54),
          topRight: Radius.circular(54),
        ),
      ),
      child: Padding(
        padding: EdgeInsets.symmetric(horizontal: 25.w, vertical: 60.h),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            AppPrimaryButton(
              label: const Text(AppLabels.continueWithGoogle),
              onPressed: () {
                // context.pushReplacementNamed(RouteEnum.loginPage.toName);
              },
            ),
            Gap(10.h),
            AppSecondaryButton(
              label: const Text(AppLabels.signUpWithEmail),
              color: AppColors.secondaryColor,
              onPressed: () {
                context.pushNamed(RouteEnum.loginPage.toName);
              },
            ),
            Gap(10.h),
            AppSecondaryButton(
              addBorder: true,
              label: const Text(AppLabels.loginText),
              onPressed: () {},
            ),
          ],
        ),
      ),
    );
  }
}
