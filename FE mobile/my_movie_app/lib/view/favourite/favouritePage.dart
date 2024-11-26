import 'package:get/get.dart';
import 'package:flutter/material.dart';
import 'package:my_movie_app/appRouter.dart';
import 'package:my_movie_app/comon/widget/movieItem.dart';
import 'package:my_movie_app/view/favourite/favouriteController.dart';

class FavouritePage extends GetWidget {
  final FavouriteController favouriteController =
      Get.put(FavouriteController());
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: favouriteController.movies.value.isEmpty
          ? Center(
              child: Text('no_favourite_movies'.tr),
            )
          : Container(
              padding: const EdgeInsets.all(16),
              child: Column(
                children: [
                  const SizedBox(
                    height: 16,
                  ),
                  Expanded(
                    child: GridView.count(
                      crossAxisCount: 2, // Số cột trong một hàng
                      crossAxisSpacing: 10, // Khoảng cách giữa các cột
                      mainAxisSpacing: 10, // Khoảng cách giữa các hàng
                      padding: const EdgeInsets.all(10),
                      childAspectRatio: 170 / 340,
                      children: [
                        ...favouriteController.movies.map((e) => MovieItem(
                            imageUrl: e.image,
                            name: e.title,
                            year: e.year,
                            onTap: () {
                              Get.toNamed(AppRouter.MOVIE_DETAIL_PAGE,
                                  arguments: e);
                            })),
                      ],
                    ),
                  )
                ],
              ),
            ),
    );
  }
}
