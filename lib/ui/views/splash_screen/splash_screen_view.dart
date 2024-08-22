import 'package:eaisoft/app/app_colors.dart';
import 'package:eaisoft/app/app_textstyle.dart';
import 'package:eaisoft/ui/views/splash_screen/controller/splash_controller.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

class SplashScreen extends GetView<SplashController> {
  const SplashScreen({super.key});

  @override
  Widget build(BuildContext context) {
    Get.put(SplashController());

    return Scaffold(
      body: Container(
        width: MediaQuery.of(context).size.width,
        height: MediaQuery.of(context).size.height,
        color: Colors.white,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const SizedBox.shrink(),
            Container(
              alignment: Alignment.center,
              height: 200.h,
              width: 200.w,
              decoration: BoxDecoration(
                border: Border.all(color: AppColors.kcPrimaryColor, width: 2),
                shape: BoxShape.circle,
              ),
              child: Text(
                'Eaisoft',
                style: globalTextStyle(
                    fontSize: 41.sp, color: AppColors.kcPrimaryColor),
              ),
            ),
            // Image.asset(
            //   'assets/images/loogo.png',
            //   height: 250.h,
            // ),
            SizedBox(height: 14.h),
          ],
        ),
      ),
    );
  }
}
