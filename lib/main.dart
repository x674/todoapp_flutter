import 'package:flutter/material.dart';

void main() {
  runApp(TodoApp());
}

List<String> NotesList = ["Заметка 1"];

class TodoApp extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return _TodoAppState();
  }
}

class _TodoAppState extends State<StatefulWidget> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: Text("Список заметок"),
        ),
        // body: Column(children: NotesList),
        body: ListView.separated(itemBuilder: (context, index) {
          return Note(NotesList[index]);
        }, separatorBuilder: (context, index) => Divider()
            , itemCount: NotesList.length),
        // body: Center(child: Text('Нажми + чтобы добавить заметку!')),
        floatingActionButton: FloatingActionButton(
            onPressed: () {
              setState(() {
                addNoteToList();
              });
            },
            child: const Icon(Icons.add_circle)),
      ),
    );
  }
}

void addNoteToList() {
  NotesList.add("Заметка ${NotesList.length+1}");
}

class Note extends StatelessWidget {
  String text = "";

  Note(String s) {
    text = s;
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Center(child: Text(text)),
      height: 50,
      decoration: BoxDecoration(color: Colors.black12),
    );
  }
}
