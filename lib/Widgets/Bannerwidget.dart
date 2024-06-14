import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:get/get.dart';
import 'package:newsapp/Controller/HomeController.dart';
import 'package:newsapp/View/DetailedPage.dart';
import 'package:responsive_sizer/responsive_sizer.dart';

// ignore: must_be_immutable
class CarouselSliderDemo extends StatelessWidget {
  List<Map<String, dynamic>> bannerList = [];

  CarouselSliderDemo({super.key});

  @override
  Widget build(BuildContext context) {
    final HomeController homeController = Get.find();
    bannerList = homeController.dashboard[0].banners.map((item) {
      return {
        'coverImage': item.coverImage,
        'category': item.category,
        'title': item.title,
        'related': item.related,
        'published': item.published,
        'newsViews': item.newsViews,
        'summary': item.summary
      };
    }).toList();
    return Obx(() => homeController.dashboard.isNotEmpty
        ? SizedBox(
            height: 54.sp,
            child: Center(
                child: CarouselSlider.builder(
              itemCount: bannerList.length,
              options: CarouselOptions(
                aspectRatio: 15 / 6,
                viewportFraction: 0.8,
                initialPage: 0,
                enableInfiniteScroll: true,
                reverse: false,
                autoPlay: true,
                autoPlayInterval: const Duration(seconds: 3),
                autoPlayAnimationDuration: const Duration(milliseconds: 800),
                autoPlayCurve: Curves.fastOutSlowIn,
                enlargeCenterPage: true,
                scrollDirection: Axis.horizontal,
              ),
              itemBuilder: (BuildContext context, int index, int realIndex) {
                return InkWell(
                  onTap: () {
                    var data = homeController.dashboard[0].banners[index];
                    Get.to(() => DetailPage(data));
                  },
                  child: ClipRRect(
                    borderRadius: BorderRadius.circular(8),
                    child: Image.network(
                      height: 45.sp,
                      width: 75.sp,
                      fit: BoxFit.fill,
                      bannerList[index]['coverImage'].toString(),
                      errorBuilder: (BuildContext context, Object exception,
                          StackTrace? stackTrace) {
                        return SizedBox(
                            height: 40.sp,
                            child: const Center(
                                child: CircularProgressIndicator()));
                      },
                    ),
                  ),
                );
              },
            )),
          )
        : const SizedBox());
  }
}
