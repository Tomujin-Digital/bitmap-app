import 'package:flutter/material.dart';
import 'package:get/state_manager.dart';

class ContentCard extends GetView {
  const ContentCard({super.key, required this.title, this.subtitle});
  final String title;
  final String? subtitle;
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {},
      child: SizedBox(
        width: 335,
        height: 174,
        child: Card(
          clipBehavior: Clip.antiAliasWithSaveLayer,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(10.0),
          ),
          elevation: 5,
          margin: const EdgeInsets.all(10),
          child: Column(
            children: [
              SizedBox(
                width: 350,
                height: 110,
                child: Image.network(
                  'https://images.pexels.com/photos/949587/pexels-photo-949587.jpeg?auto=compress&cs=tinysrgb&dpr=1&w=500',
                  fit: BoxFit.fill,
                ),
              ),
              const SizedBox(
                height: 5,
              ),
              Column(children: [Text(title), Text(subtitle ?? '')])
            ],
          ),
        ),
      ),
    );
  }
}
