import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:newsapp/Controller/HomeController.dart';
import 'package:responsive_sizer/responsive_sizer.dart';

class NewsCategoryScreen extends StatelessWidget {
  const NewsCategoryScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final HomeController homeController = Get.find();
    return Obx(() => homeController.dashboard.isNotEmpty
        ? SizedBox(
            height: 30.sp,
            child: ListView.builder(
              itemCount: homeController.dashboard[0].categories.length,
              shrinkWrap: true,
              scrollDirection: Axis.horizontal,
              itemBuilder: (context, index) {
                var data = homeController.dashboard[0].categories[index];
                return Padding(
                    padding: const EdgeInsets.all(6.0),
                    child: Container(
                      height: 70,
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(8),
                          color: const Color.fromARGB(255, 126, 41, 141)),
                      child: Center(
                        child: Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Text(
                            data.title,
                            style: const TextStyle(
                                color: Colors.white,
                                fontWeight: FontWeight.bold),
                          ),
                        ),
                      ),
                    ));
              },
            ),
          )
        : const SizedBox());
  }
}
