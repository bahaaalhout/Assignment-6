class ActorModel {
  final String fullName;
  final String nickname;
  final String hogwartsHouse;
  final String interpretedBy;
  final List children;
  final String image;
  final String birthdate;
  final int index;

  ActorModel({
    required this.fullName,
    required this.nickname,
    required this.hogwartsHouse,
    required this.interpretedBy,
    required this.children,
    required this.image,
    required this.birthdate,
    required this.index,
  });

  factory ActorModel.fromjson(Map json) {
    return ActorModel(
      fullName: json['fullName'],
      nickname: json['nickname'],
      hogwartsHouse: json['hogwartsHouse'],
      interpretedBy: json['interpretedBy'],
      children: json['children'],
      image: json['image'],
      birthdate: json['birthdate'],
      index: json['index'],
    );
  }
}

/**
 * {
    "fullName": "Harry James Potter",
    "nickname": "Harry",
    "hogwartsHouse": "Gryffindor",
    "interpretedBy": "Daniel Radcliffe",
    "children": [
      "James Sirius Potter",
      "Albus Severus Potter",
      "Lily Luna Potter"
    ],
    "image": "https://raw.githubusercontent.com/fedeperin/potterapi/main/public/images/characters/harry_potter.png",
    "birthdate": "Jul 31, 1980",
    "index": 0
  },
 */
