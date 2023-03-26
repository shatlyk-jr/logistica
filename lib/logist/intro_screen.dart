// ignore_for_file: deprecated_member_use

import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'origin_page.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:introduction_screen/introduction_screen.dart';

final rememberFlag = StateProvider((ref) => false);

class IntroScreen extends StatefulWidget {
  const IntroScreen();

  @override
  IntroScreenState createState() => IntroScreenState();
}

class IntroScreenState extends State<IntroScreen> {
  final introKey = GlobalKey<IntroductionScreenState>();

  void _onIntroEnd(context) {
    Navigator.of(context).push(
      MaterialPageRoute(builder: (_) => const OriginPage()),
    );
  }

  Widget _buildImage(String assetName, [double width = 350]) {
    return Image.asset('images/intro/$assetName', width: width);
  }

  @override
  Widget build(BuildContext context) {
    const bodyStyle = TextStyle(fontSize: 19.0);

    const pageDecoration = PageDecoration(
      titleTextStyle: TextStyle(fontSize: 28.0, fontWeight: FontWeight.w700),
      bodyTextStyle: bodyStyle,
      bodyPadding: EdgeInsets.fromLTRB(16.0, 0.0, 16.0, 16.0),
      pageColor: Colors.white,
      imagePadding: EdgeInsets.zero,
    );

    return Stack(
      children: [
        IntroductionScreen(
          key: introKey,
          globalBackgroundColor: Colors.white,
          allowImplicitScrolling: true,
          autoScrollDuration: 7000,
          bodyPadding: const EdgeInsets.only(top: 50),

          globalFooter: SizedBox(
            width: double.infinity,
            height: 60,
            child: ElevatedButton(
              child: const Text(
                'Let\'s go right away!',
                style: TextStyle(fontSize: 16.0, fontWeight: FontWeight.bold),
              ),
              onPressed: () => _onIntroEnd(context),
            ),
          ),
          pages: [
            PageViewModel(
              title: "Logistics Management",
              body:
                  "A logistics management system is a combination of software tools that optimize business processes from beginning to end.",
              image: _buildImage('1.jpg'),
              decoration: pageDecoration,
            ),
            PageViewModel(
              title: "Warehouse",
              body:
                  "To get products to end users quickly, manage your warehouse to make sure it has the right product, in ready-to-buy condition, in the right place at the right time.",
              image: _buildImage('2.jpg'),
              decoration: pageDecoration,
            ),
            PageViewModel(
              title: "Delivery",
              body:
                  "Delivery management allows your organization to streamline logistics, boost delivery efficiency, and save money. This app explains how it’s done.",
              image: _buildImage('3.jpg'),
              decoration: pageDecoration,
            ),
            PageViewModel(
              title: "Inventory",
              body:
                  "Inventory management is a vital part of the supply chain responsible for controlling and documenting the amount of product for sale.",
              image: _buildImage('4.jpg'),
              decoration: pageDecoration,
            ),
            PageViewModel(
              title: "Scheduling",
              body:
                  "Logistics scheduling is the process of planning specific days and times to move a product or service through a logistics workflow or pipeline.",
              image: _buildImage('5.jpg'),
              decoration: pageDecoration,
            ),
          ],
          onDone: () => _onIntroEnd(context),
          showSkipButton: false,
          skipOrBackFlex: 0,
          nextFlex: 0,
          showBackButton: true,
          //rtl: true, // Display as right-to-left
          back: const Icon(Icons.arrow_back),
          skip: const Text('Skip', style: TextStyle(fontWeight: FontWeight.w600)),
          next: const Icon(Icons.arrow_forward),
          done: const Text('Done', style: TextStyle(fontWeight: FontWeight.w600)),
          curve: Curves.fastLinearToSlowEaseIn,
          controlsMargin: const EdgeInsets.all(16),
          controlsPadding:
              kIsWeb ? const EdgeInsets.all(12.0) : const EdgeInsets.fromLTRB(8.0, 4.0, 8.0, 4.0),
          dotsDecorator: const DotsDecorator(
            size: Size(10.0, 10.0),
            color: Color(0xFFBDBDBD),
            activeSize: Size(22.0, 10.0),
            activeShape: RoundedRectangleBorder(
              borderRadius: BorderRadius.all(Radius.circular(25.0)),
            ),
          ),
          dotsContainerDecorator: const ShapeDecoration(
            color: Colors.black87,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.all(Radius.circular(8.0)),
            ),
          ),
        ),
      ],
    );
  }
}

class HomePage extends StatelessWidget {
  const HomePage();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Home')),
      body: const Center(child: Text("This is the screen after Introduction")),
    );
  }
}
