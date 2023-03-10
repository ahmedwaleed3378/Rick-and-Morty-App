class Character {
  late int char_id;
  late String name;
  late String status;
  late String gender;
  // late List<dynamic> occupation;
  late List<dynamic> appearance;
  late String nickname;
  // late String portrayed;
  late String category;
  late String img;
  late Location location;
  Character.fromJson(Map<String, dynamic> json) {
    char_id = json['id'];
    name = json['name'];
    status = json['status'];
    // occupation = json['occupation'];
    appearance = json['episode'];
    nickname = json['name'];
    // portrayed = json['portrayed'];
    category = json['species'];
    img = json['image'];
    gender = json['gender'];
    location=Location.fromJson(json['location']);
  }
}
class Location{
  late String locName;
  Location.fromJson(Map<String, dynamic> json){
    locName=json['name'];
  }
}
