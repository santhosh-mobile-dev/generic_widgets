import 'dart:convert';
import 'dart:io';
import 'package:flutter/cupertino.dart';
import 'package:genericwidgetapp/constants/api.dart';
import 'package:http/http.dart' as http;
import 'package:genericwidgetapp/models/notifications.dart';
import '../constants/api.dart';
import '../models/notifications.dart';
import '../models/notifications.dart';
import '../models/notifications.dart';
import '../models/notifications.dart';

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

  void deleteNotification(String uuid) async{
    print('notification ${uuid}');
    final url = "https://ops.doesntexist.com/api/v1/notifications/";
    final response = await http.delete("$url$uuid", headers: {HttpHeaders.authorizationHeader: Api.token});
    print(response.body);
    if(response.statusCode == 200){
      List<Notificationn> notification = Notificationn.fromJSON(jsonDecode(response.body)) as List<Notificationn>;
      notifications.removeAt(notification[]);
      notifyListeners();
    }
    notifyListeners();
  }

  void readNotifications(String uuid) async {
    final url = "https://ops.doesntexist.com/api/v1/notifications/all/read";
    final response = await http.post(
        "$url/$uuid",
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
