import 'package:flutter/material.dart';
import 'package:flutter_note/ui/colors.dart';

import '../../domain/model/note.dart';
import '../add_edit_note/add_edit_note_screen.dart';
import 'components/note_item.dart';

class NotesScreen extends StatelessWidget {
  const NotesScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'Your note',
          style: TextStyle(fontSize: 30),
        ),
        actions: [
          IconButton(
            onPressed: () {},
            icon: const Icon(Icons.sort),
          ),
        ],
        elevation: 0, // 음영
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) => AddEditNoteScreen(),
            ),
          );
        },
        child: const Icon(Icons.add),
      ),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: ListView(
          children: [
            NoteItem(
              note: Note(
                title: "title 1",
                content: "content 1",
                color: wisteria.value,
                timestamp: 1,
                id: 1,
              ),
            ),
            NoteItem(
              note: Note(
                title: "title 2",
                content: "content 2",
                color: skyblue.value,
                timestamp: 2,
                id: 2,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
