import 'package:flutter_note/data/data_source/note_db_helper.dart';
import 'package:flutter_note/domain/model/note.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:sqflite_common_ffi/sqflite_ffi.dart';

void main() {
  test('db test', () async {
    final db = await databaseFactoryFfi.openDatabase(inMemoryDatabasePath); // 가상 메모리를 만들어서 테스트할 것

    await db.execute(
        'CREATE TABLE note (id INTEGER PRIMARY KEY AUTOINCREMENT, title TEXT, content TEXT, color INTEGER, timestamp INTEGER)');

    final noteDbHelper = NoteDbHelper(db);

    await noteDbHelper.insertNote(Note(
      title: 'test',
      content: 'test',
      color: 1,
      timestamp: 1,
      id: 1,
    ));
    //getNotes test
    expect((await noteDbHelper.getNotes()).length, 1); // expect 함수 -> 검사하는 것 (length가 1일 것으로 기대됨)

    // getNoteById test
    Note note = (await noteDbHelper.getNoteById(1))!;
    expect(note.id, 1);

    // update test
    await noteDbHelper.updateNote(note.copyWith(title: 'change')); // note를 불변객체로 만들어서 바꾸진 못하고 copy해서 test

    note = (await noteDbHelper.getNoteById(1))!;
    expect(note.title, 'change');
    // delete test
    await noteDbHelper.deleteNote(note);
    expect((await noteDbHelper.getNotes()).length, 0);

    await db.close(); // 닫아줘야 금방 끝남
  });
}
