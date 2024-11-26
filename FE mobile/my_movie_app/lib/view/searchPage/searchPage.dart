import 'package:get/get.dart';
import 'package:flutter/material.dart';
import 'package:my_movie_app/appRouter.dart';
import 'package:my_movie_app/comon/widget/movieItem.dart';
import 'package:my_movie_app/view/searchPage/searchController.dart';

class Searchpage extends GetWidget {

   final SearchMovieController searchController = Get.put(SearchMovieController());
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        padding: const EdgeInsets.all(16),
        child: Column(
          children: [
            SizedBox(
              height: 40,
              child: Row(
                children: [
                  const Icon(Icons.close),
                  const SizedBox(
                    width: 16,
                  ),
                  Expanded(
                      child: Container(
                        decoration: BoxDecoration(
                            borderRadius: const BorderRadius.all(Radius.circular(24)),
                            border: Border.all(color: Get.isDarkMode? Colors.white: Colors.black)),
                        padding: const EdgeInsets.symmetric(
                          horizontal: 16,
                          vertical: 2
                        ),
                        child: TextField(
                          controller: searchController.textcontroller,
                          decoration:   InputDecoration(
                            border: InputBorder.none,
                            hintText: 'enter_movie_to_search'.tr,
                          ),
                        ),

                      )),
                  const SizedBox(
                    width: 16,
                  ),
                  const Icon(Icons.search)
                ],
              ),
            ),
            const SizedBox(height: 16,),
            Expanded(child: GridView.count(
              crossAxisCount: 2, // Số cột trong một hàng
              crossAxisSpacing: 10, // Khoảng cách giữa các cột
              mainAxisSpacing: 10, // Khoảng cách giữa các hàng
              padding: const EdgeInsets.all(10),
              childAspectRatio: 170/340,
              children: [
                ...searchController.movies.map((e) =>
                    MovieItem(imageUrl: e.image, name: e.title, year: e.year, onTap: (){
                      Get.toNamed(AppRouter.MOVIE_DETAIL_PAGE, arguments: e);
                    })),
              ],
            ),)
          ],
        ),
      ),
    );
  }
}
