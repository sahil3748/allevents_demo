import 'dart:convert';
import 'dart:developer';

import 'package:allevents_demo/model/event_model.dart';
import 'package:get/get.dart';
import 'package:http/http.dart' as http;

class EventListingController extends GetxController {
  bool? isLoading;
  List<EventModel> eventListing = [];
  String? argumentValue;
  @override
  void onInit() {
    isLoading = true;
    argumentValue = Get.arguments;
    log("Arg : $argumentValue");
    fetchEventListingData();
    super.onInit();
  }

  Future<void> fetchEventListingData() async {
    try {
      final response = await http.get(Uri.parse(argumentValue!));
      // print("Response : ${json.decode(response.body)}");
      if (response.statusCode == 200) {
        Map<String, dynamic> data = jsonDecode(response.body);
        List<dynamic> itemList = data['item'];

        for (var item in itemList) {
          bool eventTicket = item['tickets']['has_tickets'];
          // print("val: $eventTicket");
          // String? ticketPrice;
          // String? ticketCurrency;

          // if (eventTicket == true) {
          //   ticketCurrency = item['tickets']['has_tickets'];
          //   ticketPrice = item['tickets']['has_tickets'].toString();
          // } else {
          //   ticketCurrency = "Not Define";
          //   ticketPrice = "Not Define";
          // }

          eventListing.add(EventModel(
            eventId: item['event_id'],
            eventName: item['eventname'],
            eventLocation: "${item['location']}, ${item['venue']['city']}",
            eventDate: item['label'],
            eventUrl: item['event_url'],
            eventShareUrl: item['share_url'],
            eventImageUrl: item['banner_url'],
            eventScore: item['score'].toString(),
            eventHasTicket: eventTicket,
            // eventTicketCurrency: ticketCurrency,
            // eventTicketMinPrize: ticketPrice
          ));
        }
        // final List<dynamic> data = json.decode(response.body);
        isLoading = false;
        // _printCategories(data);
        update();
      } else {
        isLoading = false;
        throw Exception('Failed to load data');
      }
    } catch (error) {
      isLoading = false;
      log(error.toString());
    }
  }
}
