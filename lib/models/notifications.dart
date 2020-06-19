import 'package:genericwidgetapp/models/User.dart';

class Notificationn {
  final String description;
  final String filter;
  final User user;

  Notificationn({this.description, this.filter, this.user});

  factory Notificationn.fromJSON(Map<String, dynamic> json) {
    return Notificationn(
      description: json['description'],
      filter: json['filter'],
      user: User.fromJSON(json['entityObj']),
    );
  }
}
