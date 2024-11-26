import 'dart:convert';
import 'dart:math';
import 'package:get/get.dart';
import 'package:my_movie_app/core/service/api_service.dart';
import 'package:my_movie_app/models/movie.dart';


class HomeNavController extends GetxController{
  var movies = <Movie>[].obs;
  RxList<Movie> newMovies = <Movie>[].obs;
  RxList<Movie> randomMovies = <Movie>[].obs;

  @override
  Future<void> onInit() async {
    super.onInit();
    // get all movie
    // List<Movie> movieResponse = await ApiService.getAllMovies();
    // movies.addAll(movieResponse) ;
    // newMovies.value = getNewMovies(movies.value);
    // randomMovies.value = getRandomMovies(movies);



    // Chuyển đổi JSON thành danh sách đối tượng Movie
  List<dynamic> jsonList = jsonDecode(jsonData);

  // Chuyển đổi danh sách json thành List<Movie>
   movies.value = jsonList.map((json) => Movie.fromJson(json)).toList();

  }

  // Hàm lấy danh sách 5 phim mới nhất
  List<Movie> getNewMovies(List<Movie> movies) {
    // Lọc danh sách phim có giá trị `year` không null, sau đó sắp xếp theo năm giảm dần
    final sortedMovies = movies.where((movie) => movie.year != null).toList()
      ..sort((a, b) => b.year!.compareTo(a.year!));

    // Lấy tối đa 5 phim
    return sortedMovies.take(5).toList();
  }

// Hàm lấy danh sách 5 phim ngẫu nhiên
  List<Movie> getRandomMovies(List<Movie> movies) {
    final random = Random();
    final randomMovies = movies.toList()..shuffle(random);

    // Lấy tối đa 5 phim
    return randomMovies.take(5).toList();
  }


  String jsonData = '''
 [
  {
    "id": 1,
    "description": "Đất phương Nam là một bộ phim ngắn tập chính kịch phiêu lưu Việt Nam năm 1997 do Nguyễn Vinh Sơn làm đạo diễn kiêm viết kịch bản. Bộ phim dựa trên tiểu thuyết Đất rừng phương Nam của nhà văn Đoàn Giỏi, kể về hành trình tìm cha của một cậu bé ở vùng Tây Nam Bộ. Bộ phim được ra mắt nhân dịp kỷ niệm 300 năm thành lập Sài Gòn - Thành phố Hồ Chí Minh, được sản xuất và phát hành bởi Hãng phim Truyền hình Thành phố Hồ Chí Minh. Bộ phim được phát sóng lần đầu vào năm 1997 trên kênh HTV9 và DRT. Đất phương Nam là phim truyền hình đầu tiên của Việt Nam được xuất khẩu sang Mỹ và được đánh giá là có sức sống vượt thời gian. Đất phương Nam lấy bối cảnh Nam Bộ trong thời kỳ bị thực dân Pháp và bọn cường hào, địa chủ cai trị. Bộ phim là câu chuyện về cuộc sống của những con người dân quê bình dị trong thời cuộc loạn lạc. Do nghịch cảnh mất mẹ, cậu bé An trôi dạt tha phương trên bước đường đi tìm cha. Lưu lạc về phương Nam, An gặp những cảnh đời ngang trái, những mảnh đời lầm than của người nông dân dưới ách áp bức của địa chủ và thực dân. Giữa đất trời mênh mông nhưng người nông dân phải chịu cảnh mất đất đai, được mùa nhưng không giữ được vật phẩm. Hoàn cảnh đã đưa đẩy họ trở thành những người nông dân khởi nghĩa. Tuy ba chìm bảy nổi giữa dòng đời, An vẫn luôn sống trong lòng nhân ái, đùm bọc của đồng bào. Đó là nguồn động lực đưa cậu vượt qua những khó khăn gian khổ.",
    "director": "Nguyễn Vinh Sơn",
    "image": "https://media.baoquangninh.vn/upload/image/202201/medium/1930257_dc7ecf2cbb840dc7ee63a7b569d79287.jpg",
    "title": "Đất Rừng Phương Nam",
    "url": "https://flutter.github.io/assets-for-api-docs/assets/videos/bee.mp4"
  },
  {
    "id": 2,
    "description": "Biệt động Sài Gòn là một bộ phim truyền hình, chiến tranh của Việt Nam do Xưởng phim truyện Việt Nam sản xuất vào những năm 80. Đây là bộ phim đầu tiên cũng như là duy nhất của nền Điện ảnh Việt Nam tái hiện lại những cuộc chiến nổi bật của Lực lượng Đặc công Quân Giải phóng miền Nam (hay Biệt động Sài Gòn) trong Sự kiện Tết Mậu Thân và công cuộc Kháng chiến chống Mỹ của Quân Giải phóng tại miền Nam Việt Nam. Khi được công chiếu lần đầu vào năm 1986, phim đã gây sốt toàn rạp phim Việt Nam thời điểm ấy. Bộ phim được sản xuất bởi Xưởng phim truyện Việt Nam và bắt đầu bấm máy năm 1982. Kịch bản phim do Lê Phương và Nguyễn Thanh chịu trách nhiệm thực hiện.",
    "director": "Long Vân",
    "image": "https://danviet.mediacdn.vn/2021/4/30/tienphonggiaiphong4hdfs-1619752200192-1619752200193513054133.jpg",
    "title": "Biệt Động Sài Gòn",
    "url": "https://flutter.github.io/assets-for-api-docs/assets/videos/bee.mp4"
  },
  {
    "id": 3,
    "description": "Mùa len trâu là bộ phim đầu tay của đạo diễn Việt kiều Nguyễn Võ Nghiêm Minh được khởi quay tháng 9 năm 2003. Bộ phim có kinh phí khoảng hơn 1 triệu USD, với sự tham gia của ba hãng: Hãng phim Giải Phóng Việt Nam, 3B Productions Pháp và Novak Prod Bỉ. Bộ phim được trình chiếu ở Pháp với tên Gardien de buffles và ở Mỹ với tên Buffalo boy. Chuyện phim dựa trên tác phẩm Mùa len trâu trong tập truyện Hương rừng Cà Mau của nhà văn Sơn Nam, kể về cuộc sống của những người nông dân miền Nam đầu thế kỷ 20. Mỗi khi mùa mưa về, nước tràn ngập mọi nơi, có những người làm nghề len trâu, đưa trâu đi tìm cỏ để sống qua mùa lũ.",
    "director": "Nguyễn Võ Nghiêm Minh",
    "image": "https://upload.wikimedia.org/wikipedia/vi/f/f8/Mua_len_trau.jpg",
    "title": "Mùa len trâu",
    "url": "https://flutter.github.io/assets-for-api-docs/assets/videos/bee.mp4"
  }
]
''';
}