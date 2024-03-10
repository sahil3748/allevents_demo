import 'package:allevents_demo/routes/app_pages.dart';
import 'package:allevents_demo/screens/event_detail/event_detail_binding.dart';
import 'package:allevents_demo/screens/event_detail/event_detail_screen.dart';
import 'package:allevents_demo/screens/event_listing/event_listing_binding.dart';
import 'package:allevents_demo/screens/home_screen/home_screen.dart';
import 'package:allevents_demo/screens/home_screen/home_screen_binding.dart';
import 'package:allevents_demo/screens/splash_screen/splash_screen.dart';
import 'package:allevents_demo/screens/splash_screen/splash_screen_binding.dart';
import 'package:get/get.dart';

import '../screens/event_listing/event_listing_screen.dart';
import '../screens/google_sign_in_screen/google_sign_in_binding.dart';
import '../screens/google_sign_in_screen/google_sign_in_screen.dart';

final routePages = [
  GetPage(
    name: ROUTE_SPLASH_SCREEN,
    page: () => const SplashScreen(),
    binding: SplashBinding(),
  ),
  GetPage(
    name: ROUTE_GOOGLE_SIGN_IN_SCREEN,
    page: () => const GoogleSignInScreen(),
    binding: GoogleSignInBinding(),
  ),
  GetPage(
    name: ROUTE_HOME_SCREEN,
    page: () => const HomePage(),
    binding: HomeBinding(),
  ),
  GetPage(
    name: ROUTE_EVENT_LISTING_SCREEN,
    page: () => const EventListingScreen(),
    binding: EventListingBinding(),
  ),
  GetPage(
    name: ROUTE_EVENT_DETAILS_SCREEN,
    page: () => const EventDetailScreen(),
    binding: EventDetailBinding(),
  ),
];
