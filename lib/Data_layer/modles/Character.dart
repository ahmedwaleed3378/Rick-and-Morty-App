class Character {
  late int char_id;
  late String name;
  late String status;
  late List<dynamic> occupation;
  late List<dynamic> appearance;
  late List<dynamic> appearanceInBCS;
  late String nickname;
  late String portrayed;
  late String category;
  late String img;
  Character.fromJson(Map<String, dynamic> json) {
    char_id = json['char_id'];
    name = json['name'];
    status = json['status'];
    occupation = json['occupation'];
    appearance = json['appearance'];
    appearanceInBCS = json['better_call_saul_appearance'];
    nickname = json['nickname'];
    portrayed = json['portrayed'];
    category = json['category'];
    img = json['img'];
  }
}
