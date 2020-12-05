import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';


class Homework {
  String name;
  String url;
  String dueDate;

  static Future<Homework> fromDialog(BuildContext context) async {
    print("Showing popup");
    var notifier = ValueNotifier<Homework>(null);
    var popup = NewClassPopup(notifier);
    await showDialog(
      context: context,
      builder: (context) {
        return SimpleDialog(
          title: Text("Add a assignment"),
          contentPadding: EdgeInsets.all(8.0),
          children: <Widget>[
            popup
          ],
        );
      },
    );
    print("Returning from popup");
    return notifier.value;
  }
}

class NewClassPopup extends StatelessWidget {
  ValueNotifier<Homework> _notifier;

  NewClassPopup(ValueNotifier<Homework> notifier) {
    this._notifier = notifier;
  }

  @override
  Widget build(BuildContext context) {
    GlobalKey<FormState> _formKey = new GlobalKey();
    final _nameController = TextEditingController();
    final _urlController = TextEditingController();
    final _dueDateController = TextEditingController();
    return Form(
      key: _formKey,
      child: Column(
        children: <Widget>[
          TextFormField(
            controller: _nameController,
            validator: (value) {
              if (value == null || value.isEmpty) {
                return "A name is required.";
              }
              return null;
            },
            decoration: InputDecoration(
              labelText: "Name",
            ),
          ),
          TextFormField(
            controller: _urlController,
            validator: (value) {
              if (value == null || value.isEmpty) {
                return "The URL is invalid.";
              }
              return null;
            },
            decoration: InputDecoration(
              labelText: "URL",
            ),
          ),
          TextFormField(
            controller: _dueDateController,
            validator: (value) {
              if (value == null || value.isEmpty) {
                return "Due date is invalid.";
              }
              return null;
            },
            decoration: InputDecoration(
              labelText: "Due Date",
            ),
          ),
          ElevatedButton(
            child: Text("Add"),
            onPressed: () {
              if (_formKey.currentState != null && _formKey.currentState.validate()) {
                print("Button pressed");
                var _class = Homework();
                _class.name = _nameController.text;
                _class.url = _urlController.text;
                _class.dueDate = _dueDateController.text;
                _notifier.value = _class;
                Navigator.pop(context);
              }
            },
          ),
        ],
      ),
    );
  }
}


class HomeworkLinks extends StatefulWidget {
  @override
  _HomeworkLinksState createState() => _HomeworkLinksState();
}

class _HomeworkLinksState extends State<HomeworkLinks> {
  final _classes = <Homework>[];
  final _biggerFont = const TextStyle(fontSize: 18.0);

  Widget _buildSuggestions() {
    return ListView.builder(
        padding: const EdgeInsets.all(16.0),
        itemCount: _classes.length,
        itemBuilder: (context, i) {
          return _buildRow(_classes[i]);
        });
  }

  Widget _buildRow(Homework _class) {
    return ListTile(
      title: Text(
        _class.name,
        style: _biggerFont,
      ),
      onTap: () => launch(_class.url),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('ThirdWheel - Homework')
      ),
      body: _buildSuggestions(),
      floatingActionButton: FloatingActionButton(
        onPressed: newClassPopup,
        child: Icon(Icons.add),
      ),
    );
  }

  void newClassPopup() {
    Homework.fromDialog(context).then((_class) {
      if (_class != null) { // Returns null if cancelled
        setState(() {
          print("Saving state");
          this._classes.add(_class);
        });
      } else {
        print("Cancelled");
      }
    });
  }
}