import 'package:eaisoft/app/app_colors.dart';
import 'package:eaisoft/app/app_textstyle.dart';
import 'package:eaisoft/firebase_options.dart';
import 'package:eaisoft/ui/views/splash_screen/splash_screen_view.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
      minTextAdapt: true,
      splitScreenMode: true,
      useInheritedMediaQuery: false,
      builder: (context, child) => GestureDetector(
        behavior: HitTestBehavior.translucent,
        onTap: () => FocusScope.of(context).unfocus(),
        child: GetMaterialApp(
          transitionDuration: const Duration(seconds: 2),
          title: 'kaaju',
          debugShowCheckedModeBanner: false,
          themeMode: ThemeMode.light,
          theme: ThemeData(
            primaryColor: AppColors.kcPrimaryColor,
            primarySwatch: AppColors.primarySwatch,
            fontFamily: 'TT Commons',
            appBarTheme: AppBarTheme(
              color: Colors.white,
              elevation: 0,
              titleTextStyle: globalTextStyle(
                fontSize: 14.sp,
              ),
            ),
            scaffoldBackgroundColor: Colors.white,
            textTheme: Theme.of(context).textTheme.apply(
                  bodyColor: Colors.black,
                  displayColor: Colors.black,
                ),
          ),
          //builder: EasyLoading.init(),
          home: const SplashScreen(),
        ),
      ),
    );
  }
}
