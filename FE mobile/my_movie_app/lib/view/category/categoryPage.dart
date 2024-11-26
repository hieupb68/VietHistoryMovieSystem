import 'package:get/get.dart';
import 'package:flutter/material.dart';
import 'package:my_movie_app/view/category/categoryController.dart';
import 'package:my_movie_app/view/categoryWidgetPage/categoryWidgetPage.dart';
class Categorypage extends GetWidget {

   final CategoryController searchController = Get.put(CategoryController());
  @override
  Widget build(BuildContext context) {
    return   DefaultTabController(
      length: 5, // Số lượng tab
      child: Scaffold(
        body: Column(
          children: [
            TabBar(
              isScrollable: true, // Cho phép cuộn nếu các tab quá dài
              tabs: [
                Tab(text: 'war'.tr), // Tab 1
                Tab(text: 'character'.tr),   // Tab 2
                Tab(text: 'legend'.tr), // Tab 3
                Tab(text: 'life'.tr),  // Tab 4
                Tab(text: 'document'.tr),   // Tab 5
              ],
            ),
            Expanded(
              child: TabBarView(
                children: [
                  // Nội dung từng tab
                  CategoryWidgetPage(indexPage: 0,),
                  CategoryWidgetPage(indexPage: 1,),
                  CategoryWidgetPage(indexPage: 2,),
                  CategoryWidgetPage(indexPage: 3,),
                  CategoryWidgetPage(indexPage: 4,),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
