import 'dart:convert';
import 'package:first_app/data/actor_model.dart';
import 'package:first_app/widgets/actor_list.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart';

class ActorScreen extends StatefulWidget {
  const ActorScreen({super.key});

  @override
  State<ActorScreen> createState() => _ActorScreenState();
}

class _ActorScreenState extends State<ActorScreen> {
  final List actors = [];

  @override
  void initState() {
    super.initState();
    // fetchActors();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Actors'),
        centerTitle: true,
        backgroundColor: Colors.grey,
        foregroundColor: Colors.white,
      ),
      body: ListView.builder(
        itemBuilder: (BuildContext context, int index) {
          return ActorList(model: actors[index]);
        },
        itemCount: actors.length,
      ),
    );
  }

  fetchActors() async {
    Response data = await get(
      Uri.parse('https://potterapi-fedeperin.vercel.app/en/characters'),
    );
    // print(data.body);
    var respone = jsonDecode(data.body);
    for (Map map in respone) {
      ActorModel model = ActorModel.fromjson(map);
      actors.add(model);
    }
    setState(() {});
  }
}
