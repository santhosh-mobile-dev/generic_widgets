class Notificationn {
  final String description;

  Notificationn({this.description});

  factory Notificationn.fromJSON(Map<String, dynamic> json) {
    return Notificationn(
      description: json['description'],
    );
  }
}
