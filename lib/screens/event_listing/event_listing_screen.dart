import 'package:allevents_demo/routes/app_pages.dart';
import 'package:allevents_demo/screens/event_listing/event_listing_controller.dart';
import 'package:allevents_demo/widgets/custom_image_view.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class EventListingScreen extends StatelessWidget {
  const EventListingScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return GetBuilder<EventListingController>(
        init: EventListingController(),
        builder: (controller) {
          return Scaffold(
            backgroundColor: Colors.white70.withOpacity(.9),
            appBar: AppBar(),
            body: SafeArea(
                child: controller.isLoading == true
                    ? const Center(
                        child: CircularProgressIndicator(),
                      )
                    : GridView.builder(
                        padding: const EdgeInsets.all(10),
                        itemCount: controller.eventListing.length,
                        gridDelegate:
                            const SliverGridDelegateWithFixedCrossAxisCount(
                                crossAxisCount: 2,
                                childAspectRatio: .54,
                                mainAxisSpacing: 10,
                                crossAxisSpacing: 10),
                        itemBuilder: (context, index) {
                          String? bannerUrl;
                          String? ticketText;
                          if (controller.eventListing[index].eventImageUrl ==
                              "") {
                            bannerUrl = "";
                          } else {
                            bannerUrl =
                                controller.eventListing[index].eventImageUrl;
                          }

                          if (controller.eventListing[index].eventHasTicket ==
                              true) {
                            ticketText = "Tickets Available";
                          } else {
                            ticketText = "Tickets Sold out";
                          }

                          return InkWell(
                            onLongPress: () {
                              print('Hi');
                            },
                            onTap: () {
                              Get.toNamed(ROUTE_EVENT_DETAILS_SCREEN,
                                  arguments:
                                      controller.eventListing[index].eventUrl);
                            },
                            child: Container(
                              decoration: BoxDecoration(
                                color: Colors.white70,
                                borderRadius: BorderRadius.circular(12),
                                shape: BoxShape.rectangle,
                              ),
                              padding: const EdgeInsets.all(0),
                              margin: const EdgeInsets.all(0),
                              child: Column(
                                mainAxisAlignment: MainAxisAlignment.start,
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  CustomImageView(
                                    imagePath: bannerUrl == ""
                                        ? "assets/images/image_not_found.png"
                                        : "",
                                    url: bannerUrl,
                                    radius: const BorderRadius.vertical(
                                        top: Radius.circular(12)),
                                    fit: BoxFit.cover,
                                    height:
                                        MediaQuery.sizeOf(context).height / 5,
                                    width:
                                        MediaQuery.sizeOf(context).width / 2.2,
                                  ),
                                  const SizedBox(
                                    height: 05,
                                  ),
                                  Padding(
                                    padding: const EdgeInsets.symmetric(
                                        horizontal: 4.0),
                                    child: Column(
                                      mainAxisAlignment:
                                          MainAxisAlignment.start,
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: [
                                        Text(
                                          '${controller.eventListing[index].eventName}',
                                          maxLines: 2,
                                          style: Theme.of(context)
                                              .textTheme
                                              .labelLarge,
                                        ),
                                        const SizedBox(
                                          height: 5,
                                        ),
                                        Text(
                                          '${controller.eventListing[index].eventDate}',
                                          maxLines: 1,
                                        ),
                                        const SizedBox(
                                          height: 5,
                                        ),
                                        Text(
                                          '${controller.eventListing[index].eventLocation}',
                                          maxLines: 2,
                                        ),
                                        const SizedBox(
                                          height: 5,
                                        ),
                                        // const Spacer(),
                                        Row(
                                          mainAxisAlignment:
                                              MainAxisAlignment.spaceBetween,
                                          children: [
                                            Text(
                                              ticketText,
                                              maxLines: 1,
                                              style: Theme.of(context)
                                                  .textTheme
                                                  .labelMedium!
                                                  .copyWith(
                                                      fontSize: 15,
                                                      color: controller
                                                                  .eventListing[
                                                                      index]
                                                                  .eventHasTicket ==
                                                              true
                                                          ? Colors.green
                                                          : Colors.red),
                                            ),
                                          ],
                                        ),
                                        // Row(
                                        //   children: [
                                        //     InkWell(
                                        //         onTap: () {},
                                        //         child: const Row(
                                        //           children: [
                                        //             Icon(Icons.share),
                                        //             Text('Share'),
                                        //           ],
                                        //         )),
                                        //   ],
                                        // )
                                      ],
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          );
                        })),
          );
        });
  }
}
