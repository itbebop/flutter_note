import 'package:freezed_annotation/freezed_annotation.dart';
import '../../domain/model/note.dart';

part 'notes_event.freezed.dart';

@freezed
abstract class NotesEvent with _$NotesEvent {
  const factory NotesEvent.loadNotes() = LoadNotes;
  const factory NotesEvent.deleteNote(Note note) = DeleteNote;
  const factory NotesEvent.restoreNote() = RestoreNote; // undo기능
}
