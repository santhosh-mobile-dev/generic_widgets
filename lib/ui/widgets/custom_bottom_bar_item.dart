import 'package:flutter/material.dart';

class BottomBarItem {
  const BottomBarItem(this.title, this.icon);
  final String title;
  final IconData icon;
}

 const List<BottomBarItem> allItems = <BottomBarItem>[
  BottomBarItem('Dashboard', Icons.home),
  BottomBarItem('Wallet', Icons.account_balance_wallet),
  BottomBarItem('Notifications', Icons.notification_important),
  BottomBarItem('Profile', Icons.person)
];