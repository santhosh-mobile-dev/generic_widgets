class CoinsRate {
  final String cap;
  final double rate;
  final String requested;
  final String issued;

  CoinsRate({this.cap, this.rate, this.requested, this.issued});

  factory CoinsRate.fromJson(Map<String, dynamic> json) {
    return CoinsRate(
        cap: json['cap'],
        rate: json['rate'],
        requested: json['requested'],
        issued: json['issued']);
  }
}
