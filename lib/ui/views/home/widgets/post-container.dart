import 'package:eaisoft/app/app_colors.dart';
import 'package:eaisoft/app/app_textstyle.dart';
import 'package:eaisoft/model/posts_model.dart';
import 'package:eaisoft/ui/common/verticasl_space.dart';
import 'package:eaisoft/ui/views/home/controller/home_controller.dart';
import 'package:flutter/material.dart';
import 'package:flutter_remix/flutter_remix.dart';
import 'package:get/get.dart';

class PostContainer extends GetView<HomeController> {
  final Posts posts;

  const PostContainer({super.key, required this.posts});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.all(10.0),
      padding: const EdgeInsets.symmetric(horizontal: 10.0, vertical: 10.0),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(10.0),
        color: AppColors.kcWhiteColor,
        boxShadow: [
          BoxShadow(
            color: AppColors.kcVeryLightGrey.withOpacity(0.5),
            spreadRadius: 2,
            blurRadius: 5,
            offset: const Offset(0, 3), // changes position of shadow
          ),
        ],
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // Title
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Text(
              posts.title!,
              style: globalTextStyle(
                fontSize: 18,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
          Row(
            children: posts.tags!.map((tag) {
              return Padding(
                padding: const EdgeInsets.symmetric(horizontal: 4.0),
                child: Text("#$tag",
                    style: globalTextStyle(
                      fontSize: 12,
                      fontWeight: FontWeight.bold,
                      color: AppColors.kcBlackColor,
                    )),
              );
            }).toList(), // Convert the Iterable to a List
          ),
          // Body
          Padding(
            padding: const EdgeInsets.symmetric(vertical: 8.0),
            child: Text(
              textAlign: TextAlign.justify,
              posts.body!,
              style: globalTextStyle(
                  fontSize: 14,
                  fontWeight: FontWeight.normal,
                  color: AppColors.kcTextGreyColor),
            ),
          ),
          // Likes and Dislikes Row
          Padding(
            padding: const EdgeInsets.symmetric(vertical: 8.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                Row(
                  children: [
                    const Icon(FlutterRemix.heart_2_fill, color: Colors.red),
                    verticalSpace(4),
                    Text(posts.reactions!.likes.toString()),
                  ],
                ),
                verticalSpace(16),
                Row(
                  children: [
                    const Icon(Icons.thumb_down, color: Colors.grey),
                    verticalSpace(4),
                    Text(posts.reactions!.likes.toString()),
                  ],
                ),
              ],
            ),
          ),

          Obx(
            () => GestureDetector(
              onTap: () {
                controller.toggleFavorite(posts.id!.toString());
              },
              child: Icon(
                controller.isFavorite.value
                    ? Icons.favorite
                    : Icons.favorite_border,
                color: controller.isFavorite.value ? Colors.red : Colors.grey,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
