import 'package:allevents_demo/routes/app_pages.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:get/get.dart';

import '../../constants/utils/string_constant.dart';

class SplashController extends GetxController {
  final FirebaseAuth _auth = FirebaseAuth.instance;
  String greeting = '';

  String getGreeting() {
    var hour = DateTime.now().hour;

    if (hour < 12) {
      greeting = 'Good Morning';
    } else if (hour < 17) {
      greeting = 'Good Afternoon';
    } else if (hour < 21) {
      greeting = 'Good Evening';
    } else {
      greeting = 'Good Night';
    }

    return greeting;
  }

  @override
  void onInit() {
    super.onInit();
    Future.delayed(const Duration(seconds: 2), () {
      getGreeting();
      _navigateToAppropriateScreen();
    });
  }

  void _navigateToAppropriateScreen() async {
    final currentUser = _auth.currentUser;

    if (currentUser != null) {
      Get.offNamed(ROUTE_HOME_SCREEN);
      StringConstant.greetingValue = greeting;
      StringConstant.userName = currentUser.displayName!;
      StringConstant.userImageLoc = currentUser.photoURL!;
    } else {
      Get.offNamed(ROUTE_GOOGLE_SIGN_IN_SCREEN);
    }
  }
}
