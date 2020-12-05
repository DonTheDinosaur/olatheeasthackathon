import 'package:flutter/material.dart';
import 'class_links.dart';
import 'homework.dart';
import 'schedule.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Olathe East Hackathon',
      home: HomePage(),
    );
  }
}

class HomePage extends StatelessWidget {
  final _biggerFont = const TextStyle(fontSize: 18.0);

  Widget _buildListItem(BuildContext context, String name, Widget next_page) {
    return new ListTile(
      title: Text(name, style: this._biggerFont),
      onTap: () {
        Navigator.push(
          context,
          MaterialPageRoute(builder: (context) => next_page),
        );
      }
    );
  }

  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      appBar: AppBar(title: const Text("Hackathon App")),
        body: ListView(
          padding: const EdgeInsets.all(16.0),
          children: <Widget>[
            this._buildListItem(context, "Classes", new ClassLinks()),
            this._buildListItem(context, "Homework", new Homework()),
            this._buildListItem(context, "Schedule", new Schedule())
          ],
        ),
    );
  }
}
