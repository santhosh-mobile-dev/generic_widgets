import 'dart:convert';
import 'dart:io';
import 'package:flutter/cupertino.dart';
import 'package:genericwidgetapp/constants/api.dart';
import 'package:http/http.dart' as http;

import 'package:genericwidgetapp/models/notifications.dart';

class NotificationsDataSource extends ChangeNotifier {
  List<Notificationn> notifications = [];

  void fetchNotifications() async {
    final response = await http.get(Api.base_Url,headers: {HttpHeaders.authorizationHeader: Api.token},);
    Map<String, dynamic> responseJson = json.decode(response.body);

    for (Map<String, dynamic> json in responseJson['notifications']) {
      Notificationn notification = Notificationn.fromJSON(json);
      notifications.add(notification);
      notifyListeners();
    }

  }

  @override
  void notifyListeners() {
    super.notifyListeners();
  }
}
