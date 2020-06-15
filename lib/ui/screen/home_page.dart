import 'package:flutter/material.dart';
import 'package:genericwidgetapp/ui/screen/custom_bottom_bar.dart';
import 'package:genericwidgetapp/ui/screen/profile_screen.dart';
import 'package:genericwidgetapp/ui/screen/wallet_screen.dart';

import 'dashboard_screen.dart';
import 'notifications_screen.dart';

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage>
    with SingleTickerProviderStateMixin {
  int _currentIndex = 0;

  final List _children = [
    DashboardScreen(),
    WalletScreen(),
    NotificationsScreen(),
    ProfileScreen()
  ];

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
      bottomNavigationBar: CustomBottomNavigationBar(),
      body: screenView(context),
    );
  }
}
