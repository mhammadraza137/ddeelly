import 'package:ddeelly/gen/assets.gen.dart';
import 'package:ddeelly/utils/constants/app_colors.dart';
import 'package:ddeelly/utils/constants/app_text_styles.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';

class UpComingDealsCard extends StatelessWidget {
  const UpComingDealsCard({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(right: 15.w),
      child: SizedBox(
        width: 0.7.sw,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SizedBox(
              height: 150.h,
              width: 0.7.sw,
              child: Stack(
                children: [
                  Container(
                    clipBehavior: Clip.antiAlias,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.only(
                        topLeft: Radius.circular(10.r),
                        topRight: Radius.circular(10.r),
                      ),
                    ),
                    child: Image.asset(Assets.images.deal.path),
                  ),
                  Positioned(
                      top: 10.h,
                      left: 10.w,
                      right: 10.w,
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Container(
                            padding: EdgeInsets.symmetric(horizontal: 15.w, vertical: 6.h),
                            decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(100.r),
                                border: Border.all(color: AppColors.whiteColor, width: 1.r)),
                            child: Text(
                              "30% off",
                              style: AppTextStyles.f14w500.copyWith(color: AppColors.whiteColor),
                            ),
                          ),
                          SvgPicture.asset(Assets.icons.heart)
                        ],
                      ))
                ],
              ),
            ),
            SizedBox(
              height: 5.h,
            ),
            Text(
              "Ristorante – Niko Romito",
              style: AppTextStyles.f18w500,
            ),
            Text(
              "Dine and enjoy a 20% Discount",
              style: AppTextStyles.f14w400.copyWith(color: AppColors.darkGreyA3Color),
            ),
            SizedBox(
              width: 0.7.sw,
              child: const Divider(
                color: AppColors.dividerColor,
                thickness: 1,
              ),
            ),
            SizedBox(
              height: 5.h,
            ),
            SizedBox(
              width: 0.7.sw,
              child: Row(
                children: [
                  SvgPicture.asset(Assets.icons.mapMarker),
                  SizedBox(width: 5.w,),
                  Expanded(
                      child: Text(
                        "Ristorante L’Olivo at Al Mah Mah Mah",
                        maxLines: 1,
                        overflow: TextOverflow.ellipsis,
                        style: AppTextStyles.f14w400.copyWith(color: AppColors.darkGreyA3Color),
                      )),
                  Text(
                    "+5 more",
                    style: AppTextStyles.f14w400.copyWith(color: AppColors.green59Color),
                  )
                ],
              ),
            ),
            SizedBox(height:11.h),
            Row(
              children: [
                Text("5.0",style: AppTextStyles.f12w500.copyWith(color: AppColors.lightGreyB2Color),),
                SizedBox(width: 5.w,),
                SvgPicture.asset(Assets.icons.star),
                Text(" (7 reviews)", style: AppTextStyles.f12w400.copyWith(color: AppColors.lightGreyB2Color),),
                const Spacer(),
                Text("Sold: 7350", style: AppTextStyles.f12w400.copyWith(color: AppColors.lightGreyB2Color),),

              ],
            )
          ],
        ),
      ),
    );
  }
}
