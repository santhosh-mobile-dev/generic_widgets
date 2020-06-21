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

  Widget buildItem(BuildContext context, int indexPath) {
    final Notificationn notification = dataSource.objectAtIndexPath(indexPath);
    String timeDifference =
        TimeDifference.postAddedTimeDifference(notification.timeCreated);

    ListTile notificationTile = ListTile(
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
            Text(
              timeDifference,
              style: TextStyle(fontSize: 12.0, color: Colors.grey),
            )
          ],
        ),
      ),
    );
    return notificationTile;
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
