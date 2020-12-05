import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';

class StudentResources extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(title: const Text("ThirdWheel - Student Resources")),
        body: ListView(
          padding: const EdgeInsets.all(16.0),
          children: <Widget>[
          this._buildListItem('StudentVue', 'https://parentvue.olatheschools.com/PXP2_Login_Student.aspx?regenerateSessionId=True', './studentvue.png'),
            this._buildListItem('HomePage','https://www.olatheschools.org/','./homepage.png'),
            this._buildListItem('Math Games', 'https://www.mathgames.com/', './mathgames.png'),
            this._buildListItem('Google Classroom', 'https://classroom.google.com', './classroom.png'),
            this._buildListItem('ClassLink', 'https://launchpad.classlink.com/olatheusd233','./classlink.png'),
            this._buildListItem('Khan Academy','https://www.khanacademy.org/', './khanacademy.png'),
            this._buildListItem('Calculator','https://www.desmos.com/scientific','./desmoslogo.png'),
            this._buildListItem('Educational Videos', 'https://www.youtube.com/results?search_query=cat+videos','./youtube.png'),
            this._buildListItem('Answer To Life And Everything', 'https://www.youtube.com/watch?v=oHg5SJYRHA0','./illuminati.png'),
            this._buildListItem('IT Help Desk', 'https://www.ismycomputeronfire.com/','./ithelpdesk.png'),
    ]
    ));
  }
  Widget _buildListItem(String name, String URL, String icon){
    return ListTile(
        onTap: () => launch(URL),
      title: Text(name),
        leading:(new Image.asset(icon))
    );
  }
}