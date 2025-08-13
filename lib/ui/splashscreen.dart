import 'package:chow_500/ui/onboarding/onboarding_page.dart';
import 'package:chow_500/utils/app_colors.dart';
import 'package:chow_500/utils/app_images.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class Splashscreen extends StatefulWidget {
  const Splashscreen({super.key});

  @override
  State<Splashscreen> createState() => _SplashscreenState();
}

class _SplashscreenState extends State<Splashscreen> {
  @override
  void initState() {
    super.initState();
    Future.delayed(Duration(seconds: 3), () async {
      Get.off(() => const OnboardingPage());
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.splashbackground,
      body: SizedBox(
        height: MediaQuery.of(context).size.height,
        width: double.infinity,
        child: Column(
          children: [
            Expanded(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Center(
                    child: Image.asset(
                      AppImages.logo,
                      fit: BoxFit.contain,
                      width: double.infinity,
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
