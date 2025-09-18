import 'package:flutter/material.dart';

import '../constants/constants.dart';

class AppTheme {
  AppTheme();

  ThemeData get themeData {
    return ThemeData(
        primaryColor: AppColors.white,
        canvasColor: AppColors.secondaryColor,
        scaffoldBackgroundColor: AppColors.white,
        splashColor: AppColors.transparent,
        progressIndicatorTheme:
            const ProgressIndicatorThemeData(color: AppColors.black),
        bottomSheetTheme:
            const BottomSheetThemeData(backgroundColor: AppColors.black));
  }
}
