class EntityObj {
  String guid;
  String name;

  EntityObj({this.guid, this.name});

  factory EntityObj.fromJSON(Map<String, dynamic> json) {
    return EntityObj(
      guid: json['guid'],
      name: json['name'],
    );
  }
}
