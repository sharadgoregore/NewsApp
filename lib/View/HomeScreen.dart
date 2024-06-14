import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:newsapp/Controller/HomeController.dart';
import 'package:newsapp/Utils/AppTextStyle.dart';
import 'package:newsapp/Widgets/Bannerwidget.dart';
import 'package:newsapp/Widgets/BreakingNewsSectionWidget.dart';
import 'package:newsapp/Widgets/Categorywidget.dart';
import 'package:newsapp/Widgets/TrendingNewsWidget.dart';
import 'package:responsive_sizer/responsive_sizer.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  final HomeController homeController = Get.find();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          centerTitle: true,
          title: Text(
            "Daily News",
            style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20.sp),
          ),
        ),
        drawer: Drawer(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: <Widget>[
              Column(
                children: <Widget>[
                  Container(
                    height: 50.sp,
                    color:  Color.fromARGB(255, 126, 41, 141),
                  ),
                  SizedBox(
                    height: 20.sp,
                  ),
                  ListTile(
                    leading: const Icon(Icons.star),
                    title: const Text('Top Stories'),
                    onTap: () {},
                  ),
                  ListTile(
                    leading: const Icon(Icons.public),
                    title: const Text('World'),
                    onTap: () {},
                  ),
                  ListTile(
                    leading: const Icon(Icons.account_balance),
                    title: const Text('Politics'),
                    onTap: () {},
                  ),
                  ListTile(
                    leading: const Icon(Icons.business),
                    title: const Text('Business'),
                    onTap: () {},
                  ),
                  ListTile(
                    leading: const Icon(Icons.computer),
                    title: const Text('Technology'),
                    onTap: () {},
                  ),
                ],
              ),
              Container(
                padding: const EdgeInsets.all(14),
                width: 80.sp,
                color: const Color.fromARGB(255, 103, 161, 105),
                child: const Text(
                  '© 2024 Global InfoTech . All rights reserved',
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    fontSize: 12,
                    color: Colors.white,
                  ),
                ),
              ),
            ],
          ),
        ),
        body: SafeArea(
          child: Obx(() => homeController.dashboard.isNotEmpty
              ? Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: ListView(
                    children: [
                      const NewsCategoryScreen(),
                      SizedBox(
                        height: 10.sp,
                      ),
                      CarouselSliderDemo(),
                      SizedBox(
                        height: 15.sp,
                      ),
                      Text(' Trending News',
                          style: AppTextStyle().HeadingTitleBold),
                      const TrendingNews(),
                      SizedBox(
                        height: 10.sp,
                      ),
                      Text(' Breaking News',
                          style: AppTextStyle().HeadingTitleBold),
                      SizedBox(
                        height: 10.sp,
                      ),
                      const BreakingNews(),
                    ],
                  ),
                )
              : const SizedBox()),
        ));
  }
}
