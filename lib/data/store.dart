import 'models.dart';

abstract class NotesStore {
  Future<List<Note>> getNotes();
  Stream<List<Note>> watchNotes();
  Future<Note?> getNoteById(String id);
  Future<void> addNote(Note note);
  Future<void> updateNote(Note note);
  Future<void> deleteNoteById(String id);
}

class NotesStoreImpl implements NotesStore {
  @override
  Future<void> addNote(Note note) async {
    // TODO: implement addNote
    throw UnimplementedError();
  }

  @override
  Future<void> deleteNoteById(String id) async {
    // TODO: implement deleteNoteById
    throw UnimplementedError();
  }

  @override
  Future<Note?> getNoteById(String id) async {
    // TODO: implement getNoteById
    throw UnimplementedError();
  }

  @override
  Future<List<Note>> getNotes() async {
    // TODO: implement getNotes
    throw UnimplementedError();
  }

  @override
  Future<void> updateNote(Note note) async {
    // TODO: implement updateNote
    throw UnimplementedError();
  }

  @override
  Stream<List<Note>> watchNotes() {
    // TODO: implement watchNotes
    throw UnimplementedError();
  }

}