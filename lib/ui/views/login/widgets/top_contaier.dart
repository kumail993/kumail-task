import 'package:eaisoft/app/app_colors.dart';
import 'package:eaisoft/app/app_textstyle.dart';
import 'package:eaisoft/ui/common/verticasl_space.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

class TopContainer extends StatelessWidget {
  const TopContainer({super.key});

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Container(
          height: Get.height * 0.4,
          width: Get.width,
          decoration: const BoxDecoration(
            color: AppColors.kcWhiteColor,
            borderRadius: BorderRadius.only(
              bottomLeft: Radius.circular(20.0), // Adjust the radius as needed
              bottomRight: Radius.circular(20.0), // Adjust the radius as needed
            ),
          ),
          child: Padding(
            padding: const EdgeInsets.only(
                top: 100.0, left: 20.0, right: 20.0, bottom: 30),
            child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  RichText(
                    text: TextSpan(
                      children: [
                        TextSpan(
                          text: 'Sign',
                          style: globalTextStyle(
                              fontSize: 61.sp,
                              fontWeight: FontWeight.w800,
                              color: AppColors.kcBlackColor),
                        ),
                        TextSpan(
                          text: ' Up',
                          style: globalTextStyle(
                              fontSize: 61.sp,
                              fontWeight: FontWeight.w800,
                              color: AppColors.kcPrimaryColor),
                        ),
                      ],
                    ),
                  ),
                  verticalSpace(10.h),
                  Text(
                    'fusce id velit ut tortor pretium viverra suspendisse potenti nullam ac tortor vitae purus faucibus ornare suspendisse sed nisi lacus',
                    style: globalTextStyle(
                        fontSize: 12, color: AppColors.kcTextGreyColor),
                  )
                ]),
          ),
        ),
      ],
    );
  }
}
