class User {
  final String guid;
  final String name;
  final int iconTime;
  final String username;
  final String timeCreated;

  User({this.guid, this.name, this.iconTime, this.username, this.timeCreated});

  factory User.fromJSON(Map<String, dynamic> json) {
    return User(
        guid: json['guid'],
        name: json['name'],
        iconTime: json['iconTime'],
        username: json['username'],
        timeCreated: json['time_created']);
  }
}
