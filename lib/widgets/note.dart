import 'package:flutter/material.dart';

class NoteWidget extends StatelessWidget {
  const NoteWidget({
    super.key,
    required this.title,
    required this.onDismissed,
    required this.subTitle,
  });
  final String title;
  final String subTitle;
  final void Function(DismissDirection)? onDismissed;
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
        child: ListTile(title: Text(title), subtitle: Text(subTitle)),
      ),
    );
  }
}
