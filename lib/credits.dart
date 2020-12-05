import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';

class Credits extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(title: const Text("ThirdWheel - Credits")),
        body: ListView(
            padding: const EdgeInsets.all(16.0),
            children: <Widget>[
              this._buildListItem('Andrew G','https://github.com/jayhawker6'),
              this._buildListItem('Don Davis','https://github.com/DonTheDinosaur'),
              this._buildListItem('Alex Rawson', 'https://github.com/zombiepigdragon'),
              this._buildListItem('Github Page', 'https://github.com/DonTheDinosaur/olatheeasthackathon'),
              this._buildListItemnoURL('Made for the Olathe East 2020 December Hackathon using Flutter, a framework, Dart, a language, in Android studio, a studio. We found that all of these were pretty bad.'),
            ]
        ));
  }
  Widget _buildListItem(String name, String URL){
    return ListTile(
      onTap: () => launch(URL),
        title: Text(name),
    );
  }
  Widget _buildListItemnoURL(String name){
    return ListTile(
      title: Text(name),
    );
  }
}