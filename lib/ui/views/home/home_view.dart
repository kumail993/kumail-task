import 'package:eaisoft/app/app_colors.dart';
import 'package:eaisoft/app/app_textstyle.dart';
import 'package:eaisoft/model/posts_model.dart';
import 'package:eaisoft/ui/common/verticasl_space.dart';
import 'package:eaisoft/ui/views/home/controller/home_controller.dart';
import 'package:eaisoft/ui/views/home/widgets/post-container.dart';
import 'package:flutter/material.dart';
import 'package:flutter_remix/flutter_remix.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';

class HomeScreen extends GetView<HomeController> {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    Get.put(HomeController());
    return Scaffold(
        backgroundColor: AppColors.kcBackgroundColor,
        body: SafeArea(
          //top: false,
          child: SingleChildScrollView(
            physics: const AlwaysScrollableScrollPhysics(),
            child: Padding(
              padding: EdgeInsets.only(left: 20.w, right: 20.w, top: 20.h),
              child: Stack(
                children: [
                  Positioned(
                      top: 0,
                      right: 0,
                      child: SvgPicture.asset(
                        'assets/images/Frame 137.svg',
                      )),
                  Positioned(
                      child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          mainAxisAlignment: MainAxisAlignment.start,
                          children: [
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            SvgPicture.asset(
                              'assets/images/user-circle.svg',
                              width: 30.w,
                              height: 30.h,
                              // ignore: deprecated_member_use
                              color:
                                  AppColors.kcBlackColor, // Optional: set color
                            ),
                            SizedBox(
                              width: Get.width * 0.35,
                              child: Row(
                                children: [
                                  Text(
                                    'karachi, Pakistan',
                                    style: globalTextStyle(
                                        fontSize: 12.sp,
                                        fontWeight: FontWeight.w700,
                                        color: AppColors.kcBlackColor),
                                  ),
                                ],
                              ),
                            ),
                            Container(
                                width: 40.w,
                                height: 35.h,
                                padding: EdgeInsets.all(10.w),
                                decoration: BoxDecoration(
                                  color: AppColors.kcWhiteColor,
                                  borderRadius: BorderRadius.circular(10.r),
                                ),
                                child: const Icon(FlutterRemix.menu_5_line)),
                          ],
                        ),
                        verticalSpace(10),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text(
                              'Posts',
                              style: globalTextStyle(
                                  fontSize: 21,
                                  fontWeight: FontWeight.w700,
                                  color: AppColors.kcBlackColor),
                            ),
                            GestureDetector(
                              onTap: () {
                                controller.showAddPostDialog(context);
                              },
                              child: Container(
                                  width: 30.h,
                                  height: 30.h,
                                  decoration: const BoxDecoration(
                                      color: AppColors.kcPrimaryColor,
                                      shape: BoxShape.circle),
                                  child: Icon(
                                    FlutterRemix.add_line,
                                    size: 20.sp,
                                    color: AppColors.kcWhiteColor,
                                  )),
                            ),
                          ],
                        ),
                        verticalSpace(20.h),
                        Obx(
                          () => controller.isLoading.value
                              ? const Center(child: CircularProgressIndicator())
                              : ListView.builder(
                                  physics: const NeverScrollableScrollPhysics(),
                                  shrinkWrap: true,
                                  itemCount: controller.posts.length,
                                  itemBuilder: (context, index) {
                                    // Get the specific post
                                    Posts post = controller.posts[index];
                                    return PostContainer(
                                      posts: post,
                                    );
                                  },
                                ),
                        ),
                      ])),
                ],
              ),
            ),
          ),
        ));
  }
}
