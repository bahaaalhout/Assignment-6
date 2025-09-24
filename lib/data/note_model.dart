class NoteModel {
  final String title;
  final String subTitle;

  NoteModel({required this.title, required this.subTitle});
  Map<String, dynamic> toJson() => {'title': title, 'subTitle': subTitle};
  factory NoteModel.formJson(Map json) {
    return NoteModel(title: json['title'], subTitle: json['subTitle']);
  }
}
