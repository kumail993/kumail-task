import 'package:eaisoft/app/app_colors.dart';
import 'package:eaisoft/ui/common/verticasl_space.dart';
import 'package:eaisoft/ui/views/login/controller/login_controller.dart';
import 'package:eaisoft/ui/views/login/widgets/login_form.dart';
import 'package:eaisoft/ui/views/login/widgets/top_contaier.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

class LoginScreen extends GetView<LoginController> {
  const LoginScreen({super.key});

  @override
  Widget build(BuildContext context) {
    Get.put(LoginController());
    return Scaffold(
        backgroundColor: AppColors.kcBackgroundColor,
        body: SafeArea(
          top: false,
          child: Column(
            children: [
              const TopContainer(),
              verticalSpace(20.h),
              const LoginForm(),
            ],
          ),
        ));
  }
}
