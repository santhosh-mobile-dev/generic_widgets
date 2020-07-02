class Params {
  final String description;
  final bool title;
  final bool amount;
  final String username;

  Params({this.description, this.title, this.amount, this.username});

  factory Params.fromJSON(Map<String, dynamic> json) {
    return Params(
        description: json['description'],
        title: json['title'],
        amount: json['amount'],
        username: json['to_username']);
  }
}
