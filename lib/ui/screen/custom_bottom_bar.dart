import 'package:flutter/material.dart';
import 'package:genericwidgetapp/ui/widgets/bottom_bar_item.dart';

class CustomBottomNavigationBar extends StatefulWidget {
  @override
  _CustomBottomNavigationBarState createState() =>
      _CustomBottomNavigationBarState();
}

class _CustomBottomNavigationBarState extends State<CustomBottomNavigationBar> {
  int _currentIndex = 0;

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

  @override
  Widget build(BuildContext context) {
    return Container(child: bottomNavigationBar());
  }
}
