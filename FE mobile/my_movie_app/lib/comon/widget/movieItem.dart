import 'package:flutter/material.dart';

class MovieItem extends StatelessWidget {
  final String imageUrl;
  final String name;
  final int? year;
  final Function onTap;
  const MovieItem({super.key, required this.imageUrl,required this.name,  this.year,required this.onTap });

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: ()=> onTap(),
      child: Container(
        alignment: Alignment.center,
        width: 180,
        height: 300,

        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            ClipRRect(
              borderRadius:  BorderRadius.circular(12),
              child: Image.network(imageUrl,fit: BoxFit.fill,height:212 ,width:170,)),
            Text(name,style: TextStyle(fontSize: 16,fontWeight: FontWeight.bold),maxLines: 2,),

    
          ],
        ),
      ),
    );
  }
}