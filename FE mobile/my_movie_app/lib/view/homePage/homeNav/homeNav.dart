import 'package:get/get.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter/material.dart';
import 'package:my_movie_app/appRouter.dart';
import 'package:my_movie_app/comon/widget/movieItem.dart';
import 'package:my_movie_app/comon/widget/movie_slide.dart';
import 'package:my_movie_app/view/homePage/homeNav/homeNavController.dart';

class HomeNavPage extends GetWidget {
   final HomeNavController homeNavController = Get.put(HomeNavController());
  @override
  Widget build(BuildContext context) {
      return Scaffold(

        body: Container(
          padding: const EdgeInsets.symmetric(horizontal: 16),

          child: SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                SizedBox(height: 16,),
                 Text('new_movies'.tr,style: TextStyle(fontSize: 20,fontWeight: FontWeight.bold),),
                const SizedBox(height: 16,),
                MoviesSlider(movie: homeNavController.movies),
                const SizedBox(height: 16,),
                 Text('random_movies'.tr,style: TextStyle(fontSize: 20,fontWeight: FontWeight.bold),),
                const SizedBox(height: 16,),
                SingleChildScrollView(
                  scrollDirection: Axis.horizontal,
                  child: Row(
                    children: [
                      ...homeNavController.movies.map((e) =>
                      MovieItem(imageUrl: e.image, name: e.title, year: e.year, onTap: (){
                         Get.toNamed(AppRouter.MOVIE_DETAIL_PAGE, arguments: e);
                      })
                      ),

                    ],
                  ),
                ),
                const SizedBox(height: 16,),
                 Text('life'.tr,style: TextStyle(fontSize: 20,fontWeight: FontWeight.bold),),
                const SizedBox(height: 16,),
                SingleChildScrollView(
                  scrollDirection: Axis.horizontal,
                  child: Row(
                    children: [
                      ...homeNavController.movies.map((e) =>
                      MovieItem(imageUrl: e.image, name: e.title, year: e.year, onTap: (){

                      })
                      ),

                    ],
                  ),
                ),

              ],
            ),
          ),
        ),
      );
  }

}