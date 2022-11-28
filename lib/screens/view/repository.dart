import 'package:flutter_notes/data/models.dart';
import 'package:flutter_notes/data/store.dart';

class ViewPageRepository {
  final NotesStore _notesStore;

  ViewPageRepository(this._notesStore);

  Future<Note?> getNoteById(String id) async {
    return _notesStore.getNoteById(id);
  }

  Future<void> updateNote(Note note) async {
    await _notesStore.updateNote(note);
  }

  Future<void> deleteNoteById(String id) async {
    await _notesStore.deleteNoteById(id);
  }
}