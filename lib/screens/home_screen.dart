import 'package:flutter/material.dart';
import 'package:loja01/screens/tabs/home_tab.dart';

class HomeScreen extends StatelessWidget {
  final _pageController = PageController();

  @override
  Widget build(BuildContext context) {
    //sempre que eu quiser ontrolar uma pagina
    //_pageController.animateToPage(page, duration: duration, curve: curve);
    //_pageController.jumpToPage(page);

    return PageView(
      controller: _pageController,
      physics: const NeverScrollableScrollPhysics(),
      children: <Widget>[
        HomeTab(),
      ],
    );
  }
}
