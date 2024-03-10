import 'dart:developer';

import 'package:allevents_demo/routes/app_pages.dart';
import 'package:allevents_demo/screens/google_sign_in_screen/google_sign_in_controller.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class GoogleSignInScreen extends StatelessWidget {
  const GoogleSignInScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return GetBuilder<GoogleSignInController>(
        init: GoogleSignInController(),
        builder: (controller) {
          return SafeArea(
            child: Scaffold(
              backgroundColor: Colors.white70.withOpacity(.9),
              body: Center(
                child: ElevatedButton(
                  onPressed: () async {
                    UserCredential? userCredential =
                        await controller.signInWithGoogle();
                    if (userCredential != null) {
                      log('Signed in as: ${userCredential.user!.email}');
                      Get.offNamed(ROUTE_HOME_SCREEN);
                    } else {
                      log('Google sign-in failed.');
                    }
                  },
                  child: const Text('Sign in with Google'),
                ),
              ),
            ),
          );
        });
  }
}
