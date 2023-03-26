import './pages/help_page.dart';
import './pages/stats_page.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

import 'components/icon_button.dart';

class ExpenseTrackerApp extends StatelessWidget {
  const ExpenseTrackerApp();

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: "Expense Tracker",
      debugShowCheckedModeBanner: false,
      home: const Expenses(),
      theme: ThemeData.dark().copyWith(
        primaryColor: const Color(0xff1C1934),
        colorScheme: ColorScheme.fromSwatch().copyWith(secondary: Colors.pink),
      ),
    );
  }
}

class Expenses extends StatefulWidget {
  const Expenses();

  @override
  ExpensesState createState() => ExpensesState();
}

class ExpensesState extends State<Expenses> {
  final List<IconData> bottomBarIcons = [
    Icons.calendar_today,
    Icons.insert_chart,
    Icons.person_outline
  ];

  double amount = 10;
  int currentTabSelected = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBodyBehindAppBar: true,
      appBar: AppBar(
        shadowColor: Colors.transparent,
        backgroundColor: Colors.transparent,
        leading: const BackButton(
          color: Colors.black,
        ),
      ),
      backgroundColor: const Color.fromARGB(255, 89, 83, 134),
      body: Stack(
        children: [
          _buildBody(),
          Align(
            alignment: Alignment.bottomCenter,
            child: _buildBottomBar(),
          ),
        ],
      ),
    );
  }

  Widget _buildBody() {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
        Expanded(
          child: Container(
            decoration: const BoxDecoration(
              borderRadius: BorderRadius.only(
                  bottomLeft: Radius.circular(
                66,
              )),
              gradient: LinearGradient(
                colors: [
                  Color(0xff682CFC),
                  Color(0xffB730F9),
                ],
                begin: Alignment.topCenter,
                end: Alignment.bottomCenter,
              ),
            ),
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.end,
              children: <Widget>[
                Expanded(
                  child: Padding(
                    padding: const EdgeInsets.only(
                      top: 35,
                      bottom: 42,
                      left: 24,
                    ),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: <Widget>[
                        const Text(
                          "     This week",
                          style: TextStyle(
                            fontSize: 28,
                            fontWeight: FontWeight.w600,
                          ),
                        ),
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: const [
                            Text(
                              "\$ 4.12",
                              style: TextStyle(
                                fontSize: 42,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                            SizedBox(
                              height: 8,
                            ),
                            Text(
                              "Total Contributions",
                              style: TextStyle(
                                fontSize: 15,
                              ),
                            ),
                          ],
                        ),
                        const Text(
                          "Will be collected on Monday",
                          style: TextStyle(
                            fontSize: 15,
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
                const Expanded(
                  child: Padding(
                    padding: EdgeInsets.symmetric(vertical: 36, horizontal: 12),
                    child: Icon(
                      FontAwesomeIcons.piggyBank,
                      color: Color(0xffFB71BC),
                      size: 100,
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
        Expanded(
            child: Column(
          children: <Widget>[
            const Padding(
              padding: EdgeInsets.symmetric(
                vertical: 32,
                horizontal: 20,
              ),
              child: Text(
                "Recurring contribution",
                style: TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.w600,
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(
                horizontal: 24,
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: <Widget>[
                  ActionButton(
                      icon: FontAwesomeIcons.minus,
                      onTap: () {
                        if (amount == 1) {
                          return;
                        }
                        // // setState(() {
                        // amount--;
                        // // });
                      }),
                  Text(
                    "\$ $amount",
                    style: const TextStyle(fontSize: 24, fontWeight: FontWeight.w600),
                  ),
                  ActionButton(
                      icon: FontAwesomeIcons.plus,
                      onTap: () {
                        // setState(() {
                        //   amount++;
                        // });
                      }),
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 36),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: const [
                  Text(
                    "Next contribution date:",
                    style: TextStyle(
                      fontSize: 18,
                      color: Color.fromARGB(255, 110, 0, 48),
                    ),
                  ),
                  Text(
                    "15 Feb 2023",
                    style: TextStyle(
                      color: Color.fromARGB(255, 94, 0, 103),
                      fontSize: 14,
                    ),
                  ),
                ],
              ),
            )
          ],
        )),
      ],
    );
  }

  Widget _buildBottomBar() {
    return Card(
      color: const Color(0xff2D294A),
      shape: const RoundedRectangleBorder(
          borderRadius: BorderRadius.only(
        bottomLeft: Radius.circular(36),
        bottomRight: Radius.circular(36),
      )),
      margin: const EdgeInsets.all(16),
      child: Padding(
        padding: const EdgeInsets.symmetric(
          vertical: 6,
        ),
        child: Row(mainAxisAlignment: MainAxisAlignment.spaceBetween, children: [
          Expanded(
            child: IconButton(
                icon: Icon(
                  bottomBarIcons[0],
                  color: currentTabSelected == 0 ? Colors.pink : const Color(0xff757495),
                ),
                onPressed: () {
                  // setState(() {
                  //   currentTabSelected = 0;
                  // });
                }),
          ),
          Expanded(
            child: IconButton(
                icon: Icon(
                  bottomBarIcons[1],
                  color: currentTabSelected == 1 ? Colors.pink : const Color(0xff757495),
                ),
                onPressed: () {
                  Navigator.push(
                      context, MaterialPageRoute(builder: (_) => const StatisticsPage()));
                }),
          ),
          Expanded(
            child: IconButton(
                icon: Icon(
                  bottomBarIcons[2],
                  color: currentTabSelected == 2 ? Colors.pink : const Color(0xff757495),
                ),
                onPressed: () {
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (_) => const HelpPage(),
                      ));
                }),
          ),
        ]),
      ),
    );
  }
}
