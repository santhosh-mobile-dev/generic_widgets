import 'package:genericwidgetapp/models/User.dart';
import 'package:genericwidgetapp/models/entity.dart';
import 'package:genericwidgetapp/models/params.dart';

class Notificationn {
  final String description;
  final String filter;
  final String uuid;
  final String status;
  final User user;
  final int timeCreated;
  final EntityObj entityObj;
  final Params params;

  Notificationn({
    this.description,
    this.filter,
    this.user,
    this.timeCreated,
    this.uuid,
    this.status,
    this.params,
    this.entityObj,
  });

  factory Notificationn.fromJSON(Map<String, dynamic> json) {
    return Notificationn(
      description: json['description'],
      filter: json['filter'],
      user: User.fromJSON(json['entityObj']),
      timeCreated: json['time_created'],
      uuid: json['uuid'],
      status: json['status'],
      entityObj: EntityObj.fromJSON(json['entityObj']),
      params: Params.fromJSON(json['entityObj']),
    );
  }
}
