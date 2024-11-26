import 'package:flutter/cupertino.dart';
import 'package:flutter_svg/svg.dart';

class CommentItem extends StatelessWidget {
  final String? name;
  final String? cmt;
  const CommentItem({super.key,this.name,this.cmt});

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
            Text(name??'',style: const TextStyle(
                fontSize: 16, fontWeight: FontWeight.w700),),
            Text(cmt??'',style: const TextStyle(
                fontSize: 14, fontWeight: FontWeight.w400),),
          ],
        )
      ],
    );
  }
}
