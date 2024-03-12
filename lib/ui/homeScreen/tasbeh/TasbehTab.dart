import 'package:flutter/material.dart';

class SebhaScreen extends StatefulWidget {
  @override
  State<SebhaScreen> createState() => _SebhaScreenState();
}

class _SebhaScreenState extends State<SebhaScreen> {
  double angel = 180;
  List<String> text = [
    "سبحان الله",
    "الحمد لله",
    "الله اكبر",
    "لاحول  ولا قوة الا بالله"
  ];
  int TasbehNumber = 0;
  int counter=0;
  @override
  Widget build(BuildContext context) {

    return Scaffold(
      backgroundColor: Colors.transparent,
      body: Column(
        children: [
          Stack(
            alignment: Alignment.topCenter,
            children: [
              Padding(
                padding: const EdgeInsets.all(30.0),
                child: Center(
                    child: Image(
                      image: AssetImage("assets/images/head_sebha.png"),
                      width: 60,
                    )),
              ),
              Padding(
                padding: const EdgeInsets.only(top: 90.0, bottom: 20),
                child: Center(
                    child: Transform.rotate(
                      angle: angel,
                      child: GestureDetector(
                        onTap: () {
                          angel += 3;
                          counter++;
                          if (counter % 34 ==0) {
                            TasbehNumber++;
                            counter=0;
                          }
                          if(TasbehNumber>=text.length){
                            TasbehNumber=0;
                          }
                          setState(() {});
                        },
                        child: Image(
                          image: AssetImage("assets/images/body_sebha.png"),
                          width: 210,
                        ),
                      ),
                    )),
              ),
            ],
          ),
          Column(
            children: [
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Text(
                  "عدد التسبيحات",
                  style: Theme.of(context).textTheme.titleLarge,
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(12.0),
                child: Container(
                    padding: EdgeInsets.all(15),
                    decoration: BoxDecoration(
                        color: Color(0xAAB7935F),
                        borderRadius: BorderRadius.circular(20)),
                    child: Text(
                      "$counter",
                      style: Theme.of(context).textTheme.titleLarge,
                    )),
              ),
              Padding(
                  padding: const EdgeInsets.all(12.0),
                  child: Container(
                      padding: EdgeInsets.all(10),
                      decoration: BoxDecoration(
                          color: Color(0xFFB7935F),
                          borderRadius: BorderRadius.circular(20)),
                      child: Text(
                        "${text[TasbehNumber]}",
                        style: TextStyle(color: Colors.white, fontSize: 25),
                      ))),
            ],
          )
        ],
      ),
    );
  }

}

