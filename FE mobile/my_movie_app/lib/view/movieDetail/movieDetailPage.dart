import 'dart:async';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:flutter/services.dart';
import 'package:flutter/material.dart';
import 'package:my_movie_app/comon/widget/comment_item.dart';
import 'package:my_movie_app/comon/widget/textfield_custom.dart';
import 'package:my_movie_app/core/utils/dialog_rate_movie.dart';
import 'package:my_movie_app/models/comment.dart';
import 'package:my_movie_app/models/movie.dart';
import 'package:my_movie_app/view/movieDetail/movieDetailController.dart';
import 'package:my_movie_app/view/movieDetail/widget/full_screen_widget.dart';
import 'package:video_player/video_player.dart';

class MovieDetailPage extends StatefulWidget {
  const MovieDetailPage({Key? key}) : super(key: key);

  @override
  State<MovieDetailPage> createState() => _MovieDetailPageState();
}

class _MovieDetailPageState extends State<MovieDetailPage> {
  late VideoPlayerController _controller;
  bool _isFullScreen = false;
  bool _showControls = true;
  Timer? _hideControlsTimer;
  final Movie movie = Get.arguments as Movie;
  bool isStart = false;
  List<String> svgImg = [
    "assets/svg/rate4.svg",
    "assets/svg/rate1.svg",
    "assets/svg/rate2.svg",
    "assets/svg/rate3.svg",
    "assets/svg/rate4.svg",
    "assets/svg/rate5.svg",
  ];
  final MovieDetailController movieDetailController =
      Get.put(MovieDetailController());
  void _showImageDialog(BuildContext context) {
    showDialog(
      context: context,
      builder: (BuildContext ct) {
        return DialogRateMovie(
          ctx: context,
          rate: (count) {
            movieDetailController.onRate(count);
          },
        );
      },
    );
  }

