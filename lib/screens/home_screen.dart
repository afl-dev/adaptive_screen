import 'package:flutter/material.dart';
import 'package:ra/widgets/account_button_widget.dart';
import 'package:ra/widgets/appbar_widget.dart';
import 'package:ra/widgets/feedback_button_widget.dart';
import 'package:ra/widgets/navbar_buttom_widget.dart';
import 'package:ra/widgets/page_vew_indicator_widget.dart';
import 'package:ra/widgets/rating_indicator_late_widget.dart';
import 'package:ra/widgets/workshift_page_view_widget.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({
    Key key,
  }) : super(key: key);

  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  final pageIndexNotifier = ValueNotifier<int>(0);
  static const int length = 3;

  @override
  void initState() {
    super.initState();
  }

  @override
  void dispose() {
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    double height = MediaQuery.of(context).size.height;
    double width = MediaQuery.of(context).size.width;
    final double fnt8 = (height / 84).ceilToDouble(); // base font 8
    final double fnt10 = (height / 67.20).ceilToDouble(); // base font 10
    final double fnt11 = (height / 61.10).ceilToDouble(); // base font 11
    final double fnt12 = (height / 56.00).ceilToDouble(); // base font 12
    final double fnt14 = (height / 48.00).ceilToDouble(); // base font 14
    final double fnt15 = (height / 44.80).ceilToDouble(); // base font 15
    final double fnt17 = (height / 39.55).ceilToDouble(); // base font 17
    final double fnt20 = (height / 33.60).ceilToDouble(); // base font 20
    final double fnt22 = (height / 30.55).ceilToDouble(); // base font 22
    return Scaffold(
      appBar: AppBarWidget(height: height, fnt10: fnt10, fnt17: fnt17),
      body: Center(
        child: SizedBox(
          width: width * 0.9,
          height: height * 0.8,
          child: Column(
            children: <Widget>[
              Spacer(),
              Expanded(
                  flex: 1,
                  child: Container(
                    alignment: Alignment.centerLeft,
                    child: Text(
                      'Предыдущие смены',
                      style: TextStyle(
                          fontWeight: FontWeight.bold, fontSize: fnt17),
                    ),
                  )),
              Spacer(),
              Divider(height: 1),
              Expanded(
                flex: 13,
                child: SizedBox(
                    width: double.infinity,
                    child: WorkShiftPageView(
                      pageIndexNotifier: pageIndexNotifier,
                      length: length,
                      height: height,
                      fnt8: fnt8,
                      fnt10: fnt10,
                      fnt12: fnt12,
                      fnt14: fnt14,
                      fnt22: fnt22,
                    )),
              ),
              PageViewIndicatorSample(
                  length: length, pageIndexNotifier: pageIndexNotifier),
              Divider(height: 1),
              Spacer(),
              Expanded(
                  flex: 2,
                  child: RatIndLate(
                    height: height,
                    width: width,
                    fnt10: fnt10,
                    fnt17: fnt17,
                  )),
              Spacer(),
              Expanded(
                flex: 4,
                child: Row(
                  children: <Widget>[
                    Expanded(
                        flex: 8,
                        child: AccountButton(fnt11: fnt11, fnt20: fnt20)),
                    Spacer(),
                    Expanded(
                      flex: 8,
                      child: FeedbackButton(
                          height: height, fnt10: fnt10, fnt11: fnt11),
                    ),
                  ],
                ),
              ),
              Spacer()
            ],
          ),
        ),
      ),
      bottomNavigationBar:
          NavBarButton(height: height, width: width, fnt17: fnt17),
    );
  }
}
