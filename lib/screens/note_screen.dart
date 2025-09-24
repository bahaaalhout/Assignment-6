import 'dart:convert';

import 'package:first_app/data/note_model.dart';
import 'package:first_app/widgets/note.dart';
import 'package:first_app/widgets/text_input.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

class NoteScreen extends StatefulWidget {
  const NoteScreen({super.key});

  @override
  State<NoteScreen> createState() => _NoteScreenState();
}

class _NoteScreenState extends State<NoteScreen> {
  final TextEditingController _titleController = TextEditingController();
  final TextEditingController _subtitleController = TextEditingController();
  List<NoteModel> notes = [];
  static const String noteKey = 'noteKey';

  @override
  void initState() {
    super.initState();
    getNote();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Notes'),
        backgroundColor: Colors.amber[400],
        centerTitle: true,
      ),
      floatingActionButton: TextButton(
        onPressed: () {
          showModalBottomSheet(
            context: context,
            builder: (context) => Container(
              child: Column(
                children: [
                  Text("New Note"),
                  TextInput(hint: 'Title', controller: _titleController),
                  TextInput(hint: 'SubTitle', controller: _subtitleController),

                  TextButton(
                    onPressed: () {
                      setState(() {
                        notes.add(
                          NoteModel(
                            title: _titleController.text,
                            subTitle: _subtitleController.text,
                          ),
                        );
                        _titleController.clear();
                        _subtitleController.clear();
                        saveNote();
                        Navigator.pop(context);
                      });
                    },
                    child: Text('Add Note'),
                  ),
                ],
              ),
            ),
          );
        },
        style: TextButton.styleFrom(
          backgroundColor: Colors.amber,
          iconColor: Colors.white,
        ),

        child: Text('+'),
      ),
      body: ListView.builder(
        itemCount: notes.length,
        itemBuilder: (BuildContext context, int index) {
          return NoteWidget(
            title: notes[index].title,
            subTitle: notes[index].subTitle,
            onDismissed: (e) {
              notes.removeAt(index);
              saveNote();
            },
          );
        },
      ),
    );
  }

  saveNote() async {
    var prefs = await SharedPreferences.getInstance();

    List<String> newList = notes
        .map((note) => jsonEncode(note.toJson()))
        .toList();
    prefs.setStringList(noteKey, newList);
  }

  getNote() async {
    final prefs = await SharedPreferences.getInstance();
    final noteStrings = prefs.getStringList(noteKey);

    if (noteStrings != null) {
      setState(() {
        notes = noteStrings
            .map((note) => NoteModel.formJson(jsonDecode(note)))
            .toList();
      });
    }
  }
}
