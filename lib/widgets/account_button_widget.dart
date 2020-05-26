import 'package:flutter/material.dart';

class AccountButton extends StatelessWidget {
  final fnt11;
  final fnt20;

  const AccountButton({Key key, this.fnt11, this.fnt20}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialButton(
      height: double.infinity,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(15.0)),
      color: Colors.white,
      child: Container(
        width: double.infinity,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            Spacer(),
            Text(
              '3450 ₽',
              style: TextStyle(fontSize: fnt20, color: Colors.green),
            ),
            Spacer(),
            Text(
              'Мой счет',
              style: TextStyle(fontSize: fnt11, fontWeight: FontWeight.bold),
            ),
            Spacer(),
          ],
        ),
      ),
      onPressed: () {},
    );
  }
}
