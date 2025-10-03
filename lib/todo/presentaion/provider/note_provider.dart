import 'package:first_app/todo/data/note_model.dart';
import 'package:first_app/todo/data/note_sqllite_db.dart';
import 'package:flutter/material.dart';

class NoteProvider extends ChangeNotifier {
  List<NoteModel> notes = [];

  addNote(NoteModel noteModel) async {
    int id = await NotesSqliteDb.insertNoteToDb(noteModel);
    NoteModel note = NoteModel(
      title: noteModel.title,
      subTitle: noteModel.subTitle,
      id: id,
    );
    notes.add(note);
    notifyListeners();
  }

  readNote() async {
    var notesList = await NotesSqliteDb.getNotesFromDb();
    notes = notesList;
    notifyListeners();
  }

  removeNote(NoteModel noteModel) {
    NotesSqliteDb.deleteNoteFromDb(noteModel);
    notes.removeWhere((element) => element.id == noteModel.id);

    notifyListeners();
  }

  updateNote(NoteModel noteModel) {
    NotesSqliteDb.updateNoteFromDb(noteModel);
    notifyListeners();
  }
}
