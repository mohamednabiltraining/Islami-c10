import 'package:flutter/material.dart';

class VerseItem extends StatelessWidget {
  String content;

  VerseItem(this.content, {super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      alignment: Alignment.center,
      child: Text(
        content,
        textAlign: TextAlign.center,
        style: TextStyle(
          fontSize: 20,
        ),
      ),
      padding: EdgeInsets.symmetric(vertical: 8),
    );
  }
}
