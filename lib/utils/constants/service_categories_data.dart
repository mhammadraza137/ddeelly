
import 'dart:ui';

import 'package:ddeelly/gen/assets.gen.dart';
import 'package:ddeelly/utils/constants/app_colors.dart';

import 'app_strings.dart';

class ServiceCategory{
  final String imgPath;
  final Color bgColor;
  final String title;

  ServiceCategory({required this.imgPath, required this.title, required this.bgColor});

  static List<ServiceCategory> categories = [
    ServiceCategory(
        imgPath: Assets.images.dinning.path,
        title: AppStrings.dinning,
        bgColor: AppColors.lightGreen56Color
    ),
    ServiceCategory(
        imgPath: Assets.images.salonSpa.path,
        title: AppStrings.salonAndSpa,
        bgColor: AppColors.lightRedF5EColor
    ),
    ServiceCategory(
        imgPath: Assets.images.entertainment.path,
        title: AppStrings.entertainment,
        bgColor: AppColors.lightRedF5DColor
    ),
    ServiceCategory(
        imgPath: Assets.images.cleaning.path,
        title: AppStrings.cleaning,
        bgColor: AppColors.lightBlueColor
    )
  ];
}

