import 'dart:math';

import 'package:flutter/material.dart';
import 'package:islami_c10/ui/homeScreen/tasbeh/TextItem.dart';

class TasbehTab extends StatefulWidget {
  @override
  State<TasbehTab> createState() => _TasbehTabState();
}

class _TasbehTabState extends State<TasbehTab> {
  int numberOfTasbeh = 0, index = 0;

  List<String> Tasbeh = [
    'سبحان الله',
    'الحمد لله',
    'الله اكبر',
    'لا حول ولا قوة الا بالله',
    'لا اله الا الله'
  ];

  double rotationAngle = 0.0;
  void rotateImage() {
    setState(() {
      rotationAngle += 30;
    });
  }

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Stack(alignment: Alignment.topCenter, children: [
            Container(
                margin: EdgeInsets.only(top: 5),
                child: Image.asset('assets/images/head of seb7a.png')),
            Container(
              margin: EdgeInsets.only(top: 80),
              child: Transform.rotate(
                  angle: rotationAngle * (pi / 180),
                  child: Image.asset('assets/images/body of seb7a.png')),
            )
          ]),
           Padding(
            padding: EdgeInsets.all(25),
            child: Text(
              'عدد التسبيحات',
              style: Theme.of(context).textTheme.titleMedium!.copyWith(fontWeight: FontWeight.bold),
              textAlign: TextAlign.center,
            ),
          ),
          Padding(
              padding: const EdgeInsets.only(bottom: 25),
              child: TextItem(
                text: '$numberOfTasbeh',
                Ratio: 0.4,
              )),
          InkWell(
              onTap: () {
                rotateImage();
                numberOfTasbeh++;
                if (numberOfTasbeh == 34) {
                  numberOfTasbeh = 0;
                  index++;

                  if (index == Tasbeh.length) index = 0;
                }
                setState(() {});
              },
              child: TextItem(
                text: '${Tasbeh[index]}',
                Ratio: 0.25,
              ))
        ],
      ),
    );
  }
}
