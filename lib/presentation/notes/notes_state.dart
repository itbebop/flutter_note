import 'package:json_annotation/json_annotation.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

import '../../domain/model/note.dart';


part 'notes_state.freezed.dart';

part 'notes_state.g.dart';

@freezed
class NotesState with _$NotesState {
  factory NotesState({
    //@Default([]) List<Note> notes, //view모델에서 초기값 안넣어도 됨
    required List<Note> notes,
  }) = _NotesState;

  factory NotesState.fromJson(Map<String, dynamic> json) => _$NotesStateFromJson(json);
}