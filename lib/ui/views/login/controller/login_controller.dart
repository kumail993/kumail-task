import 'dart:developer';

import 'package:eaisoft/ui/views/home/home_view.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:get/get.dart';

class LoginController extends GetxController {
  GlobalKey<FormState> formKey = GlobalKey<FormState>();
  TextEditingController nameController = TextEditingController();
  TextEditingController emailController = TextEditingController();
  TextEditingController phoneController = TextEditingController();
  RxBool termsAndConditionAgreed = false.obs;

  // ignore: non_constant_identifier_names

  void navigateToNextPage(String userID) {
    log('userID: $userID');
    Get.to(() => const HomeScreen(), arguments: {'userID': userID});
  }

  @override
  void onClose() {
    nameController.dispose();
    emailController.dispose();
    phoneController.dispose();
    super.onClose();
  }
}
