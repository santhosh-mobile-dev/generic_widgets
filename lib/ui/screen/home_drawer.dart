import 'package:flutter/material.dart';
import 'package:genericwidgetapp/ui/widgets/custom_list_tile.dart';

class HomeDrawer extends StatelessWidget {

  Widget container(){
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
                image: DecorationImage(image: AssetImage("assets/images/person1.png"),
                fit: BoxFit.fill
                ),
              ),
            ),
            Text("Name", style: TextStyle(fontSize: 22.0, color: Colors.white),)
          ],
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: Column(
        children: <Widget>[
          container(),
          CustomListTile(Icons.person, "About User"),
          CustomListTile(Icons.group, "Community"),
          CustomListTile(Icons.settings, "Settings"),
          CustomListTile(Icons.arrow_back, "Logout"),
        ],
      ),
    );
  }
}
