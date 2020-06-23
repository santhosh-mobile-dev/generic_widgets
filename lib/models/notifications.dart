import 'package:genericwidgetapp/models/User.dart';

class Notificationn {
  final String description;
  final String filter;
  final String uuid;
  final String status;
  final User user;
  final int timeCreated;

  Notificationn(
      {this.description,
      this.filter,
      this.user,
      this.timeCreated,
      this.uuid,
      this.status});

  factory Notificationn.fromJSON(Map<String, dynamic> json) {
    return Notificationn(
        description: json['description'],
        filter: json['filter'],
        user: User.fromJSON(json['entityObj']),
        timeCreated: json['time_created'],
        uuid: json['uuid'],
        status: json['status']);
  }
}
