import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';
import 'package:newsapp/Controller/HomeController.dart';
import 'package:newsapp/Utils/AppTextStyle.dart';
import 'package:newsapp/View/DetailedPage.dart';
import 'package:responsive_sizer/responsive_sizer.dart';

class BreakingNews extends StatelessWidget {
  const BreakingNews({super.key});

  @override
  Widget build(BuildContext context) {
    final HomeController homeController = Get.find();
    return ListView.builder(
      itemCount: homeController.dashboard[0].breakingNews.length,
      shrinkWrap: true,
      physics: const NeverScrollableScrollPhysics(),
      itemBuilder: (context, index) {
        var data = homeController.dashboard[0].breakingNews[index];
        var formattedDate = DateFormat('dd-MM-yyyy').format(data.published);
        return InkWell(
          onTap: () {
            Get.to(() => DetailPage(data));
          },
          child: Card(
            elevation: 2.0,
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: Column(
                children: [
                  Row(
                    children: [
                      Expanded(
                        child: Padding(
                          padding: const EdgeInsets.all(2.0),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                data.title,
                                softWrap: true,
                                maxLines: 4,
                                style: AppTextStyle().HeadingTitleLight,
                              ),
                              SizedBox(height: 10.sp),
                              Text(formattedDate.toString(),
                                  style: TextStyle(color: Colors.grey)),
                            ],
                          ),
                        ),
                      ),
                      SizedBox(width: 16.sp),
                      ClipRRect(
                        borderRadius: BorderRadius.circular(10),
                        child: Image.network(
                          height: 42.sp,
                          width: 50.sp,
                          fit: BoxFit.fill,
                          data.coverImage,
                          errorBuilder: (BuildContext context, Object exception,
                              StackTrace? stackTrace) {
                            return const SizedBox(
                                child: CircularProgressIndicator());
                          },
                        ),
                      )
                    ],
                  ),
                ],
              ),
            ),
          ),
        );
      },
    );
  }
}
