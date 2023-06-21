import 'package:json_annotation/json_annotation.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

import '../../domain/model/note.dart';


part 'notes_state.freezed.dart';

part 'notes_state.g.dart';

@freezed
class NotesState with _$NotesState {
  factory NotesState({
    // 방법1. // @Default([]) List<Note> notes, // 어노테이션으로 default값 넣는 것
    // 방법2. 아래처럼 required로 하고 note_view_model에서 초기값 넣어도 됨
    required List<Note> notes,
  }) = _NotesState;

  factory NotesState.fromJson(Map<String, dynamic> json) => _$NotesStateFromJson(json);
}