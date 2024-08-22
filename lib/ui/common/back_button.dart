import 'package:eaisoft/app/app_colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

class BackArrowBotton extends StatelessWidget {
  const BackArrowBotton({super.key});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Get.back();
      },
      child: Container(
        alignment: Alignment.center,
        height: 35.h,
        width: 40.w,
        decoration: BoxDecoration(
          color: AppColors.kcPrimaryColor,
          borderRadius:
              BorderRadius.circular(10), // Adjust the radius as needed
        ),
        child: Icon(
          Icons.arrow_back_ios_new,
          color: AppColors.kcWhiteColor,
          size: 15.0.sp,
        ),
      ),
    );
  }
}
