import 'dart:async';
import 'package:eaisoft/ui/views/login/login_view.dart';
import 'package:get/get.dart';

class SplashController extends GetxController {
  late Timer timer;
  @override
  void onInit() {
    timer = Timer(const Duration(seconds: 3), navigateToLogin);
    super.onInit();
  }

  void navigateToLogin() {
    Get.offAll(() => const LoginScreen());
  }

  @override
  void onClose() {
    timer.cancel();
    super.onClose();
  }
}
