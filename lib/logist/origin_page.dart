import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:logi/appointment/appoint.dart';
import 'package:logi/cash/cash_app.dart';
import 'package:logi/trans/trans.dart';
import 'add_order_screen.dart';
import 'logi.dart';
import 'logistic_body_widget.dart';
import 'logistic_filter_widget.dart';
import 'logistic_top_bar_widget.dart';

class OriginPage extends StatefulWidget {
  const OriginPage();

  @override
  State<OriginPage> createState() => _OriginPageState();
}

class _OriginPageState extends State<OriginPage> {
  Widget child = Container();
  int index = 0;

  @override
  Widget build(BuildContext context) {
    switch (index) {
      case 0:
        child = const ShipBody();
        break;
      case 1:
        child = const AppointmentPage();
        break;
      case 2:
        child = const TransHome();
        break;
      case 3:
        child = const CashApp();
        break;
      case 4:
        child = LogiMen();
        break;
      default:
    }
    return Scaffold(
      body: child,
      bottomNavigationBar: //LogisticBottomBarWidget()

          ClipRRect(
        borderRadius: const BorderRadius.vertical(top: Radius.circular(20)),
        child: BottomNavigationBar(
          backgroundColor: const Color.fromARGB(168, 8, 11, 20),
          elevation: 10,
          type: BottomNavigationBarType.fixed,
          onTap: (value) {
            setState(() {
              index = value;
            });
          },
          showUnselectedLabels: false,
          showSelectedLabels: false,
          items: [
            BottomNavigationBarItem(
              label: 'Ship',
              icon: index == 0
                  ? activeIcon('images/ship.svg', size: 28)
                  : passiveIcon('images/ship.svg', size: 25),
            ),
            BottomNavigationBarItem(
              label: 'Appointment',
              icon: index == 1
                  ? activeIcon('images/appointment.svg', size: 28)
                  : passiveIcon('images/appointment.svg', size: 23),
            ),
            BottomNavigationBarItem(
              label: 'Transaction',
              icon: index == 2
                  ? activeIcon('images/transaction.svg')
                  : passiveIcon('images/transaction.svg'),
            ),
            BottomNavigationBarItem(
              label: 'Payments',
              icon: index == 3 ? activeIcon('images/pay.svg') : passiveIcon('images/pay.svg'),
            ),
            BottomNavigationBarItem(
              label: 'Orders',
              icon: Icon(
                Icons.delivery_dining,
                color: index == 4 ? Colors.green : Colors.blueGrey[300],
                size: index == 4 ? 30 : 26,
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class ShipBody extends StatelessWidget {
  const ShipBody({
    Key? key,
  });

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Column(
        children: [
          const LogisticTopBarWidget(),
          const LogisticFilterWidget(),
          Expanded(
            child: Container(
              decoration: const BoxDecoration(
                color: Colors.white,
              ),
              padding: const EdgeInsets.fromLTRB(16, 16, 16, 0),
              child: const LogisticBodyWidget(),
            ),
          ),
        ],
      ),
    );
  }
}

Widget activeIcon(String img, {double size = 32}) {
  return SvgPicture.asset(
    img,
    color: const Color.fromARGB(255, 98, 255, 130),
    height: size,
    width: size,
  );
}

Widget passiveIcon(String img, {double size = 28}) {
  return SvgPicture.asset(
    img,
    color: Colors.blueGrey[300],
    height: size,
    width: size,
  );
}
