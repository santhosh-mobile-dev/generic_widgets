import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:genericwidgetapp/datasource/notifications.dart';
import 'package:genericwidgetapp/models/notifications.dart';
import 'package:genericwidgetapp/time_difference.dart';
import 'package:genericwidgetapp/utils.dart';

class NotificationsScreen extends StatefulWidget {
  @override
  _NotificationsScreenState createState() => _NotificationsScreenState();
}

class _NotificationsScreenState extends State<NotificationsScreen> {
  NotificationsDataSource dataSource = NotificationsDataSource();

  @override
  void initState() {
    dataSource.addListener(dataSourceDidChange);
    dataSource.fetchNotifications();
    super.initState();
  }

  void dataSourceDidChange() {
    setState(() {});
  }

  String oldData = "";

  String whenPostAdded(int timeStamp) {
    String whichOne = "";

    var date = new DateTime.fromMillisecondsSinceEpoch(timeStamp * 1000);
    DateTime now = DateTime.now();

    print("");
    if (date == now) {
      whichOne = "New";
    } else {
      whichOne = "Old";
    } // present notification date and previous notification

    if (whichOne == oldData) {
      oldData = whichOne;
      return "";
    } else {
      oldData = whichOne;
      return whichOne;
    }
  }

  Widget buildItem(BuildContext context, int indexPath) {
    final Notificationn notification = dataSource.objectAtIndexPath(indexPath);
    String timeDifference = TimeDifference.postAddedTimeDifference(notification.timeCreated);
    String headerText = whenPostAdded(notification.timeCreated);

    return Column(
      children: <Widget>[
        headerText != '' ? (
            Container(
            margin: EdgeInsets.all(15.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: <Widget>[
                Text(headerText, style: TextStyle(fontSize: 16.0),),
                Icon(Icons.filter_list, size: 16.0,)
              ],
            )))
            : Container(),
        Container(
          child: Dismissible(
            key: Key(notification.user.guid),
            background: Container(color: Colors.red),
            direction: DismissDirection.endToStart,
            onDismissed: (direction){
              setState(() {
              });
            },
            child: ListTile(
              leading: CircleAvatar(
                radius: 22.0,
                backgroundImage: new NetworkImage(Utils.getImagePath(
                    notification.user.guid, notification.user.iconTime)),
              ),
              title: Text(notification.user.name),
              subtitle: Text(notification.description),
              trailing: Container(
                margin: EdgeInsets.all(8.0),
                child: Column(
                  children: <Widget>[
                    Icon(Icons.more_vert),
                    Text(timeDifference, style: TextStyle(fontSize: 12.0, color: Colors.grey),)
                  ],
                ),
              ),
            ),
          ),
        ),
      ],
    );
  }

  Widget body(BuildContext context) {
    return Scaffold(
      body: dataSource.notifications.length == 0
          ? Center(child: CircularProgressIndicator())
          : ListView.separated(
              padding: EdgeInsets.symmetric(vertical: 8.0),
              itemCount: dataSource.notifications.length,
              itemBuilder: buildItem,
              separatorBuilder: (_, __) => Divider(),
            ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return body(context);
  }
}
