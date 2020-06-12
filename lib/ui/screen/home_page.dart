import 'package:flutter/material.dart';
import 'package:genericwidgetapp/ui/screen/dashboard_screen.dart';
import 'package:genericwidgetapp/ui/screen/notifications_screen.dart';
import 'package:genericwidgetapp/ui/screen/profile_screen.dart';
import 'package:genericwidgetapp/ui/screen/wallet_screen.dart';

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
      items: [
        BottomNavigationBarItem(
          icon: new Icon(Icons.home),
          title: new Text('Dashboard'),
        ),
        BottomNavigationBarItem(
          icon: new Icon(Icons.account_balance_wallet),
          title: new Text('Wallet'),
        ),
        BottomNavigationBarItem(
          icon: Icon(Icons.notification_important),
          title: Text('Notifications'),
        ),
        BottomNavigationBarItem(
          icon: Icon(Icons.person),
          title: Text('Profile'),
        ),
      ],
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Home"),
      ),
      bottomNavigationBar: bottomNavigationBar(),
      body: Center(child: _children[_currentIndex]),
    );
  }
}
