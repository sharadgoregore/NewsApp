// ignore_for_file: non_constant_identifier_names, file_names

import 'package:flutter/material.dart';

import 'package:responsive_sizer/responsive_sizer.dart';



class AppTextStyle {
  TextStyle HeadingTitleBold = TextStyle(
    fontSize: 18.sp,
    fontWeight: FontWeight.bold,
    fontFamily: "Inter-Bold",
  );
  TextStyle HeadingTitleMedium = TextStyle(
    fontSize: 18.sp,
    fontFamily: "Inter-SemiBold",
  );
  TextStyle HeadingTitleLight = TextStyle(
    fontSize: 16.sp,
    fontFamily: "Inter-Light",
  );

  //fonts with 16 font Size
  TextStyle subHeadingTitleBold = TextStyle(
    fontWeight: FontWeight.w900,
    fontSize: 16.sp,
    fontFamily: "Inter-Bold",
  );
  TextStyle subHeadingTitleBlack = TextStyle(
    fontSize: 16.sp,
    fontFamily: "Inter-Black",
  );
  TextStyle subHeadingTitleMedium = TextStyle(
    fontSize: 16.sp,
    fontFamily: "Inter-SemiBold",
  );
  TextStyle subHeadingTitleLight = TextStyle(
    fontSize: 16.sp,
    fontFamily: "Inter-Light",
  );

  //fonts with 14 font Size
  TextStyle descriptionTitleBold = TextStyle(
    fontSize: 14.sp,
    fontFamily: "Inter-Bold",
  );
  TextStyle descriptionTitleMedium = TextStyle(
    fontSize: 16.sp,
  );
  TextStyle descriptionTitleLight = TextStyle(
    fontSize: 14.sp,
    fontFamily: "Inter-Light",
  );
}
