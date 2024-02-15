import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:vibration/vibration.dart';

class TasbehTab extends StatefulWidget {

  TasbehTab({super.key});


  @override
  State<TasbehTab> createState() => _TasbehTabState();
}


class _TasbehTabState extends State<TasbehTab> {

  int numberOfTasbeh = 0;
  String TextOfTasbeh = '';
  bool tasbehVisiable = false;
  int counter = 0;
  int index = 0;

  List<String> listOfAzkar = ['سبحان الله', 'الحمد لله', 'الله اكبر'];

  @override
  Widget build(BuildContext context) {
    if (index > listOfAzkar.length - 1) {
      index = 0;
    }
    return SingleChildScrollView(
      child: Column(
        children: [
          GestureDetector(
            onTap: () {
              setState(() {
                startSebha();
              });
            },
            child: Stack(
              alignment: Alignment.topCenter,
              children: [
                AspectRatio(
                  aspectRatio: 1,
                  child: RotatedBox(
                    quarterTurns: numberOfTasbeh,
                    child: Image.asset('assets/images/bodyofseb7a.png'),
                  ),
                ),
                ClipRRect(
                  child: Image.asset('assets/images/headofseb7a.png',
                      height: 90, width: 90),
                ),
              ],
            ),
          ),
          Text(
            'عدد التسبيحات',
            style: TextStyle(
                fontSize: 25, fontFamily: GoogleFonts.elMessiri().fontFamily),
          ),
          Container(
            margin: EdgeInsets.symmetric(vertical: 10),
            decoration: BoxDecoration(
              color: Theme.of(context).colorScheme.primary,
              borderRadius: BorderRadius.circular(20),
            ),
            padding: EdgeInsets.all(20),
            child: Text(
              '$counter',
              style: TextStyle(
                  fontSize: 25, fontFamily: GoogleFonts.inter().fontFamily),
            ),
          ),
          Visibility(
            visible: tasbehVisiable,
            child: Container(
              decoration: BoxDecoration(
                color: Theme.of(context).colorScheme.primary,
                borderRadius: BorderRadius.circular(50),
              ),
              padding: EdgeInsets.symmetric(horizontal: 25, vertical: 5),
              child: Text(
                listOfAzkar[index],
                style: TextStyle(
                    color: Colors.white,
                    fontSize: 25,
                    fontFamily: GoogleFonts.inter().fontFamily),
              ),
            ),
          ),
        ],
      ),
    );
  }

  void startSebha() {
    Vibration.vibrate(duration: 100);

    tasbehVisiable = true;

    setState(() {
      numberOfTasbeh++;
      if (counter >= 33) {
        counter = 0;
        index++;
      }
      counter++;
    });
  }
}

