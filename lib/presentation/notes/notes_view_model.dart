import 'package:flutter/cupertino.dart';
import 'package:flutter_note/domain/repository/note_repository.dart';
import 'package:flutter_note/presentation/notes/notes_event.dart';
import 'package:flutter_note/presentation/notes/notes_state.dart';

import '../../domain/model/note.dart';

class NoteViewModel with ChangeNotifier {
  final NoteRepository repository;
  NoteViewModel(this.repository);

  //NotesState _state = NotesState(); // default값 넣은 경우
  NotesState _state = NotesState(notes: []); // required로 한 경우
  NotesState get state => _state;

  Note? _recentlyDeletedNote; // 마지막에 삭제된 노트

  void onEvent(NotesEvent event) {
    // when -> freezed에서 제공하는 함수
    event.when(
      loadNotes: _loadNotes,
      deleteNote: _deleteNote,
      restoreNote: _restoreNote,
    );
  }

  Future<void> _loadNotes() async {
    List<Note> notes = await repository.getNotes();
    _state = state.copyWith(
      notes: notes,
    );
    notifyListeners();
  }

  Future<void> _deleteNote(Note note) async {
    await repository.deleteNote(note);

    _recentlyDeletedNote = note;

    await _loadNotes(); // data 다시 읽어옴
  }

  Future<void> _restoreNote() async {
    if (_recentlyDeletedNote != null) {
      await repository.insertNote(_recentlyDeletedNote!);
      _recentlyDeletedNote = null;

      _loadNotes();
    }
  }
}
