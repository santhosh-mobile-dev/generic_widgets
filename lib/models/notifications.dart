class Notificationn {
  final String description;
  final String filter;

  Notificationn({this.description,this.filter});

  factory Notificationn.fromJSON(Map<String, dynamic> json) {
    return Notificationn(
      description: json['description'],
      filter: json['filter'],
    );
  }
}
