import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:newsapp/Controller/HomeController.dart';
import 'package:newsapp/Utils/AppTextStyle.dart';
import 'package:newsapp/View/DetailedPage.dart';
import 'package:intl/intl.dart';
import 'package:responsive_sizer/responsive_sizer.dart';

class TrendingNews extends StatelessWidget {
  const TrendingNews({super.key});

  @override
  Widget build(BuildContext context) {
    final HomeController homeController = Get.find();
    return SizedBox(
      height: 58.sp,
      child: ListView.builder(
        itemCount: homeController.dashboard[0].trendingNews.length,
        shrinkWrap: true,
        scrollDirection: Axis.horizontal,
        itemBuilder: (context, index) {
          var data = homeController.dashboard[0].trendingNews[index];
          var formattedDate = DateFormat('dd-MM-yyyy').format(data.published);
          return InkWell(
            onTap: () {
              Get.to(() => DetailPage(data));
            },
            child: SizedBox(
              width: 250,
              child: Card(
                elevation: 2.0,
                child: Column(
                  children: [
                    Image.network(
                      height: 47.sp,
                      width: 70.sp,
                      fit: BoxFit.fill,
                      data.coverImage,
                      errorBuilder: (BuildContext context, Object exception,
                          StackTrace? stackTrace) {
                        return SizedBox(
                            height: 40.sp,
                            child: const Center(
                                child: CircularProgressIndicator()));
                      },
                    ),
                    SizedBox(
                      height: 5.sp,
                    ),
                    Expanded(
                      child: Padding(
                        padding: const EdgeInsets.all(4.0),
                        child: Text(
                          data.title,
                          softWrap: true,
                          maxLines: 1,
                          style: AppTextStyle().HeadingTitleLight,
                        ),
                      ),
                    ),
                    Padding(
                      padding: EdgeInsets.only(left: 10.sp, right: 10.sp),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Row(
                            children: [
                              Icon(Icons.date_range, size: 17.sp),
                              SizedBox(
                                width: 8.sp,
                              ),
                              Text(formattedDate.toString(),
                                  style: TextStyle(color: Colors.grey)),
                            ],
                          ),
                          Row(
                            children: [
                              Icon(Icons.remove_red_eye, size: 17.sp),
                              SizedBox(
                                width: 8.sp,
                              ),
                              Text(data.newsViews,
                                  style: TextStyle(color: Colors.grey))
                            ],
                          )
                        ],
                      ),
                    ),
                    SizedBox(height: 7.sp)
                  ],
                ),
              ),
            ),
          );
        },
      ),
    );
  }
}
