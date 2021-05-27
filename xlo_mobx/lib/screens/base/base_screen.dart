import 'package:flutter/material.dart';
import 'package:xlo_mobx/screens/home/home_screen.dart';

class BaseScreen extends StatelessWidget {
  BaseScreen({Key key}) : super(key: key);

  final PageController pageController = PageController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: PageView(
        controller: pageController,
        physics: NeverScrollableScrollPhysics(),
        children: [
          HomeScreen(),
          Container(
            color: Colors.green,
          ),
          Container(
            color: Colors.yellow,
          ),
          Container(
            color: Colors.grey,
          ),
          Container(
            color: Colors.brown,
          ),
        ],
      ),
    );
  }
}
