import 'package:bitmap/constants.dart';
import 'package:bitmap/fee_page.dart';
import 'package:flutter/material.dart';

class UserPage extends StatelessWidget {
  const UserPage({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          title: const Text('0x2388891'),
          backgroundColor: kPrimaryColor,
          elevation: 0,
        ),
        body: Container(
          decoration: const BoxDecoration(
            color: kPrimaryColor,
          ),
          child: Center(
            child: Column(children: [
              CircleAvatar(
                  maxRadius: 50.0,
                  minRadius: 50.0,
                  backgroundColor: Colors.white,
                  backgroundImage: Image.network(
                          'https://avatars.dicebear.com/api/bottts/0x2388891.png')
                      .image),
              const SizedBox(height: 20),
              const Text('Chingun Undrakh',
                  style: TextStyle(fontSize: 20, color: Colors.white)),
              const SizedBox(height: 20),
              Expanded(
                child: Container(
                  width: double.infinity,
                  decoration: const BoxDecoration(
                    color: kPrimaryBackgroundColor,
                    borderRadius: BorderRadius.only(
                        topLeft: Radius.circular(20),
                        topRight: Radius.circular(20)),
                  ),
                  child: const FeePage(),
                ),
              )
            ]),
          ),
        ),
      ),
    );
  }
}
