import 'package:ebnsina/screens/login.dart';
import 'package:ebnsina/screens/sign_up.dart';
import 'package:flutter/material.dart';

import 'package:provider/provider.dart';

import '../utils/images.dart';
import 'home.dart';

class DashboardScreen extends StatefulWidget {
  @override
  _DashboardScreenState createState() => _DashboardScreenState();
}

class _DashboardScreenState extends State<DashboardScreen> {
  final PageController _pageController = PageController();
  int _pageIndex = 0;
  late List<Widget> _screens;
  GlobalKey<ScaffoldMessengerState> _scaffoldKey = GlobalKey();

  @override
  void initState() {
    super.initState();

    _screens = [
      HomeScreen(),
      LoginScreen(),
      SignUpScreen(),
    ];
  }

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: () async {
        if (_pageIndex != 0) {
          _setPage(0);
          return false;
        } else {
          return true;
        }
      },
      child: Scaffold(
        key: _scaffoldKey,
        bottomNavigationBar: BottomNavigationBar(
          selectedItemColor: Theme.of(context).primaryColor,
          unselectedItemColor: Colors.grey,
          showUnselectedLabels: true,
          currentIndex: _pageIndex,
          type: BottomNavigationBarType.fixed,
          items: [
            _barItem(Images.home, "Home", 0),
            _barItem(Images.list, "Login", 1),
            _barItem(Images.order_bag, "Sign Up", 2),
            // _barItem(Images.order_bag, getTranslated('favourite', context), 3),
            // _barItem(Images.order_list, getTranslated('my_order', context), 4),
            // _barItem(Images.location, getTranslated('address', context), 5),
            // _barItem(Images.coupon, getTranslated('coupon', context), 6),
            // _barItem(Images.chat, getTranslated('live_chat', context), 7),
            // _barItem(Images.settings, getTranslated('settings', context), 8),
          ],
          onTap: (int index) {
            _setPage(index);
          },
        ),
        body: PageView.builder(
          controller: _pageController,
          itemCount: _screens.length,
          physics: NeverScrollableScrollPhysics(),
          itemBuilder: (context, index) {
            return _screens[index];
          },
        ),
      ),
    );
  }

  BottomNavigationBarItem _barItem(String icon, String? label, int index) {
    return BottomNavigationBarItem(
      icon: Image.asset(icon,
          color: index == _pageIndex
              ? Theme.of(context).primaryColor
              : Colors.grey,
          width: 25),
      label: label,
    );
  }

  void _setPage(int pageIndex) {
    setState(() {
      _pageController.jumpToPage(pageIndex);
      _pageIndex = pageIndex;
    });
  }
}
