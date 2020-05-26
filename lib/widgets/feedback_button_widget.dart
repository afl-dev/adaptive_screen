import 'package:flutter/material.dart';

class FeedbackButton extends StatelessWidget {
  final height;
  final fnt10;
  final fnt11;

  const FeedbackButton({Key key, this.height, this.fnt10, this.fnt11})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialButton(
      height: double.infinity,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(15.0)),
      color: Colors.white,
      child: Row(
        children: <Widget>[
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              Spacer(flex: 3),
              Container(
                width: (height / 44.8).ceilToDouble(),
                height: (height / 44.8).ceilToDouble(),
                decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  color: Colors.red,
                ),
                child: Center(
                    child: Text(
                  "1",
                  style: TextStyle(fontSize: fnt10),
                )),
              ),
              Spacer(flex: 4),
              Flexible(
                flex: 6,
                child: Text(
                  'Отклики',
                  style:
                      TextStyle(fontSize: fnt11, fontWeight: FontWeight.bold),
                ),
              ),
            ],
          ),
          Spacer(),
          Padding(
            padding: const EdgeInsets.only(top: 10),
            child: Align(
                alignment: Alignment.topCenter,
                child: Image.asset('assets/images/xmlid_2003.png')),
          )
        ],
      ),
      onPressed: () {
        // print('$height $width');
      },
    );
  }
}
