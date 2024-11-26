import 'package:get/get.dart';
import 'package:flutter_svg/svg.dart';
import 'package:flutter/material.dart';
import 'package:my_movie_app/shareController.dart';

class DialogRateMovie extends StatefulWidget {
  final BuildContext ctx;
  final Function(int star) rate;
  const DialogRateMovie({
    required this.ctx,
    required this.rate,
  });

  @override
  State<DialogRateMovie> createState() => _DialogRateMovieState();
}

class _DialogRateMovieState extends State<DialogRateMovie> {
  int star = 0 ;
  @override
  Widget build(BuildContext context) {

    List<String> svgImg = [
      "assets/svg/rate4.svg",
      "assets/svg/rate1.svg",
      "assets/svg/rate2.svg",
      "assets/svg/rate3.svg",
      "assets/svg/rate4.svg",
      "assets/svg/rate5.svg",
    ];

    return Dialog(
      child: Container(
        padding: const EdgeInsets.all(16),
        child: Column(mainAxisSize: MainAxisSize.min, children: [
        SvgPicture.asset(svgImg[star]),
          const SizedBox(
            height: 8,
          ),
          const Text(
              textAlign: TextAlign.center,
              '',
              style: TextStyle(
                color: Color(0xFF2970E4),
                fontFamily: "ComicSansMS",
                fontSize: 18,
                fontStyle: FontStyle.normal,
                fontWeight: FontWeight.w700,
              ),
            ),

          const SizedBox(
            height: 8,
          ),
          const SizedBox(
            height: 8,
          ),
          Container(
            padding: const EdgeInsets.symmetric(horizontal: 36),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                InkWell(
                  onTap: () {
                    setState(() {
                      star = 1;
                    });
                  },
                  child: star >= 1
                      ? SvgPicture.asset(
                          "assets/svg/star_rate.svg",
                        )
                      : SvgPicture.asset(
                          "assets/svg/star_set.svg",
                        ),
                ),
                InkWell(
                  onTap: () {
                    setState(() {
                      star = 2;
                    });
                  },
                  child: star >= 2
                      ? SvgPicture.asset(
                          "assets/svg/star_rate.svg",
                        )
                      : SvgPicture.asset(
                          "assets/svg/star_set.svg",
                        ),
                ),
                InkWell(
                  onTap: () {
                    setState(() {
                      star = 3;
                    });
                  },
                  child: star >= 3
                      ? SvgPicture.asset(
                          "assets/svg/star_rate.svg",
                        )
                      : SvgPicture.asset(
                          "assets/svg/star_set.svg",
                        ),
                ),
                InkWell(
                  onTap: () {
                    setState(() {
                      star = 4;
                    });
                  },
                  child: star >= 4
                      ? SvgPicture.asset(
                          "assets/svg/star_rate.svg",
                        )
                      : SvgPicture.asset(
                          "assets/svg/star_set.svg",
                        ),
                ),
                InkWell(
                  onTap: () {
                    setState(() {
                      star = 5;
                    });
                  },
                  child: star == 5
                      ? SvgPicture.asset(
                          "assets/svg/star_rate.svg",
                        )
                      : SvgPicture.asset(
                          "assets/svg/start5.svg",
                        ),
                ),
              ],
            ),
          ),
          const SizedBox(
            height: 8,
          ),
          InkWell(
            onTap: () {
              widget.rate(star );
              Get.back();
            },
            child: Container(
                padding:
                    const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
                width: MediaQuery.of(context).size.width / 3,
                decoration: const BoxDecoration(
                    borderRadius: BorderRadius.all(Radius.circular(24)),
                    color: Color(0xFF2970E4)),
                child:  Text(
                  textAlign: TextAlign.center,
                  'rate'.tr,
                  style: TextStyle(
                    color: Colors.white,
                    fontFamily: "ComicSansMS",
                    fontSize: 20,
                    fontStyle: FontStyle.normal,
                    fontWeight: FontWeight.w600,
                  ),
                )),
          ),
          const SizedBox(
            height: 8,
          ),
          InkWell(
            onTap: () => Get.back(),
            child:  Text(
              'Maybe later'.tr,
              style: TextStyle(
                color: Color(0xFF4C8DF8),
                fontFamily: "ComicSansMS",
                fontSize: 14,
                fontStyle: FontStyle.normal,
                fontWeight: FontWeight.w300,
              ),
            ),
          ),
        ]),
      ),
    );
  }
}
