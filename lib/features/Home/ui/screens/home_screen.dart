import 'package:ddeelly/gen/assets.gen.dart';
import 'package:ddeelly/utils/constants/app_colors.dart';
import 'package:ddeelly/utils/constants/app_strings.dart';
import 'package:ddeelly/utils/constants/app_text_styles.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';

import 'home_page.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  int _currentIndex = 0;

  final List<Widget> _pages = [
    HomePage(),
    HomePage(),
    HomePage(),
    HomePage(),
  ];

  List<Map<String, String>> navItems = [
    {AppStrings.home: Assets.icons.home},
    {AppStrings.category: Assets.icons.category},
    {AppStrings.location: Assets.icons.location},
    {AppStrings.profile: Assets.icons.profile},
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: _pages[_currentIndex],
        bottomNavigationBar: Container(
          padding: EdgeInsets.symmetric(horizontal: 15.w),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: List.generate(
              4,
              (index) {
                return InkWell(
                  onTap: () {
                    setState(() {
                      _currentIndex = index;
                    });
                  },
                  child: AnimatedContainer(
                    duration: const Duration(milliseconds: 300),
                    height: kToolbarHeight,
                    padding: EdgeInsets.symmetric(horizontal: 15.w),
                    decoration: BoxDecoration(
                      gradient: _currentIndex == index ? const LinearGradient(colors: [AppColors.gradientGreenColor, AppColors.gradientBlueColor]): null,
                      borderRadius: BorderRadius.circular(10),
                    ),
                    child: Row(
                      children: [
                        SvgPicture.asset(
                          navItems[index].values.first,
                          colorFilter: ColorFilter.mode(
                              _currentIndex == index ? AppColors.whiteColor : AppColors.darkGrey71Color, BlendMode.srcIn),
                        ),
                        SizedBox(width: 9.w,),
                        if(_currentIndex == index)
                        Text(
                          navItems[index].keys.first,
                          style: AppTextStyles.f12w700.copyWith(color: AppColors.whiteColor),
                        )
                      ],
                    ),
                  ),
                );
              },
            ),
          ),
        ));
  }
}
