import 'package:get/get.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter/material.dart';
import 'package:my_movie_app/appRouter.dart';
import 'package:my_movie_app/models/movie.dart';
import 'package:carousel_slider/carousel_slider.dart';

class MoviesSlider extends StatelessWidget {
  final List<Movie> movie;

  MoviesSlider({required this.movie});

  @override
  Widget build(BuildContext context) {

    return CarouselSlider(
      options: CarouselOptions(
        height: 250, // Chiều cao slider
        autoPlay: true, // Tự động chạy slide
        enlargeCenterPage: true, // Phóng to slide trung tâm
        aspectRatio: 16 / 9, // Tỷ lệ khung hình
        viewportFraction: 0.6, // Tỷ lệ phần tử trên viewport
      ),
      items: movie.map((element) {
        return Builder(
          builder: (BuildContext context) {
            return InkWell(
              onTap: (){
                 Get.toNamed(AppRouter.MOVIE_DETAIL_PAGE, arguments: element);
              },
              child: ClipRRect(
                borderRadius: BorderRadius.circular(12), // Bo góc ảnh
                child: Image.network(
                  element.image,
                  fit: BoxFit.cover, // Ảnh bao phủ hết vùng
                  // width: MediaQuery.of(context).size.width, // Độ rộng của ảnh
                ),
              ),
            );
          },
        );
      }).toList(),
    );
  }
}
