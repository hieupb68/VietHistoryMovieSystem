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
                  InkWell( onTap: searchController.clear,
                      child: const Icon(Icons.close)),
                  const SizedBox(
                    width: 8,
                  ),
                  Expanded(
                      child: Stack(
                        alignment: Alignment.centerRight,
                        children: [
                          Container(
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

                          ),
                          InkWell(
                            onTap: searchController.search        ,
                            child: Padding(
                              padding: const EdgeInsets.only( right: 16.0),
                              child: const Icon(Icons.search),
                            ),
                          )
                        ],
                      )),
                  const SizedBox(
                    width: 24,
                  ),

                ],
              ),
            ),
            const SizedBox(height: 16,),
            Expanded(child: Obx(()=>
               searchController.movies.value.isNotEmpty? GridView.builder(
                 itemCount: searchController.movies.length,
                 gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                   crossAxisCount: 3, // Số cột trong một hàng
                   crossAxisSpacing: 8.0, // Khoảng cách giữa các cột
                   mainAxisSpacing: 2.0, // Khoảng cách giữa các hàng
                   childAspectRatio: 0.6, // Tỉ lệ khung hình (width/height)
                 ),
                 itemBuilder: (context, index) {
                   final movie = searchController.movies[index];
                   return MovieItem(
                     imageUrl: movie.image,
                     name: movie.title,
                     year: movie.year,
                     onTap: () {
                       Get.toNamed(AppRouter.MOVIE_DETAIL_PAGE, arguments: movie);
                     },
                   );
                 },
               ): Center(child: Text( searchController.isInit.value ?'search_movie'.tr : 'movie_not_found'.tr),)
            ),)
          ],
        ),
      ),
    );
  }
}
