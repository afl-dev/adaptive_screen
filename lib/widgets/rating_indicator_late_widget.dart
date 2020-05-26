import 'package:flutter/material.dart';

class RatIndLate extends StatelessWidget {
  final height;
  final width;
  final fnt10;
  final fnt17;

  const RatIndLate({Key key, this.height, this.width, this.fnt10, this.fnt17})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      children: <Widget>[
        Spacer(),
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            Text(
              'Ваш рейтинг',
              style: TextStyle(fontSize: fnt10),
            ),
            Text('324',
                style: TextStyle(fontSize: fnt17, fontWeight: FontWeight.bold)),
          ],
        ),
        Spacer(),
        Align(
          alignment: Alignment.topCenter,
          child: Icon(
            Icons.arrow_upward,
            color: Colors.green,
            size: fnt17,
          ),
        ),
        // Spacer(),
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            Text('Без опозданий 10 дней x2', style: TextStyle(fontSize: fnt10)),
            Container(
              height: height * 0.004,
              width: width * 0.55,
              child: Stack(
                children: <Widget>[
                  Container(
                    decoration: BoxDecoration(
                      border: Border.all(color: Colors.grey, width: 1.0),
                      color: Color.fromRGBO(220, 220, 220, 1),
                      borderRadius: BorderRadius.circular(10),
                    ),
                  ),
                  FractionallySizedBox(
                    widthFactor: 0.5,
                    child: Container(
                      decoration: BoxDecoration(
                        color: Colors.green,
                        borderRadius: BorderRadius.circular(10),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
        // Spacer(),
      ],
    );
  }
}
