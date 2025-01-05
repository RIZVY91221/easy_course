import 'package:bs_assignment/core/theme/colors.dart';
import 'package:bs_assignment/core/uttils/icons.dart';
import 'package:bs_assignment/di/injectable.dart';
import 'package:bs_assignment/features/splash/controller/splash_controller.dart';
import 'package:bs_assignment/generated/assets.dart';
import 'package:bs_assignment/repository/base_repository.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class SplashScreen extends GetWidget {
  const SplashScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: GetBuilder(
        init: SplashController(repository: getIt<BaseRepository>()),
        builder: (controller) => Container(
          width: Get.width,
          height: Get.height,
          decoration: BoxDecoration(color: AppColor.primaryOne4B9EFF),
          child: Column(
            children: [
              Expanded(
                child: Center(
                  child: appSVG(
                    Assets.svgHomeIcon,
                    size: 200,
                    width: Get.width / 2,
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
