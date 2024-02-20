import 'package:flutter/material.dart';

class TasbehTab extends StatefulWidget {
  TasbehTab({super.key});

  @override
  State<TasbehTab> createState() => _TasbehTabState();
}

class _TasbehTabState extends State<TasbehTab> {
  int counter = 0;
  double angle = 0;
  int index = 0;

  List<String> tasbeh = ['سبحان الله', 'استغفر الله', 'الحمد لله'];

  void tasbehFun() {
    if (counter ==33) {
      counter = 0;
      if (index == tasbeh.length - 1) {
        index = 0;
      } else {
        index++;
      }
    } else {
      counter++;
      angle += 270;
    }

    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Center(
          child: Expanded(
            flex: 1,
            child: Stack(
              alignment: Alignment.topCenter,
              children: [
                Image.asset('assets/images/head_sebha_logo.png'),
                Container(
                  margin: EdgeInsets.only(top: 75),
                  child: Transform.rotate(
                    angle: angle,
                    child: Image.asset('assets/images/body_sebha_logo.png'),
                  ),
                ),
              ],
            ),
          ),
        ),
        Expanded(

          child: Container(
            child: Column(
              children: [
                Spacer(),
                Text(
                  'عدد التسبيحات',
                  style: TextStyle(
                      color: Colors.black,
                      fontSize: 30,
                      fontWeight: FontWeight.bold),
                ),

                Spacer(),
                Container(
                  height: 80,
                  width: 100,
                  //color: Theme.of(context).primaryColor,
                  decoration: BoxDecoration(
                      color: Theme.of(context).primaryColor,
                      borderRadius: BorderRadius.circular(25)),
                  child: Center(
                    child: Text(
                      '$counter',
                      style: TextStyle(
                          color: Colors.black,
                          fontSize: 30,
                          fontWeight: FontWeight.bold),
                    ),
                  ),
                ),
                Spacer(),
                ElevatedButton(
                    style: ElevatedButton.styleFrom(
                        backgroundColor: Theme.of(context).primaryColor),
                    onPressed: () {
                      tasbehFun();
                    },
                    child: Text(
                      '${tasbeh[index]}',
                      style: TextStyle(
                          color: Colors.black,
                          fontWeight: FontWeight.bold,
                          fontSize: 30),
                    )),
                Spacer()
              ],
            ),
          ),
        ),

      ],
    );
  }
}
