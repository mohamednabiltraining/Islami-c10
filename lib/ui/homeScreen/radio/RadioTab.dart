import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class RadioTab extends StatelessWidget {
  const RadioTab({super.key});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Image.asset('assets/images/img_radio.png'),
          Text(
            'إذاعة القرآن الكريم',
            style: TextStyle(
                fontFamily: GoogleFonts.elMessiri().fontFamily,
                fontSize: 25,
                fontWeight: FontWeight.w400),
          ),
          SizedBox(
            height: 20,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              GestureDetector(
                onTap: () {}, // Image tapped
                child: Image.asset(
                  'assets/images/ic_previous.png',
                  fit: BoxFit.cover, // Fixes border issues
                ),
              ),
              GestureDetector(
                onTap: () {}, // Image tapped
                child: Image.asset(
                  'assets/images/ic_play.png',
                  fit: BoxFit.cover, // Fixes border issues
                ),
              ),
              GestureDetector(
                onTap: () {}, // Image tapped
                child: Image.asset(
                  'assets/images/ic_next.png',
                  fit: BoxFit.cover, // Fixes border issues
                ),
              ),
            ],
          )
        ],
      ),
    );
  }
}
