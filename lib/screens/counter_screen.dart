import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

class CounterScreen extends StatefulWidget {
  const CounterScreen({super.key});

  @override
  State<CounterScreen> createState() => _CounterScreenState();
}

class _CounterScreenState extends State<CounterScreen> {
  int counter = 0;
  String counterKey = 'counter';
  @override
  void initState() {
    super.initState();
    getData();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            TextButton(
              onPressed: () {
                setState(() {
                  counter--;
                  store(counter);
                });
              },
              child: Text('-'),
            ),
            Text('$counter'),
            TextButton(
              onPressed: () {
                setState(() {
                  counter++;
                  store(counter);
                });
              },
              child: Text('+'),
            ),
          ],
        ),
      ),
    );
  }

  store(int counter) async {
    var prefs = await SharedPreferences.getInstance();
    prefs.setInt(counterKey, counter);
  }

  getData() async {
    var prefs = await SharedPreferences.getInstance();
    setState(() {
      counter = prefs.getInt(counterKey) ?? 0;
    });
  }
}
