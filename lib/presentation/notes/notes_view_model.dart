import 'dart:collection';

import 'package:flutter/cupertino.dart';
import 'package:flutter_note/domain/repository/note_repository.dart';
import 'package:flutter_note/presentation/notes/notes_event.dart';

import '../../domain/model/note.dart';

class NoteViewModel with ChangeNotifier {
  final NoteRepository repository;

  List<Note> _notes =[];
  UnmodifiableListView<Note> get notes => UnmodifiableListView(_notes);

  Note? _recentlyDeletedNote;

  NoteViewModel(this.repository);

  void onEvent(NotesEvent event) {
    event.when(
      loadNotes: _loadNotes,
      deleteNote: _deleteNote,
      restoreNote: _restoreNote,
    );
  }

  Future<void> _loadNotes() async {
    List<Note> notes = await repository.getNotes();
    _notes = notes;
    notifyListeners();
  }

  Future<void> _deleteNote(Note note) async {
    await repository.deleteNote(note);

    _recentlyDeletedNote = note;

    await _loadNotes();
  }

  Future<void> _restoreNote() async {
    if (_recentlyDeletedNote != null) {
      await repository.insertNote(_recentlyDeletedNote!);
      _recentlyDeletedNote = null;

      _loadNotes();
    }
  }
}
