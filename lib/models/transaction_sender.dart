class Sender {

  String guid;
  String type;
  String accessId;
  String name;
  String username;
  String icontime;
  String boostRating;
  int postCount;
  int rating;

  Sender(
      {this.guid,
      this.type,
      this.accessId,
      this.name,
      this.username,
      this.icontime,
      this.boostRating,
      this.postCount,
      this.rating});

  factory Sender.fromJSON(Map<String, dynamic> json) {
    return Sender(
        guid: json['guid'],
        type: json['type'],
        accessId: json['access_id'],
        name: json['name'],
        username: json['amount'],
        icontime: json['icontime'],
        boostRating: json['boost_rating'],
        postCount: json['post_count'],
        rating: json['rating'],
    );
  }
}
