class User {
  final String guid;
  final String name;
  final int iconTime;
  final String username;

  User({this.guid, this.name, this.iconTime, this.username});

  factory User.fromJSON(Map<String, dynamic> json) {
    return User(
        guid: json['guid'],
        name: json['name'],
        iconTime: json['iconTime'],
        username: json['username']);
  }
}
