import 'package:ddeelly/features/Home/ui/widgets/app_search_text_field.dart';
import 'package:ddeelly/features/Home/ui/widgets/banner_widget.dart';
import 'package:ddeelly/features/Home/ui/widgets/upcoming_deals_card.dart';
import 'package:ddeelly/gen/assets.gen.dart';
import 'package:ddeelly/utils/constants/app_colors.dart';
import 'package:ddeelly/utils/constants/app_strings.dart';
import 'package:ddeelly/utils/constants/app_text_styles.dart';
import 'package:ddeelly/utils/constants/partners_data.dart';
import 'package:ddeelly/utils/constants/service_categories_data.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:intl/intl.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final PageController _bannerPageController = PageController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: AppColors.lightGreenColor,
        body: Padding(
          padding: EdgeInsets.only(
              top: MediaQuery.of(context).viewPadding.top, bottom: MediaQuery.of(context).viewPadding.bottom),
          child: SingleChildScrollView(
            child: Column(
              children: [
                Padding(
                  padding: EdgeInsets.symmetric(horizontal: 15.w),
                  child: Column(
                    children: [
                      SizedBox(
                        height: 9.h,
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Row(
                            children: [
                              Text(
                                "UAE",
                                style: AppTextStyles.f14w400,
                              ),
                              const Icon(Icons.keyboard_arrow_down)
                            ],
                          ),
                          SvgPicture.asset(
                            Assets.images.ddeellyLogo,
                            height: 29.h,
                          ),
                          Padding(
                            padding: EdgeInsets.only(right: 10.r),
                            child: Badge(
                              padding: EdgeInsets.all(2.r),
                              label: Container(
                                padding: EdgeInsets.all(2.r),
                                decoration: BoxDecoration(
                                    color: AppColors.redColor,
                                    shape: BoxShape.circle,
                                    border: Border.all(color: AppColors.whiteColor, width: 1)),
                                child: Text(
                                  "03",
                                  style: AppTextStyles.f10w500,
                                ),
                              ),
                              backgroundColor: Colors.transparent,
                              child: SvgPicture.asset(Assets.icons.cart),
                            ),
                          )
                        ],
                      ),
                      SizedBox(
                        height: 21.h,
                      ),
                      Row(
                        children: [
                          Expanded(
                            child: AppSearchTextField(),
                          ),
                          SizedBox(
                            width: 13.w,
                          ),
                          Container(
                            width: 44.w,
                            height: 44.h,
                            decoration: BoxDecoration(
                              gradient: const LinearGradient(
                                  colors: [AppColors.gradientGreenColor, AppColors.gradientBlueColor]),
                              borderRadius: BorderRadius.circular(10),
                            ),
                            child: SvgPicture.asset(
                              Assets.icons.filter,
                              fit: BoxFit.scaleDown,
                            ),
                          )
                        ],
                      ),
                      SizedBox(
                        height: 21.h,
                      )
                    ],
                  ),
                ),
                Container(
                  decoration: BoxDecoration(
                      color: AppColors.whiteColor,
                      borderRadius: BorderRadius.only(topLeft: Radius.circular(30.r), topRight: Radius.circular(30.r))),
                  padding: EdgeInsets.only(left: 15.w, right: 15.w),
                  child: ListView(
                    shrinkWrap: true,
                    physics: const NeverScrollableScrollPhysics(),
                    children: [
                      Text(AppStrings.filterByCategory, style: AppTextStyles.f18w500),
                      SizedBox(
                        height: 7.h,
                      ),
                      Row(
                        // scrollDirection: Axis.horizontal,
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: List.generate(
                          ServiceCategory.categories.length,
                          (index) {
                            ServiceCategory category = ServiceCategory.categories[index];
                            return Expanded(
                              child: Padding(
                                padding: EdgeInsets.symmetric(horizontal: 5.w),
                                child: Column(
                                  children: [
                                    Container(
                                      padding: EdgeInsets.all(10.r),
                                      decoration: BoxDecoration(shape: BoxShape.circle, color: category.bgColor),
                                      child: Image.asset(
                                        category.imgPath,
                                        fit: BoxFit.scaleDown,
                                        width: 50.w,
                                        height: 50.h,
                                      ),
                                    ),
                                    SizedBox(
                                      height: 7.h,
                                    ),
                                    Text(
                                      category.title,
                                      style: AppTextStyles.f12w400,
                                      overflow: TextOverflow.ellipsis,
                                    )
                                  ],
                                ),
                              ),
                            );
                          },
                        ),
                      ),
                      SizedBox(
                        height: 15.h,
                      ),
                      const Divider(
                        color: AppColors.dividerColor,
                      ),
                      SizedBox(
                        height: 16.h,
                      ),
                      Text(AppStrings.filterByDiscount, style: AppTextStyles.f18w500),
                      SizedBox(
                        height: 5.h,
                      ),
                      SizedBox(
                        height: 40.h,
                        child: ListView.builder(
                          scrollDirection: Axis.horizontal,
                          itemCount: 5,
                          itemBuilder: (context, index) {
                            return Container(
                              margin: EdgeInsets.only(right: 10.w),
                              padding: EdgeInsets.symmetric(vertical: 10.h, horizontal: 15.w),
                              decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(10.r),
                                  border: Border.all(color: AppColors.green8AColor)),
                              child: Center(
                                child: Text(
                                  "${AppStrings.upTo} ${index + 1}0%",
                                  style: AppTextStyles.f16w400.copyWith(color: AppColors.darkGreen62Color),
                                ),
                              ),
                            );
                          },
                        ),
                      ),
                      SizedBox(
                        height: 15.h,
                      ),
                      const Divider(
                        color: AppColors.dividerColor,
                      ),
                      SizedBox(
                        height: 16.h,
                      ),
                      Text(AppStrings.upcomingDeal, style: AppTextStyles.f18w500),
                      SizedBox(
                        height: 7.h,
                      ),
                      SizedBox(
                        height: 53.h,
                        child: ListView.builder(
                          scrollDirection: Axis.horizontal,
                          itemCount: 7,
                          itemBuilder: (context, index) {
                            return Container(
                              margin: EdgeInsets.only(right: 10.w),
                              padding: EdgeInsets.symmetric(vertical: 2.h, horizontal: 9.w),
                              decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(10.r),
                                  border: Border.all(color: AppColors.green8AColor)),
                              child: Column(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  Text(
                                    DateTime.now().add(Duration(days: index)).day.toString(),
                                    style: AppTextStyles.f18w600.copyWith(height: 1.r),
                                  ),
                                  Text(
                                    DateFormat('MMM').format(DateTime.now().add(Duration(days: index))),
                                    style: AppTextStyles.f10w400.copyWith(height: 1.r),
                                  )
                                ],
                              ),
                            );
                          },
                        ),
                      ),
                      SizedBox(
                        height: 34.h,
                      ),
                      const BannerWidget(),
                      SizedBox(
                        height: 20.h,
                      ),
                      Text(AppStrings.upcomingDeal, style: AppTextStyles.f22w500),
                      SizedBox(
                        height: 15.h,
                      ),
                      SizedBox(
                        height: 280.h,
                        child: ListView.builder(
                          shrinkWrap: true,
                          scrollDirection: Axis.horizontal,
                          itemCount: 2,
                          itemBuilder: (context, index) {
                            return const UpComingDealsCard();
                          },
                        ),
                      ),
                      SizedBox(height: 10.h,),
                      Text(AppStrings.ourPartners, style: AppTextStyles.f22w500,),
                      SizedBox(height: 9.h,),
                      GridView.builder(
                        shrinkWrap: true,
                          physics: const NeverScrollableScrollPhysics(),
                          itemCount: PartnersData.images.length,
                          gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                              crossAxisCount: 3,
                            crossAxisSpacing: 10.w,
                            mainAxisSpacing: 10.h,
                            childAspectRatio: MediaQuery.sizeOf(context).aspectRatio + 0.8
                          ),
                          itemBuilder: (context, index) {
                            return Container(
                              padding: EdgeInsets.all(10.r),
                              decoration: BoxDecoration(
                                border: Border.all(color: AppColors.lightGreyDEColor),
                                borderRadius: BorderRadius.circular(10.r)
                              ),
                              child: Image.asset(PartnersData.images[index], fit: BoxFit.contain,),
                            );
                          },),
                      SizedBox(height: 20.h,)
                    ],
                  ),
                )
              ],
            ),
          ),
        ));
  }
}
