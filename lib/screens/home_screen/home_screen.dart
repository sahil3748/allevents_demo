import 'package:allevents_demo/constants/utils/string_constant.dart';
import 'package:allevents_demo/routes/app_pages.dart';
import 'package:allevents_demo/screens/home_screen/home_screen_controller.dart';
import 'package:allevents_demo/widgets/custom_image_view.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return GetBuilder<HomeController>(
        init: HomeController(),
        builder: (controller) {
          return Scaffold(
              backgroundColor: Colors.white70.withOpacity(.9),
              body: SafeArea(
                  child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: Column(
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Column(
                          mainAxisAlignment: MainAxisAlignment.start,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              StringConstant.greetingValue,
                              style: Theme.of(context)
                                  .textTheme
                                  .labelLarge!
                                  .copyWith(
                                      fontSize: 18,
                                      color: Theme.of(context)
                                          .colorScheme
                                          .primary),
                            ),
                            Text(
                              StringConstant.userName,
                              style: Theme.of(context)
                                  .textTheme
                                  .labelLarge!
                                  .copyWith(
                                      fontSize: 18,
                                      color: Theme.of(context)
                                          .colorScheme
                                          .primary),
                            ),
                          ],
                        ),
                        CustomImageView(
                          url: StringConstant.userImageLoc,
                          height: 50,
                          width: 50,
                          radius: BorderRadius.circular(50),
                        )
                      ],
                    ),
                    const SizedBox(
                      height: 20,
                    ),
                    controller.isLoading == true
                        ? const Expanded(
                            child: Center(
                              child: CircularProgressIndicator(),
                            ),
                          )
                        : Expanded(
                            child: GridView.builder(
                                itemCount: controller.categoryList.length,
                                gridDelegate:
                                    const SliverGridDelegateWithFixedCrossAxisCount(
                                        crossAxisCount: 2,
                                        childAspectRatio: 1.25,
                                        mainAxisSpacing: 10),
                                itemBuilder: (context, index) {
                                  return InkWell(
                                    onTap: () {
                                      Get.toNamed(ROUTE_EVENT_LISTING_SCREEN,
                                          arguments:
                                              '${controller.categoryList[index].categoryData}');
                                    },
                                    child: Column(
                                      children: [
                                        CustomImageView(
                                          imagePath:
                                              '${controller.categoryList[index].categoryImage}',
                                          height: 100,
                                          width: 100,
                                          containercolor: Theme.of(context)
                                              .colorScheme
                                              .primary,
                                          radius: BorderRadius.circular(50),
                                          // color: Theme.of(context).colorScheme.primary,
                                        ),
                                        const SizedBox(
                                          height: 15,
                                        ),
                                        Text('${controller.categoryList[index].categoryName}'
                                                .substring(0, 1)
                                                .toUpperCase() +
                                            '${controller.categoryList[index].categoryName} Events'
                                                .substring(1)),
                                      ],
                                    ),
                                  );
                                }),
                          ),
                    ElevatedButton(
                        onPressed: () {}, child: const Text('Logout'))
                  ],
                ),
              )));
        });
  }
}
