import 'package:flutter/material.dart';

class MovieItem extends StatelessWidget {
  final String imageUrl;
  final String name;
  final int? year;
  final Function onTap;
  const MovieItem(
      {super.key,
      required this.imageUrl,
      required this.name,
      this.year,
      required this.onTap});

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () => onTap(),
      child: Container(
        alignment: Alignment.center,
        width: 180,
        height: 250,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            ClipRRect(
                borderRadius: BorderRadius.circular(12),
                child: Stack(
                  children: [
                    Image.network(
                      imageUrl,
                      fit: BoxFit.fill,
                      height: 212,
                      width: 170,
                      loadingBuilder: (context, child, loadingProgress) {
                        if (loadingProgress == null) return child;
                        return const Center(child: CircularProgressIndicator());
                      },
                      errorBuilder: (context, error, stackTrace) {
                        return Image.asset(
                          'assets/image/no_image.png',
                          fit: BoxFit.fill,
                          height: 212,
                          width: 170,
                        );
                      },
                    ),
                    // Overlay màu (Gradient)
                    Positioned.fill(
                      child: Container(
                        decoration: BoxDecoration(
                          gradient: LinearGradient(
                            begin: Alignment.bottomCenter,
                            end: Alignment.topCenter,
                            colors: [
                              Colors.black.withOpacity(0.7), // Đậm ở dưới
                              Colors.transparent, // Trong suốt ở trên
                            ],
                          ),
                        ),
                      ),
                    ),
                    // Tiêu đề
                    Positioned(
                      bottom: 10,
                      left: 10,
                      right: 10,
                      child: Text(
                        name,
                        style: const TextStyle(
                          color: Colors.white,
                          fontSize: 18,
                          fontWeight: FontWeight.bold,
                          shadows: [
                            Shadow(
                              offset: Offset(0, 1),
                              blurRadius: 4,
                              color: Colors.black,
                            ),
                          ],
                        ),
                      ),
                    ),
                  ],
                )),
          ],
        ),
      ),
    );
  }
}
