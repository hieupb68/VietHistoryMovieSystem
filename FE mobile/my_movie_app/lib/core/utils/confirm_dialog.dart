import 'package:get/get.dart';
import 'package:flutter/material.dart';

class ConfirmDialog extends StatelessWidget {
  String? title;
  String? message;
  String? confirm;
  String? cancel;
  Function confirmFunc;
  ConfirmDialog(
      {super.key,
      this.title,
      this.message,
      this.cancel,
      this.confirm,
      required this.confirmFunc});

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      backgroundColor: Colors.white,
      title: Column(
        children: [
          Text(
            textAlign:TextAlign.center,
            title ?? "",
            style: const TextStyle(
              color: Color(0xFF1D1D1D),
              fontFamily: "ComicSansMS",
              fontSize: 22,
              fontStyle: FontStyle.normal,
              fontWeight: FontWeight.w700,
            ),
          ),
          Divider()
        ],
      ),
      content: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Text(
            message ?? "",
            style: const TextStyle(
              color: Color(0xFF1D1D1D),
              fontFamily: "ComicSansMS",
              fontSize: 16,
              fontStyle: FontStyle.normal,
              fontWeight: FontWeight.w300,
            ),
          ),
        ],
      ),
      actions: [
        Container(
          padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 8),
          child: Row(
            children: [
              Expanded(
                child: InkWell(
                  onTap: () => Get.back(),
                  child: Container(
                    width: MediaQuery.of(context).size.width / 3,
                    padding:
                        const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
                    decoration: BoxDecoration(
                        borderRadius: const BorderRadius.all(Radius.circular(24)),
                        color: Colors.transparent,
                        border: Border.all(color: const Color(0xFF2970E4),width: 1)),
                    child: Text(
                      cancel ?? "",
                      textAlign: TextAlign.center,
                      style: const TextStyle(
                        color: Color(0xFF1D1D1D),
                        fontFamily: "ComicSansMS",
                        fontSize: 16,
                        fontStyle: FontStyle.normal,
                        fontWeight: FontWeight.w700,
                      ),
                    ),
                  ),
                ),
              ),
              const SizedBox(width: 8),
              Expanded(
                child: InkWell(
                  onTap: (){
                    confirmFunc();
    
                  },
                  child: Container(
                    width: MediaQuery.of(context).size.width / 3,
                    padding:
                        const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
                    decoration: const BoxDecoration(
                        borderRadius: BorderRadius.all(Radius.circular(24)),
                        color: Color(0xFF2970E4)),
                    child: Text(confirm ?? "", textAlign: TextAlign.center,
                    style: const TextStyle(
                        color: Colors.white,
                        fontFamily: "ComicSansMS",
                        fontSize: 16,
                        fontStyle: FontStyle.normal,
                        fontWeight: FontWeight.w700,
                      ),),
                  ),
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }
}
