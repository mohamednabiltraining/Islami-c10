import 'package:flutter/material.dart';
import 'package:islami_c10/ui/homeScreen/tasbeh/widgets/sebha.dart';

class TasbehTab extends StatefulWidget {
  const TasbehTab({super.key});

  @override
  State<TasbehTab> createState() => _SebhaTabState();
}

class _SebhaTabState extends State<TasbehTab> {
  /// [ MARK ]  Variables :-
  int _counter = 0;
  int _currentAzkarIndex = 0;
  double _turns = 0.0;

  final List<String> _azkar = [
    "سبحان الله",
    "الحمدلله",
    "لا اله إلا الله",
    "الله أكبر",
    "لا حول ولا قوة إلا بالله"
  ];

  /// [ MARK ]  Utilities :-
  void _incrementCounter() {
    setState(() {
      _counter++;
      if (_counter == 33) {
        _counter = 0;
        _currentAzkarIndex = (_currentAzkarIndex + 1) % _azkar.length;
      }
    });
  }

  /// [ MARK ]  STF LifeCycel :-
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: double.infinity,
      height: double.infinity,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: [
          SizedBox(
            width: 300,
            height: 300,
            child: SebhaStack(turns: _turns),
          ),
          Text(
            "Tasbeh Count",
            style: Theme.of(context).textTheme.titleMedium,
            textAlign: TextAlign.center,
          ),
          const SizedBox(
            height: 20,
          ),
          MaterialButton(
            minWidth: 69,
            height: 81,
            color: const Color(0xffcab497),
            shape: OutlineInputBorder(
                borderSide: BorderSide.none,
                borderRadius: BorderRadius.circular(25)),
            onPressed: () {
              _incrementCounter();
              _turns += 0.03;
              setState(() {});
            },
            child: Text(
              "$_counter",
              style: const TextStyle(
                  fontSize: 23,
                  fontWeight: FontWeight.w900,
                  color: Colors.black),
            ),
          ),
          const SizedBox(
            height: 20,
          ),
          Container(
              padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 7),
              decoration: BoxDecoration(
                color: Theme.of(context).primaryColor,
                borderRadius: const BorderRadius.all(
                  Radius.circular(25),
                ),
              ),
              child: Text(_azkar[_currentAzkarIndex],
                  style: const TextStyle(
                      fontSize: 23,
                      fontWeight: FontWeight.w900,
                      color: Colors.white))),
          const SizedBox(
            height: 100,
          ),
        ],
      ),
    );
  }
}
