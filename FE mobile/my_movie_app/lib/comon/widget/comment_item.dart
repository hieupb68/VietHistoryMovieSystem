import 'package:flutter/cupertino.dart';
import 'package:flutter_svg/svg.dart';

class CommentItem extends StatelessWidget {
  final String? name;
  final String? cmt;
  final int rate;
  const CommentItem({super.key,this.name,this.cmt,required this.rate});

  @override
  Widget build(BuildContext context) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        SvgPicture.asset('assets/svg/avatar.svg',height: 30,),
        const SizedBox(width: 8,),
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              children: [
                Text(name??'',style: const TextStyle(
                    fontSize: 16, fontWeight: FontWeight.w700),),
                SizedBox(width: 16,),
                _buildRate(rate),
              ],
            ),
            Text(cmt??'',style: const TextStyle(
                fontSize: 14, fontWeight: FontWeight.w400),),
          ],
        )
      ],
    );
  }

  Widget _buildRate(int rate) {
    double height = 16;
    return Column(children: [
       Row(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              //  Text('${rate.toString()}/5'),
              // const SizedBox(
              //   width: 6,
              // ),
              rate >= 1
                  ? SvgPicture.asset(
                "assets/svg/star_rate.svg",
                height: height,
              )
                  : SvgPicture.asset(
                "assets/svg/star_set.svg",
                height: height,
              ),
              rate >= 2
                  ? SvgPicture.asset(
                "assets/svg/star_rate.svg",
                height: height,
              )
                  : SvgPicture.asset(
                "assets/svg/star_set.svg",
                height: height,
              ),
              rate >= 3
                  ? SvgPicture.asset(
                "assets/svg/star_rate.svg",
                height: height,
              )
                  : SvgPicture.asset(
                "assets/svg/star_set.svg",
                height: height,
              ),
              rate >= 4
                  ? SvgPicture.asset(
                "assets/svg/star_rate.svg",
                height: height,
              )
                  : SvgPicture.asset(
                "assets/svg/star_set.svg",
                height: height,
              ),
              rate >= 5
                  ? SvgPicture.asset(
                "assets/svg/star_rate.svg",
                height: height,
              )
                  : SvgPicture.asset(
                "assets/svg/start5.svg",
                height: height,
              ),
            ],),
          ]);
  }
}
