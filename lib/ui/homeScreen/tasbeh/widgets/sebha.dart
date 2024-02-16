import 'package:flutter/material.dart';

class SebhaStack extends StatelessWidget {
  final double _turns;

  const SebhaStack({super.key, required double turns}) : _turns = turns;

  @override
  Widget build(BuildContext context) {
    return Stack(
      alignment: Alignment.topCenter,
      children: [
        Positioned(
          height: 200,
          width: 200,
          bottom: 15,
          child: AnimatedRotation(
              turns: _turns,
              duration: const Duration(
                milliseconds: 350,
              ),
              child: SizedBox(
                child: Image.asset(
                  "assets/images/body_sebha_logo.png",
                ),
              )),
        ),
        Positioned(
          height: 100,
          width: 100,
          top: 9,
          left: 120,
          child: Image.asset(
            "assets/images/head_sebha_logo.png",
          ),
        ),
      ],
    );
  }
}
