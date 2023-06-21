import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:logistica/appointment/appoint.dart';
import 'package:logistica/appointment/constants.dart';
import 'package:logistica/cargo/price_calc.dart';
import 'package:logistica/inventory/inventory.dart';
import 'package:logistica/trans/trans.dart';
import '../profile/profile_page.dart';
import 'logi.dart';
import 'logistic_body_widget.dart';
import 'logistic_filter_widget.dart';
import 'logistic_top_bar_widget.dart';

class OriginPage extends StatefulWidget {
  const OriginPage(this.userName, {super.key});
  final String userName;

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
        child = AppointmentPage(widget.userName);
        break;
      case 1:
        child = TransHome();
        break;
      case 2:
        child = const LogiMen();
        break;
      case 3:
        child = PriceCalculationScreen();
        break;
      case 4:
        child = ProfilePage();
        break;
      default:
    }
    return Scaffold(
      body: child,
      bottomNavigationBar: //LogisticBottomBarWidget()

          ClipRRect(
        borderRadius: const BorderRadius.vertical(top: Radius.circular(20)),
        child: BottomNavigationBar(
          backgroundColor: Color.fromARGB(255, 219, 209, 209),
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
              label: 'Appointment',
              icon: index == 0
                  ? activeIcon('images/appointment.svg', size: 28)
                  : passiveIcon('images/appointment.svg', size: 25),
            ),
            BottomNavigationBarItem(
              label: 'Shio',
              icon: index == 1
                  ? activeIcon('images/transaction.svg', size: 28)
                  : passiveIcon('images/transaction.svg', size: 23),
            ),
            BottomNavigationBarItem(
              label: 'Orders',
              icon: Icon(
                Icons.delivery_dining,
                color:
                    index == 2 ? kIndigoDark : Color.fromARGB(255, 27, 28, 29),
                size: index == 2 ? 30 : 26,
              ),
            ),
            BottomNavigationBarItem(
              label: 'Ship',
              icon: index == 3
                  ? activeIcon('images/ship.svg')
                  : passiveIcon('images/ship.svg'),
            ),
            BottomNavigationBarItem(
              label: 'Profile',
              icon: Icon(
                Icons.person,
                color:
                    index == 4 ? kIndigoDark : Color.fromARGB(255, 27, 28, 29),
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
  const ShipBody({super.key});

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
    color: kBlueColor,
    height: size,
    width: size,
  );
}

Widget passiveIcon(String img, {double size = 28}) {
  return SvgPicture.asset(
    img,
    color: Color.fromARGB(255, 26, 26, 26),
    height: size,
    width: size,
  );
}
