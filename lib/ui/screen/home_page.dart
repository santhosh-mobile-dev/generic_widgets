import 'package:flutter/material.dart';
import 'package:genericwidgetapp/ui/screen/profile_screen.dart';
import 'package:genericwidgetapp/ui/screen/wallet_screen.dart';
import 'package:genericwidgetapp/ui/widgets/bottom_bar_item.dart';

import 'dashboard_screen.dart';
import 'notifications_screen.dart';

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  int _currentIndex = 0;

  final List _children = [
    DashboardScreen(),
    WalletScreen(),
    NotificationsScreen(),
    ProfileScreen()
  ];

  _changesIndex(int index) {
    setState(() {
      _currentIndex = index;
    });
  }

  Widget bottomNavigationBar() {
    return BottomNavigationBar(
        currentIndex: _currentIndex,
        onTap: _changesIndex,
        type: BottomNavigationBarType.fixed,
        items: allItems.map((BottomBarItem bottomBarItem) {
          return BottomNavigationBarItem(
            icon: Icon(bottomBarItem.icon),
            title: Text(bottomBarItem.title),
          );
        }).toList());
  }

  Widget appBar() {
    return AppBar(
      title: Text('Home'),
      centerTitle: true,
      automaticallyImplyLeading: false,
    );
  }

  Widget screenView(BuildContext context) {
    return Center(child: _children[_currentIndex]);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: appBar(),
      bottomNavigationBar: bottomNavigationBar(),
      body: screenView(context),
    );
  }
}
