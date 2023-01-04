import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../constants.dart';

class FeePage extends StatelessWidget {
  const FeePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Төлбөрийн мэдээлэл'),
        backgroundColor: kPrimaryColor,
      ),
      body: Container(
        decoration: const BoxDecoration(
          color: Colors.transparent,
          borderRadius: BorderRadius.only(
            topLeft: Radius.circular(20),
            topRight: Radius.circular(20),
          ),
        ),
        child: ListView.builder(
          itemCount: 10,
          itemBuilder: (context, int index) {
            return Container(
              padding: const EdgeInsets.all(20),
              child: Column(children: [
                Container(
                  decoration: const BoxDecoration(
                      color: Colors.white,
                      borderRadius:
                          BorderRadius.vertical(top: Radius.circular(20)),
                      boxShadow: [
                        BoxShadow(color: kPrimaryColor, blurRadius: 2.0),
                      ]),
                  child: Column(
                    children: const [
                      FeeDetailRow(title: "Төлбөрийн дугаар:", value: "1234"),
                      SizedBox(
                        height: 10,
                        child: Divider(
                          thickness: 1.0,
                        ),
                      ),
                      FeeDetailRow(
                          title: "Тайлбар:", value: "Сургалтын төлбөр 1-р сар"),
                      FeeDetailRow(title: "Төлөв:", value: "Төлөгдөөгүй"),
                      SizedBox(
                        height: 10,
                        child: Divider(
                          thickness: 1.0,
                        ),
                      ),
                      FeeDetailRow(title: "Нийт:", value: "1000₮"),
                    ],
                  ),
                ),
                GestureDetector(
                  onTap: () {
                    Get.back();
                  },
                  child: Container(
                      margin: const EdgeInsets.only(bottom: 10),
                      width: double.infinity,
                      height: 40,
                      decoration: const BoxDecoration(
                          gradient: LinearGradient(
                              colors: [kPrimaryColor, kPrimaryColor]),
                          borderRadius: BorderRadius.only(
                              bottomLeft: Radius.circular(20),
                              bottomRight: Radius.circular(20))),
                      child: Center(
                          child: Text(
                        "Төлөх",
                        style: Theme.of(context)
                            .textTheme
                            .subtitle2!
                            .copyWith(fontSize: 14.0, color: Colors.white),
                      ))),
                )
              ]),
            );
          },
        ),
      ),
    );
  }
}

class FeeDetailRow extends StatelessWidget {
  const FeeDetailRow({super.key, required this.title, required this.value});
  final String title;
  final String value;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(10),
      color: Colors.transparent,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(
            title,
            style: Theme.of(context)
                .textTheme
                .subtitle2!
                .copyWith(fontSize: 14.0, color: Colors.black),
          ),
          Text(
            value,
            style: Theme.of(context)
                .textTheme
                .subtitle2!
                .copyWith(fontSize: 14.0, color: Colors.black),
          )
        ],
      ),
    );
  }
}
