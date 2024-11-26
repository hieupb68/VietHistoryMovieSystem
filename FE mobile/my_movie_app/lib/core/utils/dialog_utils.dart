import 'package:get/get.dart';
import '../../appRouter.dart';
import 'package:flutter/material.dart';
import 'package:get/get_core/src/get_main.dart';


class CenteredDialog extends StatelessWidget {
  BuildContext cxt;
  CenteredDialog({required this.cxt});
  @override
  Widget build(BuildContext context) {
    return ClipRRect(
      borderRadius: BorderRadius.circular(15.0),
      child: Container(
        padding: const EdgeInsets.all(24),
        child: Center(
          child: Container(
            decoration: const BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.all(Radius.circular(24))),
            padding: const EdgeInsets.all(20),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                // Your content goes here
                Stack(
                  alignment: Alignment.centerRight,
                  children: [
                    Container(
                      width: double.infinity,
                      alignment: Alignment.center,
                      child: const Text(
                        "Select Tutorial For",
                        textAlign: TextAlign.center,
                        style: TextStyle(
                            color: Color(0xFF2970E4),
                            fontFamily: "ComicSansMS",
                            fontSize: 20,
                            fontStyle: FontStyle.normal,
                            fontWeight: FontWeight.w500,
                            decoration: TextDecoration.none),
                      ),
                    ),
                     IconButton(
                     icon: Icon(Icons.close_rounded),
                      color: Colors.blueAccent,
                      iconSize:26,
                      onPressed: () {
                        Navigator.of(context).pop();

                      },),
                  ],
                ),
                const SizedBox(height: 20),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    TextButton(
                      onPressed: () {},
                      child: Column(
                        children: [
                          Image.asset(
                            "assets/images/tutorial_sketch.png",
                            width: MediaQuery.of(context).size.width *2/7,
                          ),
                          const SizedBox(
                            height: 12,
                          ),
                          const Text(
                            "SKETCH",
                            style: TextStyle(
                              color: Color(0xFF2970E4),
                              fontFamily: "ComicSansMS",
                              fontSize: 22,
                              fontStyle: FontStyle.normal,
                              fontWeight: FontWeight.w500,
                            ),
                          )
                        ],
                      ),
                    ),
                    TextButton(
                      onPressed: (){

                      },
                      child: Column(
                        children: [
                          Image.asset(
                            "assets/images/tutorial_trace.png",
                            width: MediaQuery.of(context).size.width *2/7,
                          ),
                          const SizedBox(
                            height: 12,
                          ),
                          const Text(
                            "TRACE",
                            style: TextStyle(
                              color: Color(0xFF2970E4),
                              fontFamily: "ComicSansMS",
                              fontSize: 22,
                              fontStyle: FontStyle.normal,
                              fontWeight: FontWeight.w500,
                            ),
                          )
                        ],
                      ),
                    )
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
