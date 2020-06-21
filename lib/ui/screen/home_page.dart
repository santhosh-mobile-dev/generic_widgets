import 'package:flutter/material.dart';
import 'package:genericwidgetapp/ui/screen/side_menu.dart';
import 'package:genericwidgetapp/ui/widgets/bottom_bar_item.dart';

import 'dashboard_screen.dart';
import 'notifications_screen.dart';
import 'profile_screen.dart';
import 'wallet_screen.dart';

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

  Widget screenView(BuildContext context) {
    return Center(child: _children[_currentIndex]);
  }

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
    );
  }

  Widget body(BuildContext context) {
    return Scaffold(
      appBar: appBar(),
      drawer: SideMenu(),
      bottomNavigationBar: bottomNavigationBar(),
      body: screenView(context),
    );
  }

  @override
  Widget build(BuildContext context) {
    return body(context);
  }
}
