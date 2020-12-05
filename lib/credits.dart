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
              this._buildListItem('Andrew G'),
              this._buildListItem('Don Davis'),
              this._buildListItem('Alex Rawson'),
            ]
        ));
  }
  Widget _buildListItem(String name){
    return ListTile(
        title: Text(name),
    );
  }
}