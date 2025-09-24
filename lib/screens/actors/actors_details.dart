import 'package:first_app/data/actor_model.dart';
import 'package:flutter/material.dart';

class ActorsDetails extends StatelessWidget {
  const ActorsDetails({super.key, required this.model});
  final ActorModel model;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(model.fullName),
        backgroundColor: Color(0xff1D1F24),
        foregroundColor: Colors.white,
      ),
      body: SingleChildScrollView(
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              SizedBox(
                width: double.infinity,
                child: Hero(
                  tag: model,
                  child: Image.network(model.image, fit: BoxFit.fill),
                ),
              ),

              Text(
                model.nickname,
                style: TextStyle(fontWeight: FontWeight.bold, fontSize: 25),
              ),
              Text(
                model.hogwartsHouse,
                style: TextStyle(fontWeight: FontWeight.bold, fontSize: 25),
              ),
              Text(
                model.interpretedBy,
                style: TextStyle(fontWeight: FontWeight.bold, fontSize: 25),
              ),
              Text('Children : '),
              for (String child in model.children) Text(child),
              Text('Birthday Date : ${model.birthdate}'),
            ],
          ),
        ),
      ),
    );
  }
}
