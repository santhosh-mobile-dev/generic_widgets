import 'dart:convert';
import 'dart:io';

import 'package:flutter/cupertino.dart';
import 'package:genericwidgetapp/constants/api.dart';
import 'package:http/http.dart' as http;

import 'file:///C:/Users/Admin/Documents/GitHub/generic_widgets/lib/models/notification/notifications.dart';

class NotificationsDataSource extends ChangeNotifier {
  List<Notificationn> notifications = [];

  void fetchNotifications() async {
    final response = await http.get(
      Api.base_Url,
      headers: {HttpHeaders.authorizationHeader: Api.token},
    );
    print(response.body);
    Map<String, dynamic> responseJson = json.decode(response.body);
    for (Map<String, dynamic> json in responseJson['notifications']) {
      Notificationn notification = Notificationn.fromJSON(json);
      notifications.add(notification);
      notifyListeners();
    }
  }

  void deleteNotification(String uuid) async {
    print('notification ${uuid}');
    final response = await http.delete("${Api.deleteNotification_url}$uuid",
        headers: {HttpHeaders.authorizationHeader: Api.token});
    print(response.body);
    notifyListeners();
  }

  void readNotifications(String uuid) async {
    final response = await http.post("${Api.readNotification_url}/$uuid",
        body: {"uuids": "[$uuid]"},
        headers: {HttpHeaders.authorizationHeader: Api.token});
    print(response.body);
    notifyListeners();
  }

  Notificationn objectAtIndexPath(int indexPath) {
    if (indexPath < notifications.length) {
      return notifications.elementAt(indexPath);
    }
    return null;
  }

  @override
  void notifyListeners() {
    super.notifyListeners();
  }
}
