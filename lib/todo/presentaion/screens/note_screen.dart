import 'package:first_app/todo/data/note_model.dart';
import 'package:first_app/todo/presentaion/provider/note_provider.dart';
import 'package:first_app/todo/presentaion/widgets/note_item.dart';
import 'package:first_app/widgets/text_input.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class NoteScreen extends StatefulWidget {
  const NoteScreen({super.key});

  @override
  State<NoteScreen> createState() => _NoteScreenState();
}

class _NoteScreenState extends State<NoteScreen> {
  final TextEditingController _titleController = TextEditingController();
  final TextEditingController _subtitleController = TextEditingController();
  static const String noteKey = 'noteKey';

  @override
  Widget build(BuildContext context) {
    var noteProvider = Provider.of<NoteProvider>(context);
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
                    onPressed: () async {
                      var note = NoteModel(
                        title: _titleController.text,
                        subTitle: _subtitleController.text,
                      );
                      noteProvider.addNote(note);
                      _titleController.clear();
                      _subtitleController.clear();

                      Navigator.pop(context);
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
      body: Consumer(
        builder: (context, value, child) {
          return noteProvider.notes.isEmpty
              ? Center(child: Text('There is no note here'))
              : ListView.builder(
                  itemCount: noteProvider.notes.length,
                  itemBuilder: (BuildContext context, int index) {
                    return NoteItem(
                      title: noteProvider.notes[index].title,
                      subTitle: noteProvider.notes[index].subTitle,
                      onDismissed: (e) {
                        noteProvider.removeNote(noteProvider.notes[index]);
                      },
                      note: noteProvider.notes[index],
                    );
                  },
                );
        },
      ),
    );
  }
}
