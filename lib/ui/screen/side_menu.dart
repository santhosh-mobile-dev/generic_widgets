import 'package:flutter/material.dart';
import 'package:genericwidgetapp/ui/widgets/custom_list_tile.dart';

class SideMenu extends StatelessWidget {
  Widget container() {
    return Container(
      width: double.infinity,
      padding: EdgeInsets.all(20),
      color: Colors.deepPurple,
      child: Center(
        child: Column(
          children: <Widget>[
            Container(
              width: 100.0,
              height: 100.0,
              margin: EdgeInsets.only(top: 30.0, bottom: 10.0),
              decoration: BoxDecoration(
                shape: BoxShape.circle,
                image: DecorationImage(
                    image: AssetImage("assets/images/person1.png"),
                    fit: BoxFit.fill),
              ),
            ),
            Text(
              "Name",
              style: TextStyle(fontSize: 22.0, color: Colors.white),
            )
          ],
        ),
      ),
    );
  }

  Widget drawer() {
    return Drawer(
      child: Column(
        children: <Widget>[
          container(),
          CustomListTile(
            iconData: Icons.person,
            text: "About User",
          ),
          CustomListTile(
            iconData: Icons.group,
            text: "Community",
          ),
          CustomListTile(
            iconData: Icons.settings,
            text: "Settings",
          ),
          CustomListTile(
            iconData: Icons.arrow_back,
            text: "Logout",
          ),
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return drawer();
  }
}
