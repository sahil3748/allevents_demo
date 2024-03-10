import 'dart:developer';

import 'package:firebase_auth/firebase_auth.dart';
import 'package:get/get.dart';
import 'package:google_sign_in/google_sign_in.dart';

class GoogleSignInController extends GetxController {
  final FirebaseAuth auth = FirebaseAuth.instance;
  final GoogleSignIn googleSignIn = GoogleSignIn();

  Future<UserCredential?> signInWithGoogle() async {
    try {
      // Trigger the Google sign-in flow
      final GoogleSignInAccount? googleUser = await googleSignIn.signIn();

      // Check if sign-in was successful
      if (googleUser != null) {
        // Obtain authentication details from the request
        final GoogleSignInAuthentication googleAuth =
            await googleUser.authentication;

        // Create a new credential
        final credential = GoogleAuthProvider.credential(
          accessToken: googleAuth.accessToken,
          idToken: googleAuth.idToken,
        );

        // Sign in to Firebase with the credential
        UserCredential userCredential =
            await auth.signInWithCredential(credential);

        return userCredential;
      } else {
        return null;
      }
    } on FirebaseAuthException catch (e) {
      // Handle Firebase Auth exceptions
      log('Firebase Auth Exception: ${e.code} - ${e.message}');
      return null;
    } catch (e) {
      // Handle other exceptions
      log('Error signing in with Google: $e');
      return null;
    }
  }

  // @override
  // void onReady() {
  //   super.onReady();
  //   _navigateToAppropriateScreen();
  // }

  // void _navigateToAppropriateScreen() async {
  //   final currentUser = _auth.currentUser;

  //   if (currentUser != null) {
  //     // debugPrint("${currentUser.displayName}");
  //     Get.offNamed('/ROUTE_LOGIN_SCREEN');
  //   } else {
  //     Get.offNamed('/ROUTE_HOME_SCREEN');
  //   }
  // }
}
