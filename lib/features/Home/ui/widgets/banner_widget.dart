import 'package:ddeelly/gen/assets.gen.dart';
import 'package:ddeelly/utils/constants/app_colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class BannerWidget extends StatefulWidget {
  const BannerWidget({super.key});

  @override
  State<BannerWidget> createState() => _BannerWidgetState();
}

class _BannerWidgetState extends State<BannerWidget> {
  final PageController _bannerPageController = PageController();
  int currentBannerIndex = 0;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        SizedBox(
          height: 150.h,
          child: PageView.builder(
            itemCount: 4,
            controller: _bannerPageController,
            onPageChanged: (value) {
              setState(() {
                currentBannerIndex = value;
              });
            },
            itemBuilder: (context, index) {
              return Container(
                clipBehavior: Clip.antiAlias,
                decoration: BoxDecoration(borderRadius: BorderRadius.circular(6)),
                child: Container(
                  clipBehavior: Clip.antiAlias,
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(10.r)
                  ),
                  child: Image.asset(Assets.images.banner.path),
                ),
              );
            },
          ),
        ),
        SizedBox(height: 14.h,),
        Center(
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: List.generate(4, (index) => AnimatedContainer(
              duration: const Duration(milliseconds: 200),
              width: currentBannerIndex == index ? 18.w : 7.w,
              height: currentBannerIndex == index ? 7.h : 7.h,
              margin: const EdgeInsets.symmetric(horizontal: 4.0),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(3.r),
                color: currentBannerIndex == index
                    ? AppColors.gradientGreenColor
                    : AppColors.lightGreyDEColor,
              ),
            ),)
          ),
        )

      ],
    );
  }
}
