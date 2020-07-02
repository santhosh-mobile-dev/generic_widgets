import 'file:///C:/Users/Admin/Documents/GitHub/generic_widgets/lib/models/notification/User.dart';
import 'file:///C:/Users/Admin/Documents/GitHub/generic_widgets/lib/models/notification/entity.dart';
import 'file:///C:/Users/Admin/Documents/GitHub/generic_widgets/lib/models/notification/params.dart';

class Notificationn {
  final String description;
  final String filter;
  final String uuid;
  final String guid;
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
    this.guid,
  });

  factory Notificationn.fromJSON(Map<String, dynamic> json) {
    return Notificationn(
      description: json['description'],
      filter: json['filter'],
      user: User.fromJSON(json['ownerObj']),
      timeCreated: json['time_created'],
      uuid: json['uuid'],
      status: json['status'],
      entityObj: EntityObj.fromJSON(json['ownerObj']),
      params: Params.fromJSON(json['ownerObj']),
      guid: json['guid'],
    );
  }
}
