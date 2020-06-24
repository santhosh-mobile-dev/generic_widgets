import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_slidable/flutter_slidable.dart';
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

    return SingleChildScrollView(
      child: Container(
        child: Column(
          children: <Widget>[
            Container(
              child: Slidable(
                actionPane: SlidableDrawerActionPane(),
                actions: <Widget>[
                  IconSlideAction(
                    caption: 'Mark as Read',
                    color: Colors.deepPurple[200],
                    icon: notification.status == "read"
                        ? Icons.check_box
                        : Icons.check_box_outline_blank,
                    onTap: () => dataSource.readNotifications(
                        dataSource.notifications[indexPath].uuid),
                  ),
                ],
                secondaryActions: <Widget>[
                  IconSlideAction(
                    caption: 'Delete',
                    color: Colors.red,
                    icon: Icons.delete,
                    onTap: () => dataSource.deleteNotification(
                        dataSource.notifications[indexPath].uuid),
                  ),
                ],
                child: ListTile(
                  onTap: () {},
                  leading: CircleAvatar(
                    radius: 22.0,
                    backgroundImage: new NetworkImage(Utils.getImagePath(
                        notification.user.guid, notification.user.iconTime)),
                  ),
                  trailing: Container(
                    margin: EdgeInsets.all(8.0),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: <Widget>[
                        Text(
                          timeDifference,
                          style: TextStyle(fontSize: 12.0, color: Colors.grey),
                        )
                      ],
                    ),
                  ),
                  title: Text("${notification.user.name}" ?? ''),
                  subtitle: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: <Widget>[
                      notification.filter == 'like'
                          ? Text('${notification.user.name} liked your post')
                          : notification.filter == 'comment'
                              ? Text(
                                  '${notification.user.name} commented on your post')
                              : notification.filter == 'downvote'
                                  ? Text('${notification.user.name} down voted')
                                  : notification.filter == 'friends'
                                      ? Text(
                                          '${notification.user.name} started following you')
                                      : notification.filter == 'tag'
                                          ? Text(
                                              '${notification.user.name} tagged you in a post')
                                          : notification.filter ==
                                                  'messenger_invite'
                                              ? Text(
                                                  '${notification.user.name} wants to chat with you!')
                                              : notification.filter ==
                                                      'group_join_request'
                                                  ? Text(
                                                      '${notification.user.name} requested to join ${notification.entityObj != null ? notification.entityObj.name : ""}')
                                                  : notification.filter ==
                                                          'group_invite'
                                                      ? Text(
                                                          '${notification.user.name} invited you to join ${notification.entityObj != null ? notification.entityObj.name : ""}')
                                                      : notification.filter ==
                                                              'group_kick'
                                                          ? Text(
                                                              '${notification.user.name} kicked you out of ${notification.entityObj != null ? notification.entityObj.name : ""}')
                                                          : notification
                                                                      .filter ==
                                                                  'group_queue_add'
                                                              ? Text(
                                                                  '${notification.user.name} added you to the queue')
                                                              : notification
                                                                          .filter ==
                                                                      'group_queue_approve'
                                                                  ? Text(
                                                                      '${notification.user.name} approved to add you to the queue')
                                                                  : notification
                                                                              .filter ==
                                                                          'group_queue_reject'
                                                                      ? Text(
                                                                          '${notification.user.name} rejected your request to add you to the queue')
                                                                      : notification.filter ==
                                                                              'create_admin_group'
                                                                          ? Text(
                                                                              '${notification.user.name} created the group')
                                                                          : notification.filter == 'group_join_reject'
                                                                              ? Text('${notification.entityObj.name} rejected your request to join the group')
                                                                              : notification.filter == 'wire_happened' ? Text('you have successful contributed') : notification.filter == 'remind' ? Text('${notification.user.name} reposted ') : notification.filter == 'group_join_accept' ? Text('${notification.user.name} has joined ${notification.entityObj != null ? notification.entityObj.name : ""}') : notification.filter == 'boost_accept' ? Text('${notification.user.name} have accepted the boost') : notification.filter == 'boost_reject' ? Text('${notification.user.name} have rejected the boost') : Container(),
                    ],
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
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
