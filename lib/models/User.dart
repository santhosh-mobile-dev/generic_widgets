class User {
  String guid;
  String name;
  int iconTime;

  User({this.guid,this.name,this.iconTime});

  factory User.fromJSON(Map<String, dynamic> json) {
    return User(
      guid: json['guid'],
      name: json['name'],
      iconTime: json['iconTime'],
    );
  }
}
