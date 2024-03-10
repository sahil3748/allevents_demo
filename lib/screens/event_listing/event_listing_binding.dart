import 'package:allevents_demo/screens/event_listing/event_listing_controller.dart';
import 'package:get/get.dart';

class EventListingBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<EventListingController>(() => EventListingController());
  }
}
