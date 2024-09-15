
import 'package:ddeelly/utils/constants/app_text_styles.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import 'app_colors.dart';

abstract class AppTheme{
  static ThemeData lightThemeData = ThemeData(
    scaffoldBackgroundColor: AppColors.whiteColor,
    fontFamily: "Inter",
    colorScheme: ColorScheme.fromSeed(seedColor: AppColors.darkGreenColor),
    inputDecorationTheme: lightInputDecorationTheme,
    checkboxTheme: lightCHeckBoxTheme,
    elevatedButtonTheme: lightElevatedButtonTheme
  );

  static InputDecorationTheme lightInputDecorationTheme = InputDecorationTheme(
    isDense: true,
      hintStyle: AppTextStyles.f16w400.copyWith(color: AppColors.greyColor),
      // errorStyle:
      errorMaxLines: 2,
      border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(10.r),
          borderSide: const BorderSide(color: AppColors.darkGrey60Color,width: 1)
      ),
      focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(10.r),
          borderSide: const BorderSide(color: AppColors.darkGrey60Color,width: 1.5)
      ),
      enabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(10.r),
          borderSide: const BorderSide(color: AppColors.darkGrey60Color,width: 1)
      )
  );

  static CheckboxThemeData lightCHeckBoxTheme = const CheckboxThemeData(
      side: BorderSide(width: 1, color: AppColors.greyColor),
      visualDensity: VisualDensity(vertical: VisualDensity.minimumDensity, horizontal: VisualDensity.minimumDensity)
  );

  static ElevatedButtonThemeData lightElevatedButtonTheme = ElevatedButtonThemeData(
    style: ButtonStyle(
      textStyle: WidgetStatePropertyAll(AppTextStyles.f14w500),
      minimumSize: WidgetStatePropertyAll(Size.fromHeight(50.h)),
      maximumSize: WidgetStatePropertyAll(Size.fromHeight(50.h)),
      shape: WidgetStatePropertyAll(RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(10),
      )),
      backgroundColor: const WidgetStatePropertyAll(Colors.transparent),
      foregroundColor: const WidgetStatePropertyAll(AppColors.whiteColor),
      shadowColor: const WidgetStatePropertyAll(Colors.transparent),
    )
  );

}
