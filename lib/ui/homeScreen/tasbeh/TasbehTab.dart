import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

class TasbehTab extends StatefulWidget {
  const TasbehTab({super.key});

  @override
  State<TasbehTab> createState() => _TasbehTabState();
}

class _TasbehTabState extends State<TasbehTab> {
  int _counter = 1;
  List<String> tasbi7at = ['سبحان الله', 'الحمد لله', 'الله اكبر'];

  double _rotateAngle = 0.0;

  @override
  Widget build(BuildContext context) {
    return Align(
      alignment: Alignment.topCenter,
      child: Column(
        mainAxisSize: MainAxisSize.max,
        children: [
          Stack(
            alignment: Alignment.topCenter,
            children: [
              Image.asset(
                'assets/images/head_of_seb7a.png',
                height: 120,
              ),
              Padding(
                padding: const EdgeInsets.only(top: 90.0),
                child: Transform.rotate(
                  angle: _rotateAngle,
                  child: Image.asset(
                    'assets/images/body_of_seb7a.png',
                  ),
                ),
              ),
            ],
          ),
          const SizedBox(height: 50,),
          Expanded(
            child: Column(
              children: [
                Text(
                  AppLocalizations.of(context)!.tasbih_number,
                  //'Tasbi7 Number',
                  style: Theme.of(context).textTheme.titleLarge,
                ),
                const SizedBox(height: 26,),
                Container(
                  padding: const EdgeInsets.all(22),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(24),
                    color: Theme.of(context).primaryColor,
                  ),
                  child: Text(
                    _counter.toString(),
                    style: Theme.of(context).textTheme.titleLarge,
                  ),
                ),
                const SizedBox(height: 22,),
                GestureDetector(
                  onTap: () {
                    setState(() {
                      _rotateAngle += 0.3;
                      if (_counter == 99) {
                        _counter = 0;
                      } else {
                        _counter++;
                      }
                    });
                  },
                  child: Container(
                    width: 150,
                    padding: const EdgeInsets.symmetric(vertical: 6),
                    decoration: BoxDecoration(
                      color: Theme.of(context).primaryColor,
                      borderRadius: BorderRadius.circular(24),
                    ),
                    child: Text(
                      textAlign: TextAlign.center,
                      tasbi7Text(),
                      style: Theme.of(context).textTheme.titleLarge,

                  ),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  String tasbi7Text() {
    if (_counter < 34) {
      return tasbi7at[0];
    } else if (_counter < 67) {
      return tasbi7at[1];
    } else {
      return tasbi7at[2];
    }
  }
}
