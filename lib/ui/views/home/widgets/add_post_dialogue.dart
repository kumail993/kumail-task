import 'package:eaisoft/app/app_textstyle.dart';
import 'package:eaisoft/ui/common/verticasl_space.dart';
import 'package:eaisoft/ui/views/home/controller/home_controller.dart';
import 'package:eaisoft/ui/widgets/app_button.dart';
import 'package:eaisoft/ui/widgets/app_textfield.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

class AddPostDialogue extends GetView<HomeController> {
  const AddPostDialogue({super.key});

  @override
  Widget build(BuildContext context) {
    Get.put(HomeController());
    return AlertDialog(
      title: Text(
        'Add New Post',
        style: globalTextStyle(fontSize: 18.sp),
      ),
      content: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          AppTextField(
            labelText: 'Title',
            controller: controller.postTitleController,
          ),
          verticalSpace(16.h),
          AppTextField(
            labelText: 'Body',
            controller: controller.postBodyController,
          ),
          verticalSpace(16.h),
          Row(
            children: [
              Expanded(
                  child: AppTextField(
                labelText: 'Tag',
                controller: controller.tagController,
              )),
              horizontalSpace(8.h),
              RoundedElevatedButton(
                onPressed: controller.addTag,
                buttonText: 'Add',
                isEnabled: true,
                width: 70.w,
              )
            ],
          ),
          verticalSpace(16.h),
          Obx(
            () => Wrap(
              spacing: 8.0,
              children: List.generate(
                controller.tags.length,
                (index) {
                  return Chip(
                    label: Text(controller.tags[index]),
                    onDeleted: () => controller.removeTag(index),
                  );
                },
              ),
            ),
          ),
        ],
      ),
      actions: [
        RoundedElevatedButton(
            onPressed: () {
              controller.addPost(context);
            },
            buttonText: 'submit',
            isEnabled: true)
      ],
    );
  }
}
