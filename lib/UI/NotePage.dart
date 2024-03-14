import 'package:flutter/material.dart';

class NotePage extends StatefulWidget {
  @override
  _NotePageState createState() => _NotePageState();
}

class _NotePageState extends State<NotePage> {
  final _notesList = <Note>[];
  final _titleController = TextEditingController();
  final _contentController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(gradient:LinearGradient(
          begin: Alignment.topLeft,
          end: Alignment.bottomRight,
          colors: [Color(0xffafc2e6), Color(0xffc8caf0).withOpacity(0.89)])),
      child: Scaffold(
        backgroundColor: Colors.transparent,
        appBar: AppBar(title: Text('Notes App'),backgroundColor: Colors.transparent,),
        body: Column(
          children: [
            Padding(
              padding: EdgeInsets.all(16),
              child: TextField(
                controller: _titleController,
                decoration: InputDecoration(labelText: 'Title',labelStyle: TextStyle(color: Colors.white),
                    border: OutlineInputBorder(borderRadius:BorderRadius.circular(27),
                        borderSide: BorderSide(color: Colors.white)),
                    focusedBorder: OutlineInputBorder(borderSide: BorderSide(color:Colors.white )),
                    disabledBorder: OutlineInputBorder(borderSide: BorderSide(color: Colors.white)),
                    enabledBorder: OutlineInputBorder(borderSide: BorderSide(color: Colors.white),borderRadius: BorderRadius.circular(27))

                ),
              ),
            ),
            Padding(
              padding: EdgeInsets.all(16),
              child: TextField(
                controller: _contentController,
                decoration: InputDecoration(labelText: 'Content',labelStyle: TextStyle(color: Colors.white),
                    border: OutlineInputBorder(borderRadius:BorderRadius.circular(27),
                        borderSide: BorderSide(color: Colors.white)),
                    focusedBorder: OutlineInputBorder(borderSide: BorderSide(color:Colors.white )),
                  disabledBorder: OutlineInputBorder(borderSide: BorderSide(color: Colors.white)),
                  enabledBorder: OutlineInputBorder(borderSide: BorderSide(color: Colors.white),borderRadius: BorderRadius.circular(27))

                    ),
                maxLines: null,
              ),
            ),
            Material(
              color: Colors.transparent,
              elevation: 20,
              child: ElevatedButton(
                onPressed: () {
                  setState(() {
                    _notesList.add(Note(
                      title: _titleController.text,
                      content: _contentController.text,
                    ));
                    _titleController.clear();
                    _contentController.clear();
                  });
                },
                child: Text('Add Note',style: TextStyle(fontSize: 19,color: Colors.black),),
              ),
            ),
            Expanded(
              child: ListView.builder(
                itemCount: _notesList.length,
                itemBuilder: (context, index) {
                  final note = _notesList[index];
                  return Card(
                    elevation: 4,
                    margin: EdgeInsets.all(8),
                    child: ListTile(
                      title: Text(note.title),
                      subtitle: Text(note.content),
                    ),
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
class Note {
  final String title;
  final String content;

  Note({required this.title, required this.content});
}