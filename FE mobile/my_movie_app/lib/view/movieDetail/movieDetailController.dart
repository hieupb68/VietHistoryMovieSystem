import 'package:get/get.dart';
import 'package:my_movie_app/core/service/hive_service.dart';
import 'package:my_movie_app/models/movie.dart';
import 'package:video_player/video_player.dart';

class MovieDetailController extends GetxController {

  final hiveService = HiveService();

  var isPlaying = false.obs; // Theo dõi trạng thái phát video
  RxInt star = 4.obs;
  RxBool isFavourite = false.obs;
  final Movie movie = Get.arguments as Movie;


  // final Movie movie; // Thông tin phim
 late VideoPlayerController _controller;

  @override
  void dispose() {
    super.dispose();
    hiveService.closeBox();
  }
  @override
  Future<void> onInit() async {
    super.onInit();
    isFavourite.value = hiveService.isFavorite(movie.id);

  }
  Future<void> changedStar(int starChange)async {
    star.value = starChange;
  }
  Future<void> onRate(int starCount)async{

  }
  Future<void> saveFavourite(Movie movie)async{
    final movieEntities = movie.toMovieEntities();
    if(movieEntities.id != null){
      hiveService.saveFavorite(movieEntities,);
    }
    isFavourite.value = true;
  }
  Future<void> removeFavourite(Movie movie)async{
    final movieEntities = movie.toMovieEntities();
    if(movieEntities.id != null ){
      hiveService.deleteFavorite(movieEntities.id!);
    }
    isFavourite.value = false;
  }

  @override
  void onClose() {


    super.onClose();
  }
}