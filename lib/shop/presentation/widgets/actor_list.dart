import 'package:first_app/shop/data/actor_model.dart';
import 'package:first_app/screens/actors/actors_details.dart';
import 'package:flutter/material.dart';

class ActorList extends StatelessWidget {
  const ActorList({super.key, required this.model});
  final ActorModel model;
  @override
  Widget build(BuildContext context) {
    return ListTile(
      onTap: () => Navigator.push(
        context,
        MaterialPageRoute(builder: (context) => ActorsDetails(model: model)),
      ),

      leading: Image.network(model.image, width: 80, fit: BoxFit.fill),
      title: Text(model.fullName, overflow: TextOverflow.fade),
      subtitle: Text(model.birthdate, overflow: TextOverflow.ellipsis),
    );
  }
}
