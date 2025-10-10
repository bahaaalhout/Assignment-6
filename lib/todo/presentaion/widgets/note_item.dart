import 'package:first_app/todo/data/note_model.dart';
import 'package:first_app/todo/presentaion/provider/note_provider.dart';
import 'package:first_app/widgets/text_input.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class NoteItem extends StatelessWidget {
  NoteItem({
    super.key,
    required this.title,
    required this.onDismissed,
    required this.subTitle,
    required this.note,
  }) {
    _titleController.text = note.title;
    _subTitleController.text = note.subTitle;
  }
  final String title;
  final String subTitle;
  final void Function(DismissDirection)? onDismissed;
  final NoteModel note;
  final TextEditingController _titleController = TextEditingController();
  final TextEditingController _subTitleController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Dismissible(
      onDismissed: onDismissed,
      key: UniqueKey(),
      background: Container(
        color: Colors.red,
        child: Center(
          child: Icon(Icons.remove_circle_sharp, color: Colors.white),
        ),
      ),
      child: Card(
        color: Colors.amber[300],
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(15), // rounded corners
        ),
        child: ListTile(
          title: Text(title),
          subtitle: Text(subTitle),
          onTap: () => showModalBottomSheet(
            context: context,
            builder: (context) => Column(
              children: [
                Text("Update Note"),
                TextInput(
                  hint: _titleController.text,
                  controller: _titleController,
                ),
                TextInput(
                  hint: _subTitleController.text,
                  controller: _subTitleController,
                ),
                TextButton(
                  onPressed: () {
                    var updatedNote = NoteModel(
                      id: note.id,
                      title: _titleController.text,
                      subTitle: _subTitleController.text,
                    );
                    Provider.of<NoteProvider>(
                      context,
                      listen: false,
                    ).updateNote(updatedNote);
                    _titleController.clear();
                    _subTitleController.clear();

                    Navigator.pop(context);
                  },
                  child: Text('Update Note'),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
