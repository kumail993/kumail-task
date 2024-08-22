// import 'package:flutter/material.dart';
// import 'package:flutter_screenutil/flutter_screenutil.dart';
// import 'package:flutter_svg/svg.dart';
// import 'package:get/get.dart';
// import 'package:kaaju/app/app_colors/app_colors.dart';
// import 'package:kaaju/core/theme/text_style.dart';
// import 'package:kaaju/ui/common/verticasl_space.dart';
// import 'package:kaaju/ui/views/home/controller/home_controller.dart';

// class HomeTabBar extends GetView<HomeController> {
//   const HomeTabBar({super.key});

//   @override
//   Widget build(BuildContext context) {
//     Get.put(HomeController());
//     return SizedBox(
//       height: Get.height * 0.13,
//       //width: Get.width * 0.2,
//       child: ListView.builder(
//         scrollDirection: Axis.horizontal,
//         itemCount: controller.categories.length,
//         itemBuilder: (context, index) {
//           // final category = controller.categories[index];/
//           return Obx(
//             () => GestureDetector(
//               onTap: () {
//                 controller.selectedCategory.value = category;
//               },
//               child: Container(
//                 width: Get.width * 0.25,
//                 height: Get.height * 0.1,
//                 margin: const EdgeInsets.all(8),
//                 padding: const EdgeInsets.all(8),
//                 decoration: BoxDecoration(
//                   color: controller.selectedCategory.value.id == category.id
//                       ? AppColors.kcPrimaryColor.withOpacity(0.8)
//                       : AppColors.kcBackgroundColor,
//                   border: Border.all(color: AppColors.kcBackgroundColor),
//                   borderRadius: BorderRadius.circular(10),
//                 ),
//                 child: Column(
//                   mainAxisAlignment: MainAxisAlignment.center,
//                   children: [
//                     SvgPicture.asset(
//                       category.image!,
//                       width: 20.w,
//                       height: 20.h,
//                       // ignore: deprecated_member_use
//                       color: controller.selectedCategory.value.id == category.id
//                           ? AppColors.kcWhiteColor.withOpacity(0.8)
//                           : AppColors.kcBlackColor,
//                       // Optional: set color
//                     ),
//                     verticalSpace(4),
//                     Text(
//                       category.name!,
//                       style: globalTextStyle(
//                         fontSize: 12.sp,
//                         color:
//                             controller.selectedCategory.value.id == category.id
//                                 ? AppColors.kcWhiteColor.withOpacity(0.8)
//                                 : AppColors.kcBlackColor,
//                       ),
//                     ),
//                   ],
//                 ),
//               ),
//             ),
//           );
//         },
//       ),
//     );
//   }
// }
