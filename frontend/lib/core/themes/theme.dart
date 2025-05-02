import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:mptc_exercise_banhahuy/core/constants/app_colors.dart';
import 'package:mptc_exercise_banhahuy/core/generate/fonts.gen.dart';

class AppThemes {
  static String fontFamily = FontFamily.krasar;

  static ThemeData lightTheme = ThemeData(
    fontFamily: fontFamily,
    primaryColor: AppColors.primaryColor,
    colorScheme: ColorScheme.fromSwatch().copyWith(
      primary: AppColors.primaryColor,
      secondary: AppColors.secondaryColor,
    ),



  );
}
