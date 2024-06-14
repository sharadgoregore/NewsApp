import 'package:flutter/material.dart';

import 'package:newsapp/Model/NewsModel.dart';
import 'package:newsapp/Utils/AppTextStyle.dart';
import 'package:newsapp/Utils/HtmlParser.dart';
import 'package:responsive_sizer/responsive_sizer.dart';

class DetailPage extends StatelessWidget {
  final Bannerdata banner;
  const DetailPage(this.banner, {super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: SingleChildScrollView(
        child: Column(
          children: [
            Text(
              banner.title,
              style: AppTextStyle().HeadingTitleBold,
              textAlign: TextAlign.center,
            ),
            SizedBox(
              height: 20.sp,
            ),
            Image.network(
              height: 65.sp,
              width: 95.w,
              fit: BoxFit.fill,
              banner.coverImage,
              errorBuilder: (BuildContext context, Object exception,
                  StackTrace? stackTrace) {
                return SizedBox(
                    height: 40.sp,
                    child: const Center(child: CircularProgressIndicator()));
              },
            ),
            SizedBox(
              height: 20.sp,
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Text(
                parseHtmlString(banner.summary),
                style: AppTextStyle().descriptionTitleMedium,
              ),
            )
          ],
        ),
      ),
    );
  }
}
