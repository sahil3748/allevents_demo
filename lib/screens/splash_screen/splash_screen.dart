import 'package:allevents_demo/screens/splash_screen/splash_screen_controller.dart';
import 'package:allevents_demo/widgets/custom_image_view.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../constants/utils/image_constant.dart';

class SplashScreen extends StatelessWidget {
  const SplashScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return GetBuilder<SplashController>(
      init: SplashController(),
      initState: (_) {},
      builder: (_) {
        return Scaffold(
          body: Center(
              child: Image.asset(
            ImageConstant.allEventsLogo,
            height: 125,
            width: 125,
          )),
        );
      },
    );
  }
}
