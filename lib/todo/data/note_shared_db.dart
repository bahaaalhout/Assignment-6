import 'dart:convert';

import 'package:first_app/todo/data/note_model.dart';
import 'package:shared_preferences/shared_preferences.dart';

class NoteSharedDb {
  static late SharedPreferences prefs;

  static const String noteKey = 'note';

  static Future<void> init() async {
    prefs = await SharedPreferences.getInstance();
  }

  static saveNote(List<NoteModel> notes) {
    List<String> newList = notes
        .map((note) => jsonEncode(note.toJson()))
        .toList();

    prefs.setStringList(noteKey, newList);
  }

  static Future<List<NoteModel>> getNotes() async {
    final prefs = await SharedPreferences.getInstance();
    final noteStrings = prefs.getStringList(noteKey);
    List<NoteModel> notes = [];
    if (noteStrings != null) {
      notes = noteStrings
          .map((note) => NoteModel.fromJson(jsonDecode(note)))
          .toList();
    }
    return notes;
  }
}
