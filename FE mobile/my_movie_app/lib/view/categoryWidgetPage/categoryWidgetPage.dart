import 'package:get/get.dart';
import 'package:flutter/material.dart';
import 'package:my_movie_app/appRouter.dart';
import 'package:my_movie_app/comon/widget/movieItem.dart';
import 'package:my_movie_app/view/categoryWidgetPage/categoryWidgetController.dart';


class CategoryWidgetPage extends StatefulWidget {
  final int indexPage;
  const CategoryWidgetPage({super.key,required this.indexPage});

  @override
  State<CategoryWidgetPage> createState() => _CategoryWidgetPageState();
}
final CategoryWidgetController categoryWidgetController = Get.put(CategoryWidgetController());
class _CategoryWidgetPageState extends State<CategoryWidgetPage> {



  @override
  void initState() {
    super.initState();
    categoryWidgetController.init(widget.indexPage);
  }
  @override
  Widget build(BuildContext context) {
    final CategoryWidgetController categoryController = Get.put(CategoryWidgetController());
    return Scaffold(
      body: Container(
        padding: const EdgeInsets.all(16),
        child: GridView.count(
          crossAxisCount: 2, // Số cột trong một hàng
          crossAxisSpacing: 10, // Khoảng cách giữa các cột
          mainAxisSpacing: 10, // Khoảng cách giữa các hàng
          padding: const EdgeInsets.all(10),
          childAspectRatio: 170/340,
          children: [
            ...categoryController.movies.map((e) =>
                MovieItem(imageUrl: e.image, name: e.title, year: e.year, onTap: (){
                  Get.toNamed(AppRouter.MOVIE_DETAIL_PAGE, arguments: e);
                })),
          ],
        ),
      ),
    );
  }
}

