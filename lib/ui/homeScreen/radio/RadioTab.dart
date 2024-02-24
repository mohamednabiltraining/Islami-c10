import 'package:flutter/material.dart';

class RadioTab extends StatelessWidget {
  const RadioTab({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Image.asset('assets/images/radioLogo.png'),
        Padding(
          padding: const EdgeInsets.all(50),
          child: Text(
            'اذاعه القرأن الكريم ',
            style: Theme.of(context).textTheme.titleMedium,
          ),
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            IconButton(
              onPressed: () {},
              icon: Icon(Icons.skip_previous),
            ),
            IconButton(
              onPressed: () {},
              icon: Icon(Icons.play_arrow_rounded),
            ),
            IconButton(
              onPressed: () {},
              icon: Icon(Icons.skip_next),
            ),
          ],
        )
      ],
    );
  }
}
