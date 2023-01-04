import 'package:flutter/material.dart';
import 'package:get/get.dart';

class ContentCard extends GetView {
  const ContentCard(
      {super.key, required this.title, this.imageSrc, this.subtitle});
  final String title;
  final String? subtitle;
  final String? imageSrc;
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Get.snackbar(title, subtitle ?? '', colorText: Colors.white);
      },
      child: SizedBox(
        width: 335,
        height: 150,
        child: Card(
          clipBehavior: Clip.antiAliasWithSaveLayer,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(10.0),
          ),
          elevation: 5,
          margin: const EdgeInsets.all(10),
          child: Stack(
            children: [
              SizedBox(
                width: 350,
                height: 130,
                child: Image.network(
                  imageSrc ?? 'https://picsum.photos/350/130',
                  fit: BoxFit.cover,
                ),
              ),
              Container(
                width: 350,
                height: 130,
                decoration: const BoxDecoration(
                  gradient: LinearGradient(
                    begin: Alignment.topLeft,
                    end: Alignment.bottomRight,
                    colors: [
                      Color(0x9A000000),
                      Color(0x02FFFFFF),
                    ],
                  ),
                ),
              ),
              Positioned(
                  left: 10,
                  bottom: 10,
                  child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          title,
                          style: const TextStyle(
                              color: Colors.white,
                              fontSize: 20,
                              fontWeight: FontWeight.bold),
                        ),
                        Text(
                          subtitle ?? '',
                          style:
                              TextStyle(color: Colors.white.withOpacity(0.6)),
                        )
                      ]))
            ],
          ),
        ),
      ),
    );
  }
}
