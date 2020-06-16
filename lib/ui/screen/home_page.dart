import 'package:flutter/material.dart';
import 'package:genericwidgetapp/ui/screen/custom_bottom_bar.dart';
import 'package:genericwidgetapp/ui/screen/side_menu.dart';
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

  Widget appBar() {
    return AppBar(
      title: Text('Home'),
      centerTitle: true,
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: appBar(),
      drawer: SideMenu(),
      bottomNavigationBar: CustomBottomNavigationBar(),
      body: screenView(context),
    );
  }
}