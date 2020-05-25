import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:page_view_indicator/page_view_indicator.dart';
import 'package:ra/repository/dummy_data.dart';
import 'package:ra/widgets/divider_vert_widget.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({
    Key key,
  }) : super(key: key);

  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  PageController _controller;
  final pageIndexNotifier = ValueNotifier<int>(0);
  static const length = 3;
  static const List<Color> colorList = [
    Colors.red,
    Colors.yellow,
    Colors.green
  ];
  List<WorkShift> workShift = DUMMY_DATA;

  @override
  void initState() {
    super.initState();
    _controller = PageController(initialPage: 0);
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  PageViewIndicator _pageViewIndicator() {
    return PageViewIndicator(
      pageIndexNotifier: pageIndexNotifier,
      length: length,
      normalBuilder: (animationController, index) => Circle(
        size: 8.0,
        color: Colors.grey[300],
      ),
      highlightedBuilder: (animationController, index) => ScaleTransition(
        scale: CurvedAnimation(
          parent: animationController,
          curve: Curves.ease,
        ),
        child: Circle(
          size: 12.0,
          color: colorList[index],
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    double height = MediaQuery.of(context).size.height;
    double width = MediaQuery.of(context).size.width;
    final double fnt22 = (height / 30.55).ceilToDouble(); // base font 22
    final double fnt20 = (height / 33.60).ceilToDouble(); // base font 20
    final double fnt17 = (height / 39.55).ceilToDouble(); // base font 17
    final double fnt15 = (height / 44.80).ceilToDouble(); // base font 15
    final double fnt14 = (height / 48.00).ceilToDouble(); // base font 14
    final double fnt12 = (height / 56.00).ceilToDouble(); // base font 12
    final double fnt11 = (height / 61.10).ceilToDouble(); // base font 11
    final double fnt10 = (height / 67.20).ceilToDouble(); // base font 10
    final double fnt8 = (height / 84).ceilToDouble(); // base font 8
    return Scaffold(
      appBar: new AppBar(
        title: Row(
          children: <Widget>[
            Spacer(),
            Flexible(
              child: Container(
                child: CircleAvatar(
                  backgroundImage: ExactAssetImage('assets/images/pp.jpg'),
                ),
                height: (height / 14.94).ceilToDouble(),
                width: (height / 14.94).ceilToDouble(),
              ),
              flex: 3,
              fit: FlexFit.loose,
            ),
            Spacer(),
            Expanded(
              flex: 12,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  Text(
                    'Николай Шевчук',
                    style: TextStyle(fontSize: fnt17),
                  ),
                  Text(
                    'Рейтинг в чем бы он не отоброжался',
                    style: TextStyle(fontSize: fnt10),
                  ),
                ],
              ),
            ),
          ],
        ),
        actions: <Widget>[
          Padding(
            padding: const EdgeInsets.only(right: 16),
            child: IconButton(
                icon: const Icon(Icons.settings),
                tooltip: 'Settings',
                onPressed: () {}),
          ),
        ],
        backgroundColor: Colors.green,
      ),
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
                  child: PageView.builder(
                      controller: _controller,
                      scrollDirection: Axis.horizontal,
                      itemCount: length,
                      onPageChanged: (index) =>
                          {pageIndexNotifier.value = index},
                      itemBuilder: (context, page) {
                        return ListView.separated(
                            separatorBuilder: (context, index) =>
                                Row(children: <Widget>[
                                  Expanded(
                                      flex: 3,
                                      child: Divider(
                                        height: 1,
                                      )),
                                  Flexible(
                                    child: Container(
                                      child: Text(
                                        "ЧТ, 16.04.2020",
                                        style: TextStyle(fontSize: fnt8),
                                      ),
                                    ),
                                    flex: 7,
                                    fit: FlexFit.loose,
                                  ),
                                  Expanded(
                                      flex: 30,
                                      child: Divider(
                                        height: 1,
                                      )),
                                ]),
                            itemCount: 4,
                            itemBuilder: (context, index) {
                              List<WorkShift> list = [];
                              page < 1
                                  ? list.addAll(workShift)
                                  : page > 1
                                      ? list.addAll(workShift.skip(8))
                                      : list.addAll(workShift.skip(4));
                              return SizedBox(
                                height: height * 0.08,
                                width: double.infinity,
                                child: Row(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: <Widget>[
                                    //Spacer(),
                                    Expanded(
                                        flex: 3,
                                        //fit: FlexFit.tight,
                                        child: Column(
                                          children: <Widget>[
                                            Spacer(),
                                            Text(
                                              '${list[index].startTime}',
                                              style: TextStyle(fontSize: fnt12),
                                            ),
                                            Text(
                                              '${list[index].endTime}',
                                              style: TextStyle(fontSize: fnt12),
                                            ),
                                            Spacer(),
                                          ],
                                        )),
                                    Spacer(),
                                    DividerVert(height: height),
                                    Spacer(),
                                    Expanded(
                                      flex: 12,
                                      child: Column(
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                        children: <Widget>[
                                          Spacer(),
                                          Flexible(
                                            flex: 3,
                                            child: Text(
                                              '${list[index].title}',
                                              style: TextStyle(
                                                  fontSize: fnt14,
                                                  fontWeight: FontWeight.bold),
                                            ),
                                          ),
                                          Spacer(),
                                          Flexible(
                                            flex: 2,
                                            child: Text(
                                              'Адрес',
                                              style: TextStyle(
                                                  fontSize: fnt10,
                                                  color: Colors.grey),
                                            ),
                                          ),
                                          Spacer(),
                                          Flexible(
                                            flex: 2,
                                            child: Text(
                                              '${list[index].adress}',
                                              style: TextStyle(
                                                fontSize: fnt10,
                                              ),
                                            ),
                                          ),
                                          Spacer()
                                        ],
                                      ),
                                    ),
                                    Spacer(),
                                    Expanded(
                                        flex: 5,
                                        child: Column(
                                          mainAxisAlignment:
                                              MainAxisAlignment.start,
                                          children: <Widget>[
                                            Spacer(),
                                            Expanded(
                                                flex: 8,
                                                child: Text(
                                                  '${list[index].income}',
                                                  style: TextStyle(
                                                      fontWeight:
                                                          FontWeight.bold,
                                                      fontSize: fnt14),
                                                )),
                                          ],
                                        )),
                                    Spacer(),
                                    DividerVert(height: height),
                                    Spacer(),
                                    Expanded(
                                        flex: 3,
                                        child: GestureDetector(
                                          onTap: () {},
                                          child: Column(
                                            children: <Widget>[
                                              Spacer(),
                                              Stack(
                                                children: <Widget>[
                                                  Container(
                                                    width: (height / 22.4)
                                                        .ceilToDouble(),
                                                    height: (height / 22.4)
                                                        .ceilToDouble(),
                                                    alignment:
                                                        Alignment.topRight,
                                                    decoration: BoxDecoration(
                                                      borderRadius:
                                                          BorderRadius.circular(
                                                              25.0),
                                                      border: Border.all(
                                                        width: 1.0,
                                                        color: Colors.green,
                                                      ),
                                                    ),
                                                    child: Center(
                                                      child: Text(
                                                          '${list[index].rating}'),
                                                    ),
                                                  ),
                                                  Positioned(
                                                    bottom: -8,
                                                    right: -5,
                                                    child: Icon(
                                                      Icons.star,
                                                      color: Colors.green,
                                                      size: fnt22,
                                                    ),
                                                  ),
                                                ],
                                                overflow: Overflow.visible,
                                              ),
                                              Spacer(),
                                              Container(
                                                child: Image.asset(
                                                  'assets/images/vector.png',
                                                  fit: BoxFit.cover,
                                                ),
                                              ),
                                              Spacer()
                                            ],
                                          ),
                                        )),
                                  ],
                                ),
                              );
                            });
                      }),
                ),
              ),
              _pageViewIndicator(),
              Divider(height: 1),
              Spacer(),
              Expanded(
                flex: 2,
                child: Row(
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
                            style: TextStyle(
                                fontSize: fnt17, fontWeight: FontWeight.bold)),
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
                        Text('Без опозданий 10 дней x2',
                            style: TextStyle(fontSize: fnt10)),
                        Container(
                          height: height * 0.004,
                          width: width * 0.55,
                          child: Stack(
                            children: <Widget>[
                              Container(
                                decoration: BoxDecoration(
                                  border: Border.all(
                                      color: Colors.grey, width: 1.0),
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
                ),
              ),
              Spacer(),
              Expanded(
                flex: 4,
                child: Row(
                  children: <Widget>[
                    Expanded(
                        flex: 8,
                        child: MaterialButton(
                          height: double.infinity,
                          shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(15.0)),
                          color: Colors.white,
                          child: Container(
                            width: double.infinity,
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: <Widget>[
                                Spacer(),
                                Text(
                                  '3450 ₽',
                                  style: TextStyle(
                                      fontSize: fnt20, color: Colors.green),
                                ),
                                Spacer(),
                                Text(
                                  'Мой счет',
                                  style: TextStyle(
                                      fontSize: fnt11,
                                      fontWeight: FontWeight.bold),
                                ),
                                Spacer(),
                              ],
                            ),
                          ),
                          onPressed: () {},
                        )),
                    Spacer(),
                    Expanded(
                        flex: 8,
                        child: MaterialButton(
                          // padding: EdgeInsets.only(right: 10),
                          height: double.infinity,
                          shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(15.0)),
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
                                      style: TextStyle(
                                          fontSize: fnt11,
                                          fontWeight: FontWeight.bold),
                                    ),
                                  ),
                                ],
                              ),
                              Spacer(),
                              Padding(
                                padding: const EdgeInsets.only(top: 10),
                                child: Align(
                                    alignment: Alignment.topCenter,
                                    child: Image.asset(
                                        'assets/images/xmlid_2003.png')),
                              )
                            ],
                          ),
                          onPressed: () {
                            print('$height $width');
                          },
                        )),
                  ],
                ),
              ),
              Spacer()
            ],
          ),
        ),
      ),
      bottomNavigationBar: Container(
        decoration: BoxDecoration(
          borderRadius: BorderRadius.only(
            topLeft: Radius.circular(30),
            topRight: Radius.circular(30),
          ),
          color: Colors.white,
          boxShadow: [
            BoxShadow(
              color: Colors.grey.withOpacity(0.5),
              blurRadius: 2.0, // soften the shadow
              spreadRadius: 4.0, //extend the shadow
              offset: Offset(
                0, // Move to right 10  horizontally
                3, // Move to bottom 5 Vertically
              ),
            ),
          ],
        ),
        //color: Colors.transparent,
        height: height * 0.1,
        child: Material(
          type: MaterialType.transparency,
          elevation: 6.0,
          //color: Colors.transparent,
          child: InkWell(
            onTap: () {},
            borderRadius: BorderRadius.only(
              topLeft: Radius.circular(30),
              topRight: Radius.circular(30),
            ),
            child: Center(
                child: Column(
              mainAxisSize: MainAxisSize.max,
              children: <Widget>[
                Spacer(flex: 2),
                Flexible(
                    flex: 3,
                    child: Container(
                      color: Colors.green,
                      height: 2,
                      width: (width / 6).ceilToDouble(),
                    )),
                Spacer(flex: 2),
                Expanded(
                  flex: 3,
                  child: Text(
                    'Вакансии',
                    style:
                        TextStyle(fontWeight: FontWeight.bold, fontSize: fnt17),
                  ),
                ),
                Spacer(),
              ],
            )),
          ),
        ),
      ),
    );
  }
}
