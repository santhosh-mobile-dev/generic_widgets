class Params {
  String description;

  Params({this.description});

  factory Params.fromJSON(Map<String, dynamic> json) {
    return Params(
      description: json['name'],
    );
  }
}
