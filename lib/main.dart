import 'dart:ffi';

import 'package:flutter/material.dart';
import 'package:supercharged/supercharged.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      debugShowCheckedModeBanner: false,
      home: HomePage(),
    );
  }
}

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final TextStyle titleStyle = TextStyle(
      fontSize: 24.0, color: "#f19066".toColor(), fontWeight: FontWeight.w600);

  final ButtonStyle buttonDefaultStyle = TextButton.styleFrom(
    primary: Colors.white,
    minimumSize: Size(88, 44),
    padding: EdgeInsets.symmetric(horizontal: 16.0),
    shape: const RoundedRectangleBorder(
      borderRadius: BorderRadius.all(Radius.circular(8)),
    ),
    backgroundColor: "#EE5A24".toColor(),
  );

  final ButtonStyle buttonSelectedStyle = TextButton.styleFrom(
    primary: Colors.white,
    minimumSize: Size(88, 44),
    padding: EdgeInsets.symmetric(horizontal: 16.0),
    shape: const RoundedRectangleBorder(
      borderRadius: BorderRadius.all(Radius.circular(8)),
    ),
    backgroundColor: "#F79F1F".toColor(),
  );

  bool isFive = false;
  bool isTen = false;
  bool isFifteen = false;
  bool isTwenty = false;
  bool isTwentyFive = false;
  bool isFifty = false;
  bool isCustom = false;

  double bill = 0;
  double tips = 0;
  double person = 1;

  double tipsPerPerson = 0;
  double totalPerPerson = 0;

  TextEditingController billTc = TextEditingController();
  TextEditingController customTc = TextEditingController();
  TextEditingController personTc = TextEditingController();

  void calculate() {
    totalPerPerson = bill / person;
    tipsPerPerson = (bill * tips) / person;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: "#e77f67".toColor(),
      body: SingleChildScrollView(
        child: Column(
          children: [
            Container(
              width: double.infinity,
              height: 200,
              child: Center(
                child: Image.asset("assets/logo.png"),
              ),
            ),
            Container(
              width: double.infinity,
              padding: EdgeInsets.symmetric(horizontal: 35.0, vertical: 25.0),
              decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.only(
                      topLeft: Radius.circular(30),
                      topRight: Radius.circular(30))),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    "Bills",
                    style: titleStyle,
                  ),
                  TextField(
                      decoration: InputDecoration(
                        filled: true,
                        fillColor: Color(0xFFF3F8FB),
                        border: InputBorder.none,
                        hintText: "cth : 1000",
                        icon: Icon(Icons.attach_money_rounded),
                      ),
                      keyboardType: TextInputType.numberWithOptions(),
                      textAlign: TextAlign.end,
                      controller: billTc,
                      onEditingComplete: () {
                        String value = billTc.text;
                        if (value.isNotEmpty) {
                          bill = double.parse(value);
                        } else {
                          bill = 0;
                        }
                        setState(() {
                          calculate();
                        });
                      },
                      style: TextStyle(
                        fontSize: 32.0,
                        color: "#e15f41".toColor(),
                        fontWeight: FontWeight.bold,
                      )),
                  SizedBox(
                    height: 35.0,
                  ),
                  Text("Select Tip %", style: titleStyle),
                  SizedBox(
                    height: 15.0,
                  ),
                  Row(
                    children: [
                      Expanded(
                          child: Container(
                        height: 60,
                        child: TextButton(
                          style:
                              isFive ? buttonSelectedStyle : buttonDefaultStyle,
                          onPressed: () {
                            setState(() {
                              isFive = true;
                              isTen = false;
                              isFifteen = false;
                              isTwenty = false;
                              isTwentyFive = false;
                              isFifty = false;
                              isCustom = true;
                              tips = 0.05;

                              calculate();
                            });
                          },
                          child: Text(
                            '5%',
                            style: TextStyle(
                                fontSize: 28.0,
                                color: isFive ? Colors.red[900] : Colors.white,
                                fontWeight: FontWeight.bold),
                          ),
                        ),
                      )),
                      SizedBox(
                        width: 10,
                      ),
                      Expanded(
                          child: Container(
                        height: 60,
                        child: TextButton(
                          style:
                              isTen ? buttonSelectedStyle : buttonDefaultStyle,
                          onPressed: () {
                            setState(() {
                              isFive = false;
                              isTen = true;
                              isFifteen = false;
                              isTwenty = false;
                              isTwentyFive = false;
                              isFifty = false;
                              isCustom = false;
                              tips = 0.1;

                              customTc.clear();
                              calculate();
                            });
                          },
                          child: Text(
                            '10%',
                            style: TextStyle(
                                fontSize: 28.0,
                                color: isTen ? Colors.red[900] : Colors.white,
                                fontWeight: FontWeight.bold),
                          ),
                        ),
                      )),
                    ],
                  ),
                  SizedBox(
                    height: 15.0,
                  ),
                  Row(
                    children: [
                      Expanded(
                          child: Container(
                        height: 60,
                        child: TextButton(
                          style: isFifteen
                              ? buttonSelectedStyle
                              : buttonDefaultStyle,
                          onPressed: () {
                            setState(() {
                              isFive = false;
                              isTen = false;
                              isFifteen = true;
                              isTwenty = false;
                              isTwentyFive = false;
                              isFifty = false;
                              isCustom = false;
                              tips = 0.15;

                              customTc.clear();
                              calculate();
                            });
                          },
                          child: Text(
                            '15%',
                            style: TextStyle(
                                fontSize: 28.0,
                                color:
                                    isFifteen ? Colors.red[900] : Colors.white,
                                fontWeight: FontWeight.bold),
                          ),
                        ),
                      )),
                      SizedBox(
                        width: 10,
                      ),
                      Expanded(
                          child: Container(
                        height: 60,
                        child: TextButton(
                          style: isTwentyFive
                              ? buttonSelectedStyle
                              : buttonDefaultStyle,
                          onPressed: () {
                            setState(() {
                              isFive = false;
                              isTen = false;
                              isFifteen = false;
                              isTwenty = false;
                              isTwentyFive = true;
                              isFifty = false;

                              isCustom = false;
                              tips = 0.25;

                              customTc.clear();
                              calculate();
                            });
                          },
                          child: Text(
                            '25%',
                            style: TextStyle(
                                fontSize: 28.0,
                                color: isTwentyFive
                                    ? Colors.red[900]
                                    : Colors.white,
                                fontWeight: FontWeight.bold),
                          ),
                        ),
                      )),
                    ],
                  ),
                  SizedBox(
                    height: 15.0,
                  ),
                  Row(
                    children: [
                      Expanded(
                          child: Container(
                        height: 60,
                        child: TextButton(
                          style: isFifty
                              ? buttonSelectedStyle
                              : buttonDefaultStyle,
                          onPressed: () {
                            setState(() {
                              isFive = false;
                              isTen = false;
                              isFifteen = false;
                              isTwenty = false;
                              isTwentyFive = false;
                              isFifty = true;
                              isCustom = false;
                              tips = 0.5;

                              calculate();
                              customTc.clear();
                            });
                          },
                          child: Text(
                            '50%',
                            style: TextStyle(
                                fontSize: 28.0,
                                color: isFifty ? Colors.red[900] : Colors.white,
                                fontWeight: FontWeight.bold),
                          ),
                        ),
                      )),
                      SizedBox(
                        width: 10,
                      ),
                      Expanded(
                          child: Container(
                        height: 60,
                        child: TextField(
                            controller: customTc,
                            onEditingComplete: () {
                              String value = customTc.text;
                              if (value.isNotEmpty) {
                                tips = double.parse(value) / 100;
                              } else {
                                tips = 0;
                              }

                              setState(() {
                                calculate();
                              });
                            },
                            onTap: () {
                              setState(() {
                                isFive = false;
                                isTen = false;
                                isFifteen = false;
                                isTwenty = false;
                                isTwentyFive = false;
                                isFifty = false;
                                isCustom = false;

                                tips = 0;
                              });
                            },
                            decoration: InputDecoration(
                                filled: true,
                                fillColor: Color(0xFFF3F8FB),
                                border: InputBorder.none,
                                hintText: "CUSTOM"),
                            keyboardType: TextInputType.numberWithOptions(),
                            textAlign: TextAlign.start,
                            style: TextStyle(
                              fontSize: 28.0,
                              color: "#e15f41".toColor(),
                              fontWeight: FontWeight.bold,
                            )),
                      )),
                    ],
                  ),
                  SizedBox(
                    height: 15,
                  ),
                  Text(
                    "Number Of Bills",
                    style: titleStyle,
                  ),
                  TextField(
                      controller: personTc,
                      onEditingComplete: () {
                        String value = personTc.text;
                        if (value.isNotEmpty) {
                          person = double.parse(value);
                        } else {
                          person = 1;
                        }
                        setState(() {
                          totalPerPerson = bill / person;
                          tipsPerPerson = (bill * tips) / person;
                        });
                      },
                      decoration: InputDecoration(
                        filled: true,
                        fillColor: Color(0xFFF3F8FB),
                        border: InputBorder.none,
                        hintText: "cth : 5",
                        icon: Icon(Icons.person),
                      ),
                      keyboardType: TextInputType.numberWithOptions(),
                      textAlign: TextAlign.end,
                      style: TextStyle(
                        fontSize: 32.0,
                        color: "#e15f41".toColor(),
                        fontWeight: FontWeight.bold,
                      )),
                  SizedBox(
                    height: 30,
                  ),
                  Container(
                    width: double.infinity,
                    padding: EdgeInsets.all(30),
                    height: 300,
                    decoration: BoxDecoration(
                      color: "#EE5A24".toColor(),
                      borderRadius: BorderRadius.circular(18),
                    ),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  "Tip Of Mount",
                                  style: TextStyle(
                                      color: Colors.white, fontSize: 24),
                                ),
                                SizedBox(
                                  height: 10,
                                ),
                                Text(
                                  "/ Person",
                                  style: TextStyle(
                                      color: Colors.yellow[100], fontSize: 18),
                                ),
                              ],
                            ),
                            Text("Rp.${tipsPerPerson.toStringAsFixed(2)}",
                                style: TextStyle(
                                    color: Colors.yellow[100],
                                    fontSize: 20,
                                    fontWeight: FontWeight.bold))
                          ],
                        ),
                        SizedBox(
                          height: 20,
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  "Total",
                                  style: TextStyle(
                                      color: Colors.white, fontSize: 24),
                                ),
                                SizedBox(
                                  height: 10,
                                ),
                                Text(
                                  "/ Person",
                                  style: TextStyle(
                                      color: Colors.yellow[100], fontSize: 18),
                                ),
                              ],
                            ),
                            Text("Rp.${totalPerPerson.toStringAsFixed(2)}",
                                style: TextStyle(
                                    color: Colors.yellow[100],
                                    fontSize: 20,
                                    fontWeight: FontWeight.bold))
                          ],
                        ),
                        SizedBox(
                          height: 20,
                        ),
                        Container(
                          width: double.infinity,
                          height: 60,
                          child: TextButton(
                            style: buttonSelectedStyle,
                            onPressed: () {
                              setState(() {
                                isFive = false;
                                isTen = false;
                                isFifteen = false;
                                isTwenty = false;
                                isTwentyFive = false;
                                isFifty = false;
                                isCustom = false;

                                bill = 0;
                                tips = 0;
                                person = 1;

                                tipsPerPerson = 0;
                                totalPerPerson = 0;

                                billTc.clear();
                                customTc.clear();
                                personTc.clear();
                              });
                            },
                            child: Text(
                              'RESET',
                              style: TextStyle(
                                  fontSize: 28.0,
                                  color: Colors.red[900],
                                  fontWeight: FontWeight.bold),
                            ),
                          ),
                        )
                      ],
                    ),
                  )
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
