import 'dart:convert';

import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:newsapp/Model/NewsModel.dart';

class HomeController extends GetxController {
  var dashboard = <Dashboard>[].obs;

  @override
  void onInit() async {
    getNewsData();
    super.onInit();
  }

// To get data from json file to Model class
  getNewsData() async {
    final String response = await rootBundle.loadString('assets/newsdata.json');
    final data = await json.decode(response);
    var jsondata = NewsModel.fromJson(data);
    dashboard.add(jsondata.dashboard);
  }
}
