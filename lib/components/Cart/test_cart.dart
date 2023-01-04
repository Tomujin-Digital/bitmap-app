import 'package:flutter/material.dart';

class TestCard extends StatelessWidget {
  const TestCard({super.key});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        // Get.to(
        //   arguments: indexCard,
        //   transition: Transition.downToUp,
        //   // () => IndexCardDetailView(),
        //   // binding: IndexCardDetailBinding(),
        // );
      },
      child: Card(
        clipBehavior: Clip.antiAlias,
        child: Column(
          children: [
            Image.network(
              'https://images.pexels.com/photos/949587/pexels-photo-949587.jpeg?auto=compress&cs=tinysrgb&dpr=1&w=500',
              height: 150,
              width: double.infinity,
              fit: BoxFit.cover,
            ),
            ListTile(
              title: Text(
                'Card title 1',
                style: Theme.of(context).textTheme.titleLarge,
              ),
              subtitle: Text(
                'card subtitle 1',
                style: Theme.of(context).textTheme.bodySmall,
              ),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16.0),
              child: Row(
                children: [
                  Expanded(
                    child: Padding(
                      padding: const EdgeInsets.only(bottom: 24.0),
                      child: ClipRRect(
                        borderRadius: BorderRadius.circular(16.0),
                        child: LinearProgressIndicator(
                          value: 10,
                          valueColor: AlwaysStoppedAnimation<Color>(
                            Theme.of(context).colorScheme.secondary,
                          ),
                          backgroundColor:
                              Theme.of(context).colorScheme.background,
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
