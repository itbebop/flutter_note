import 'package:sqflite/sqflite.dart';

import '../../domain/model/note.dart';

class NoteDbHelper {
  Database db;

  NoteDbHelper(this.db);

  Future<Note?> getNoteById(int id) async {
    // SELECT * FROM note WHERE id = (whereArgs)
    final List<Map<String, dynamic>> maps = await db.query(
      'note',
      where: 'id = ?',
      whereArgs: [id],
    );

    if (maps.isNotEmpty) {
      return Note.fromJson(maps.first);
    }

    return null;
  }

  Future<List<Note>> getNotes() async {
    final maps = await db.query('note'); // 'note' 테이블의 전체데이터를 가져오는 것
    return maps.map((e) => Note.fromJson(e)).toList();
  }

  Future<void> insertNote(Note note) async {
    // 여기선 return 안받는데 리턴받아서 결과 확인할 수 있음
    await db.insert('note', note.toJson());
  }

  Future<void> updateNote(Note note) async {
    await db.update(
      'note',
      note.toJson(),
      where: 'id = ?',
      whereArgs: [note.id],
    );
  }

  Future<void> deleteNote(Note note) async {
    await db.delete(
      'note',
      where: 'id = ?',
      whereArgs: [note.id],
    );
  }
}