  @override
  void initState() {
    super.initState();
    _controller = VideoPlayerController.networkUrl(
      Uri.parse(movie.url),
    )..initialize().then((_) {
        setState(() {});
        isStart = true;
        // _controller.play();
      });
    _startHideControlsTimer();
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  void _startHideControlsTimer() {
    _hideControlsTimer?.cancel();
    _hideControlsTimer = Timer(const Duration(seconds: 3), () {
      setState(() {
        _showControls = false;
      });
    });
  }

  void _toggleFullScreen() {
    setState(() {
      _isFullScreen = !_isFullScreen;
    });

    if (_isFullScreen) {
      Get.to(FullScreenVideoPlayer(controller: _controller));
    } else {
      SystemChrome.setPreferredOrientations([DeviceOrientation.portraitUp]);
      SystemChrome.setEnabledSystemUIMode(SystemUiMode.edgeToEdge);
    }
  }

  void _toggleControls() {
    setState(() {
      _showControls = !_showControls;
    });
    if (_showControls) {
      _startHideControlsTimer();
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(movie.title),
        leading: const BackButton(),
      ),

      body: !isStart
          ? const Center(
              child: CircularProgressIndicator(),
            )
          : SingleChildScrollView(
              child: GestureDetector(
                onTap: _toggleControls,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 16.0),
                      child: Stack(
                        children: [
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              AspectRatio(
                                aspectRatio: _controller.value.aspectRatio,
                                child: VideoPlayer(_controller),
                              ),
                            ],
                          ),
                          Positioned.fill(
                            child: Align(
                              alignment: Alignment.bottomCenter,
                              child: Visibility(
                                  visible: _showControls,
                                  child: _buildControls()),
                            ),
                          ),
                        ],
                      ),
                    ),
                    Container(
                        padding: const EdgeInsets.symmetric(horizontal: 16),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            const SizedBox(
                              height: 16,
                            ),
                            Row(
                              children: [
                                Expanded(
                                  child: Text(
                                    movie.title,
                                    style: const TextStyle(
                                        fontSize: 24,
                                        fontWeight: FontWeight.bold),
                                  ),
                                ),
                                const SizedBox(
                                  width: 8,
                                ),
                                InkWell(
                                    onTap: () {
                                      movieDetailController.isFavourite.value
                                          ? movieDetailController
                                              .removeFavourite(movie)
                                          : movieDetailController
                                              .saveFavourite(movie);
                                    },
                                    child: Obx(()=>InkWell(
                                        child: Icon(
                                          Icons.favorite_outlined,
                                          color: movieDetailController
                                              .isFavourite.value
                                              ? Colors.red
                                              : Colors.grey,
                                        ))),
                                )
                              ],
                            ),
                            const SizedBox(height: 8),
                            Text(
                              '${'director'.tr} : ${movie.director}',
                              style: const TextStyle(fontSize: 16),
                            ),
                            const SizedBox(height: 8),
                            // Text('Đánh giá : ',textAlign: TextAlign.start,),
                            _buildRate(),
                          ],
                        )),
                    Padding(
                      padding: const EdgeInsets.all(16.0),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            '${'year'.tr}: ${movie.year}',
                            style: const TextStyle(fontSize: 16),
                          ),
                          const SizedBox(height: 16),
                          Text(
                            movie.description,
                            style: const TextStyle(fontSize: 16),
                          ),
                          const SizedBox(height: 16),
                          movie.types != null
                              ?  Text(
                                  '${'types'.tr}:',
                                  style: TextStyle(
                                      fontSize: 18,
                                      fontWeight: FontWeight.bold),
                                )
                              : const SizedBox(),
                          movie.types != null
                              ? Wrap(
                                  spacing: 8.0,
                                  children: movie.types!
                                      .map((type) => Chip(label: Text(type)))
                                      .toList(),
                                )
                              : const SizedBox(),
                        ],
                      ),
                    ),
                    _buildComment(),
                    const SizedBox(height: 32),
                  ],
                ),
              ),
            ),
    );
  }

  Widget _buildControls() {
    return Column(
      mainAxisAlignment: MainAxisAlignment.end,
      children: [
        // Thanh tiến trình
        VideoProgressIndicator(
          _controller,
          allowScrubbing: true,
          colors: const VideoProgressColors(
            playedColor: Colors.red,
            bufferedColor: Colors.grey,
            backgroundColor: Colors.black26,
          ),
        ),
        // Nút điều khiển
        Stack(
          alignment: Alignment.centerRight,
          children: [
            Row(
              children: [
                IconButton(
                  icon: const Icon(Icons.replay_10),
                  onPressed: () {
                    final newPosition = _controller.value.position -
                        const Duration(seconds: 10);
                    _controller.seekTo(newPosition > Duration.zero
                        ? newPosition
                        : Duration.zero);
                  },
                ),
                IconButton(
                  icon: Icon(
                    _controller.value.isPlaying
                        ? Icons.pause
                        : Icons.play_arrow,
                  ),
                  onPressed: () {
                    setState(() {
                      if (_controller.value.isPlaying) {
                        _controller.pause();
                      } else {
                        _controller.play();
                      }
                    });
                  },
                ),
                IconButton(
                  icon: const Icon(Icons.forward_10),
                  onPressed: () {
                    final newPosition = _controller.value.position +
                        const Duration(seconds: 10);
                    if (newPosition < _controller.value.duration) {
                      _controller.seekTo(newPosition);
                    }
                  },
                ),
              ],
            ),
            IconButton(
              icon: const Icon(Icons.fullscreen),
              onPressed: () {
                _toggleFullScreen();
              },
            ),
          ],
        ),
      ],
    );
  }

  Widget _buildRate() {
    double height = 16;
    return Column(children: [
      Obx(
        () => InkWell(
          onTap: () => _showImageDialog(context),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              const Text('4.8/5'),
              const SizedBox(
                width: 6,
              ),
              movieDetailController.star.value >= 1
                  ? SvgPicture.asset(
                      "assets/svg/star_rate.svg",
                      height: height,
                    )
                  : SvgPicture.asset(
                      "assets/svg/star_set.svg",
                      height: height,
                    ),
              movieDetailController.star.value >= 2
                  ? SvgPicture.asset(
                      "assets/svg/star_rate.svg",
                      height: height,
                    )
                  : SvgPicture.asset(
                      "assets/svg/star_set.svg",
                      height: height,
                    ),
              movieDetailController.star.value >= 3
                  ? SvgPicture.asset(
                      "assets/svg/star_rate.svg",
                      height: height,
                    )
                  : SvgPicture.asset(
                      "assets/svg/star_set.svg",
                      height: height,
                    ),
              movieDetailController.star.value >= 4
                  ? SvgPicture.asset(
                      "assets/svg/star_rate.svg",
                      height: height,
                    )
                  : SvgPicture.asset(
                      "assets/svg/star_set.svg",
                      height: height,
                    ),
              movieDetailController.star.value >= 5
                  ? SvgPicture.asset(
                      "assets/svg/star_rate.svg",
                      height: height,
                    )
                  : SvgPicture.asset(
                      "assets/svg/start5.svg",
                      height: height,
                    ),
            ],
          ),
        ),
      ),
    ]);
  }

  Widget _buildComment() {
    List<Comment> comments = [
      Comment(
        name: 'Long lúa',
        cmt: 'Bộ phim này rất hay, 5 sao',
      ),
      Comment(
        name: 'Mỳ cay',
        cmt: 'Bộ phim này bình thường',
      ),
      Comment(
        name: 'Long lúa',
        cmt: 'Bộ phim này rất hay, 5 sao',
      ),
      Comment(
        name: 'Long lúa',
        cmt: 'Bộ phim này rất hay, 5 sao',
      )
    ];
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 16),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Text(
            'Bình luận',
            style: TextStyle(fontSize: 18, fontWeight: FontWeight.w700),
          ),
          const SizedBox(
            height: 16,
          ),
          Row(
            children: [
              SvgPicture.asset(
                'assets/svg/avatar.svg',
                height: 30,
              ),
              const SizedBox(
                width: 8,
              ),
              Expanded(
                  child: Container(
                      child: CustomTextField(
                hintText: 'Thêm bình luận...',
                isPassword: false, // Không phải mật khẩu
                textStyle: const TextStyle(fontSize: 14),
                contentPadding:
                    const EdgeInsets.symmetric(vertical: 6, horizontal: 12),
                borderStyle: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(12), // Bo tròn các góc
                  borderSide: const BorderSide(color: Colors.grey),
                ),
                keyboardType: TextInputType.text, // Nhập text bình thường
                controller:
                    TextEditingController(), // Tùy chọn thêm controller nếu cần
              ))),
              const SizedBox(
                width: 8,
              ),
              const Icon(Icons.send_outlined),
            ],
          ),
          const Divider(),
          const SizedBox(
            height: 8,
          ),
          ...comments.map(
            (e) => Column(
              children: [
                CommentItem(
                  name: e.name,
                  cmt: e.cmt,
                ),
                const SizedBox(
                  height: 6,
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
