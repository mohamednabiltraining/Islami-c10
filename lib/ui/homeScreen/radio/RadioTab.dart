import 'package:flutter/material.dart';

class RadioTab extends StatelessWidget {
  const RadioTab({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Expanded(
          flex: 3,
          child: Image.asset(
            'assets/images/radio_image.png',
          ),
        ),
        Expanded(
          flex: 2,
          child: Column(
            children: [
              Text(
                'إذاعة القرآن الكريم',
                style: Theme.of(context).textTheme.titleMedium,
              ),
              const SizedBox(
                height: 40,
              ),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 30.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Icon(
                      Icons.skip_previous,
                      size: 56,
                      color: Theme.of(context).primaryColor,
                    ),
                    Icon(
                      Icons.play_arrow_sharp,
                      size: 56,
                      color: Theme.of(context).primaryColor,
                    ),
                    Icon(
                      Icons.skip_next_sharp,
                      size: 56,
                      color: Theme.of(context).primaryColor,
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }
}
