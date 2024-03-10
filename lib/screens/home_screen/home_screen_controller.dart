import 'dart:developer';

import 'package:allevents_demo/constants/utils/image_constant.dart';
import 'package:allevents_demo/model/category_model.dart';
import 'package:get/get.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

import '../../constants/utils/string_constant.dart';

class HomeController extends GetxController {
  bool? isLoading;
  List<CategoryModel> categoryList = [];

  @override
  void onInit() {
    super.onInit();
    isLoading = true;
    log(StringConstant.greetingValue);
    log(StringConstant.userName);
    log(StringConstant.userImageLoc);

    fetchData();
  }

  // void redirectToListingPage() {
  //   Get.offNamed(ROUTE_HOME_SCREEN);
  // }

  Future<void> fetchData() async {
    try {
      final response = await http.get(Uri.parse(
          'https://allevents.s3.amazonaws.com/tests/categories.json'));
      if (response.statusCode == 200) {
        final List<dynamic> data = json.decode(response.body);
        // log("Response : ${json.decode(response.body)}");
        _printCategories(data);
        isLoading = false;
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

  void _printCategories(List<dynamic> data) {
    for (final item in data) {
      final category = item["category"];
      final data = item["data"];

      log('${ImageConstant.imagePath}/$category.png');

      categoryList.add(CategoryModel(
          categoryName: category,
          categoryData: data,
          categoryImage: '${ImageConstant.imagePath}/$category.png'));
    }
  }
}
