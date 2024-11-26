import 'package:get/get.dart';
import 'package:flutter_svg/svg.dart';
import 'package:flutter/material.dart';
import 'package:my_movie_app/shareController.dart';

class DialogRate extends GetView {
  BuildContext ctx;
  ShareController shareController = Get.find();

  DialogRate({
    super.key,
    required this.ctx,
  });

  @override
  Widget build(BuildContext context) {
    List<String> label = [
      "How do you rate our App?",
      "Oh, no!",
      "Oh, no!",
      "Oh, no!",
      "We like you too!",
      "We like you too!"
    ];
    List<String> suggest = [
      "We'd greatly appreciate if you can rate",
      "Please leave us some feedback",
      "Please leave us some feedback",
      "Please leave us some feedback",
      "Thank for your feedback",
      "Thank for your feedback"
    ];
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
        child: Column(
          mainAxisSize: MainAxisSize.min, 
        children: [
          Obx(()=> SvgPicture.asset(svgImg[shareController.star.value])),
          const SizedBox(
            height: 8,
          ),
          Obx(
            ()=> Text(
              textAlign: TextAlign.center,
              label[shareController.star.value],
              style: const TextStyle(
                color: Color(0xFF2970E4),
                fontFamily: "ComicSansMS",
                fontSize: 18,
                fontStyle: FontStyle.normal,
                fontWeight: FontWeight.w700,
              ),
            ),
          ),
          const SizedBox(
            height: 8,
          ),
          Obx(
            ()=> Text(
              suggest[shareController.star.value],
              textAlign: TextAlign.center,
              style: const TextStyle(
                
                color: Color(0xFF4C8DF8),
                fontFamily: "ComicSansMS",
                fontSize: 16,
                fontStyle: FontStyle.normal,
                fontWeight: FontWeight.w300,
              ),
            ),
          ),
          const SizedBox(
            height: 8,
          ),
          Obx(
            () => Container(
              padding: const EdgeInsets.symmetric(horizontal: 36),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  InkWell(
                    onTap: () => shareController.changedStar(1),
                    child: shareController.star.value >= 1
                        ? SvgPicture.asset(
                            "assets/svg/star_rate.svg",
                          )
                        : SvgPicture.asset(
                            "assets/svg/star_set.svg",
                          ),
                  ),
                  InkWell(
                    onTap: () => shareController.changedStar(2),
                    child: shareController.star.value >= 2
                        ? SvgPicture.asset(
                            "assets/svg/star_rate.svg",
                          )
                        : SvgPicture.asset(
                            "assets/svg/star_set.svg",
                          ),
                  ),
                  InkWell(
                    onTap: () => shareController.changedStar(3),
                    child: shareController.star.value >= 3
                        ? SvgPicture.asset(
                            "assets/svg/star_rate.svg",
                          )
                        : SvgPicture.asset(
                            "assets/svg/star_set.svg",
                          ),
                  ),
                  InkWell(
                    onTap: () => shareController.changedStar(4),
                    child: shareController.star.value >= 4
                        ? SvgPicture.asset(
                            "assets/svg/star_rate.svg",
                          )
                        : SvgPicture.asset(
                            "assets/svg/star_set.svg",
                          ),
                  ),
                  InkWell(
                    onTap: () => shareController.changedStar(5),
                    child: shareController.star.value >= 5
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
          ),
          const SizedBox(
            height: 8,
          ),
          InkWell(
          onTap: ()=>Get.back(),
            child: Container(
                padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
                width: MediaQuery.of(context).size.width / 3,
                decoration: const BoxDecoration(
                    borderRadius: BorderRadius.all(Radius.circular(24)),
                    color: Color(0xFF2970E4)),
                child: const Text(
                  textAlign: TextAlign.center,
                  "RATE",
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
            onTap: ()=>Get.back(),
            child: Container(
                child: const Text(
              "Maybe later",
              style: TextStyle(
                color: Color(0xFF4C8DF8),
                fontFamily: "ComicSansMS",
                fontSize: 14,
                fontStyle: FontStyle.normal,
                fontWeight: FontWeight.w300,
              ),
            )),
          ),
        ]),
      ),
    );
  }
}
