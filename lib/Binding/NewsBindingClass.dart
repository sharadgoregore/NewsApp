import 'package:get/get.dart';
import 'package:newsapp/Controller/HomeController.dart';

class NewsBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<HomeController>(() => HomeController());
  }
}
