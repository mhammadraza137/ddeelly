import 'package:ddeelly/gen/assets.gen.dart';
import 'package:ddeelly/utils/constants/app_colors.dart';
import 'package:ddeelly/utils/constants/app_strings.dart';
import 'package:ddeelly/utils/constants/app_text_styles.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';

class AppSearchTextField extends StatelessWidget {
  const AppSearchTextField({super.key});

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      decoration: InputDecoration(
          fillColor: AppColors.whiteColor,
          filled: true,
          constraints: BoxConstraints(maxHeight: 44.h),
          contentPadding: EdgeInsets.symmetric(vertical: -10.h),
          prefixIcon: SvgPicture.asset(
            Assets.icons.search,
            fit: BoxFit.scaleDown,
          ),
          hintText: "${AppStrings.search}...",
          hintStyle: AppTextStyles.f14w500.copyWith(color: AppColors.darkGrey71Color),
          border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(10.r),
              borderSide: const BorderSide(color: AppColors.lightGreyE4Color, width: 1)),
          focusedBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(10.r),
              borderSide: const BorderSide(color: AppColors.lightGreyE4Color, width: 1)),
          enabledBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(10.r),
              borderSide: const BorderSide(color: AppColors.lightGreyE4Color, width: 1))),
    );
  }
}
