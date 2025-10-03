class NoteModel {
  final String title;
  final String subTitle;
  final int id;

  NoteModel({required this.title, required this.subTitle, this.id = 0});
  Map<String, dynamic> toJson() => {'title': title, 'subTitle': subTitle};
  NoteModel.fromJson(Map json)
    : title = json['title'],
      subTitle = json['subTitle'],
      id = json['id'];
}
