import 'package:flutter/material.dart';
import 'package:flutter_note/domain/repository/note_repository.dart';
import 'package:flutter_note/presentation/add_edit_note/add_edit_note_event.dart';

import '../../domain/model/note.dart';

class AddEditNoteViewModel with ChangeNotifier {
  final NoteRepository repository;

  int _color = Colors.orange.value;

  int get color => _color;

  AddEditNoteViewModel(this.repository);

  void onEvent(AddEditNoteEvent event) {
    event.when(
      changeColor: _changColor,
      saveNote: _saveNote,
    );
  }

  Future<void> _changColor(int color) async {
    _color = color;
    notifyListeners();
  }

  Future<void> _saveNote(int? id, String title, String content) async {
    if (id == null) {
      // 새로 추가할 때
      repository.insertNote(
        Note(
          title: title,
          content: content,
          color: _color,
          timestamp: DateTime.now().millisecondsSinceEpoch, id: null,
        ),
      );
    } else {
      await repository.updateNote(
        Note(
            id: id,
            title: title,
            content: content,
            color: _color,
            timestamp: DateTime.now().millisecondsSinceEpoch),
      );
    }
  }
}
