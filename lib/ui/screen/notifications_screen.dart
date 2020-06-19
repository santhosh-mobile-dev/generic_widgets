import 'package:flutter/material.dart';
import 'package:genericwidgetapp/datasource/notifications.dart';
import 'package:genericwidgetapp/models/notifications.dart';

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

    ListTile notificationTile = ListTile(
      title: Text(notification.filter),
    );

    return notificationTile;
  }

  @override
  Widget build(BuildContext context) {
    print(dataSource.notifications.length);
    return Scaffold(
      body: dataSource.notifications.length == 0
          ? Center(child: CircularProgressIndicator())
          :  ListView.separated(
        padding: EdgeInsets.symmetric(vertical: 8.0),
        itemCount: dataSource.notifications.length,
        itemBuilder: buildItem,
        separatorBuilder: (_, __) => Divider(),
      ),
    );
  }
}
