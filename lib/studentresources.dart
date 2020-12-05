import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';

class StudentResources extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(title: const Text("ThirdWheel"), leading:(new Image.asset('./ThirdWheel.png'))),
        body: ListView(
          padding: const EdgeInsets.all(16.0),
          children: <Widget>[
          this._buildListItem('CrapVue', 'https://parentvue.olatheschools.com/PXP2_Login_Student.aspx?regenerateSessionId=True'),
            this._buildListItem('Math Games', 'https://https://www.mathgames.com/'),
            this._buildListItem('DecentVue', 'https://classroom.google.com'),
            this._buildListItem('Educational Videos', 'https://www.youtube.com/results?search_query=useless+crap+nobody+needs'),
            this._buildListItem('Answer To Life And Everything', 'https://www.youtube.com/watch?v=oHg5SJYRHA0'),
    ]
    ));
  }
  Widget _buildListItem(String name, String URL){
    return ListTile(
        onTap: () => launch(URL),
      title: Text(name),
    );
  }
}