import 'package:get/get.dart';
import 'package:flutter/material.dart';
import 'package:my_movie_app/appRouter.dart';
import 'package:my_movie_app/comon/widget/movieItem.dart';
import 'package:my_movie_app/view/categoryWidgetPage/categoryWidgetController.dart';

class CategoryWidgetPage extends StatefulWidget {
  final int indexPage;

  const CategoryWidgetPage({Key? key, required this.indexPage}) : super(key: key);

  @override
  State<CategoryWidgetPage> createState() => _CategoryWidgetPageState();
}

class _CategoryWidgetPageState extends State<CategoryWidgetPage> {
  final CategoryWidgetController categoryWidgetController = Get.put(CategoryWidgetController());

  @override
  void initState() {
    super.initState();
    categoryWidgetController.init(widget.indexPage); // Khởi tạo dữ liệu cho trang
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Obx(
            () => Padding(
          padding: const EdgeInsets.all(8.0),
          child: categoryWidgetController.movies.isNotEmpty
              ? GridView.builder(
            itemCount: categoryWidgetController.movies.length,
            gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 3, // Số cột trong một hàng
              crossAxisSpacing: 8.0, // Khoảng cách giữa các cột
              mainAxisSpacing: 2.0, // Khoảng cách giữa các hàng
              childAspectRatio: 0.6, // Tỉ lệ khung hình (width/height)
            ),
            itemBuilder: (context, index) {
              final movie = categoryWidgetController.movies[index];
              return MovieItem(
                imageUrl: movie.image,
                name: movie.title,
                year: movie.year,
                onTap: () {
                  Get.toNamed(AppRouter.MOVIE_DETAIL_PAGE, arguments: movie);
                },
              );
            },
          )
              : const Center(
            child: CircularProgressIndicator(), // Hiển thị vòng tròn tải khi không có dữ liệu
          ),
        ),
      ),
    );
  }
}
