import 'package:eaisoft/app/app_colors.dart';
import 'package:eaisoft/app/app_textstyle.dart';
import 'package:eaisoft/services/auth_services.dart';
import 'package:eaisoft/ui/common/verticasl_space.dart';
import 'package:eaisoft/ui/views/login/controller/login_controller.dart';
import 'package:eaisoft/ui/widgets/app_button.dart';
import 'package:eaisoft/ui/widgets/app_textfield.dart';
import 'package:flutter/material.dart';
import 'package:flutter_remix/flutter_remix.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

class LoginForm extends GetView<LoginController> {
  const LoginForm({super.key});

  @override
  Widget build(BuildContext context) {
    Get.put(LoginController());
    ValueNotifier userCredential = ValueNotifier('');
    return Padding(
      padding: const EdgeInsets.only(top: 10, right: 20, left: 20),
      child: Form(
        key: controller.formKey,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            AppTextField(
              labelText: 'Email',
              controller: controller.emailController,
            ),
            verticalSpace(16.h),
            AppTextField(
              labelText: 'Password',
              //controller: controller.passwordController,
              obscureText: true,
            ),
            verticalSpace(16.h),
            RoundedElevatedButton(
              onPressed: () async {},
              buttonText: 'Login',
              isEnabled: true,
            ),
            verticalSpace(16.h),
            GestureDetector(
              onTap: () async {
                userCredential.value = await AuthServices.signInWithGoogle();
                if (userCredential.value != null) {
                  controller
                      .navigateToNextPage(userCredential.value?.user?.uid);
                }
              },
              child: Container(
                margin: EdgeInsets.only(
                  right: 20.w,
                  left: 20,
                ),
                padding:
                    EdgeInsets.only(right: 20.w, left: 20, top: 20, bottom: 20),
                alignment: Alignment.centerRight,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10.r),
                  color: AppColors.kcWhiteColor,
                ),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      'Login with Google',
                      style: globalTextStyle(
                          color: AppColors.kcBlackColor, fontSize: 14.sp),
                    ),
                    horizontalSpace(10.w),
                    const Icon(
                      FlutterRemix.google_line,
                      color: AppColors.kcBlackColor,
                    ),
                  ],
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
